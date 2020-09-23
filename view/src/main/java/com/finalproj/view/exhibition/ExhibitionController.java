package com.finalproj.view.exhibition;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.finalproj.view.business.BusinessDTO;
import com.finalproj.view.business.BusinessService;
import com.finalproj.view.common.PagingBean;
import com.finalproj.view.customer.CustomerDTO;
import com.finalproj.view.customer.CustomerService;
import com.finalproj.view.customer.InterestDTO;
import com.finalproj.view.customer.InterestService;
import com.finalproj.view.hashtag.HashtagDTO;
import com.finalproj.view.hashtag.HashtagService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
@Controller
public class ExhibitionController {
	@Autowired
	private ExhibitionService es;
	@Autowired
	private HashtagService hs;
	@Autowired
	private InterestService is;
	@Autowired
	private BusinessService bs;
	@Autowired
	private CustomerService cs;
	
	@PostConstruct
	public void init() {
		es.autoDelete();
	}
  
	@RequestMapping("exList")
	public String exList(String pageNum, String keyword, String listType, String alignment, HttpSession session, Model model) throws ParseException {
		
		if (alignment == null || alignment.equals("")) {
			alignment = "reg_date";
		}
		
		if (session.getAttribute("c_id") != null) { 	// 로그인이 되어있을 시
			if (listType != null && listType != "") { 	// My #HASH 리스트를 보려고 할 때
				String c_id = (String)session.getAttribute("c_id");
				CustomerDTO customer = cs.select(c_id);
				keyword = customer.getC_hashtag();
			}
		}
		
		Collection<ExhibitionDTO> list = new ArrayList<ExhibitionDTO>();
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int total = 0;
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 5;
		int startRow = (currentPage - 1) * rowPerPage;
		
		if (keyword == null || !keyword.startsWith("{")) {	// ALL 혹은 #HASH 클릭으로 인한 단일 #HASH 리스트를 보려고 할 때
			total = es.getTotal(keyword);
			list = es.list(startRow, rowPerPage, keyword, alignment);
		} else {											// My #HASH 혹은 By HASH 리스트를 보려고 할 때
			JSONParser jp = new JSONParser();
			JSONObject jo;
			jo = (JSONObject)jp.parse(keyword);
			JSONArray ja = (JSONArray)jo.get("hash");
			String c = ja + "";
			Gson gson = new Gson();
			String[] tags = gson.fromJson(c, String[].class);
			total = es.getCompTotal(tags);
			list = es.compList(startRow, rowPerPage, tags, alignment);
			if (session.getAttribute("c_id") != null) {
				if (listType != null && listType != "") {
					keyword = null;
				}
			}
		}
		
		PagingBean page = new PagingBean(currentPage, rowPerPage, total);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("listType", listType);
		model.addAttribute("alignment", alignment);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "exhibition/exList";
	}
	
	@RequestMapping("/biz/exList")
	public String bizExList(String pageNum, HttpSession session, Model model) throws ParseException {
		Collection<ExhibitionDTO> list = new ArrayList<ExhibitionDTO>();
		String b_id = (String) session.getAttribute("b_id");
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int total = es.getBizTotal(b_id);
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 5;
		int startRow = (currentPage - 1) * rowPerPage;
		
		list = es.bizList(startRow, rowPerPage, b_id);
		
		PagingBean page = new PagingBean(currentPage, rowPerPage, total);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "business/exList";
	}
	
	@RequestMapping("/biz/exWriteForm")
	private String exWriteForm(HttpSession session, Model model) {
		List<HashtagDTO> hashList = hs.hashList();
		String b_id = (String) session.getAttribute("b_id");
		BusinessDTO biz = bs.select(b_id);
		if (biz.getConfirm().equals("c") || biz.getConfirm().equals("n")) {
			return "exhibition/exWriteCancle";
		} else {
			model.addAttribute("hashList", hashList);
			return "exhibition/exWriteForm";
		}
	}
	@RequestMapping("exWrite")
	private String exWrite(ExhibitionDTO ex, Model model, HttpSession session) throws ParseException {
		int result = 0;
		String realPath = session.getServletContext().getRealPath("/resources/exImg");
		MultipartFile poster = ex.getFile();
		String fileName = UUID.randomUUID().toString().replace("-", "") + "_" + poster.getOriginalFilename();
		try {
			poster.transferTo(new File(realPath + File.separator + fileName));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("업로드 오류");
		}
		ex.setFilename(fileName);
		
		/* JSON파싱 */
        JSONParser jp = new JSONParser();
        JSONObject jo;
        jo = (JSONObject)jp.parse(ex.getHashtags());
        JSONArray ja = (JSONArray)jo.get("hash");
        String c = ja + "";
        Gson gson = new Gson();
        String[] tags = gson.fromJson(c, String[].class);
        for (int i = 0; i < tags.length; i++) {
        	hs.usedHash(tags[i]);
        }
		
		if (ex.getSub_address() != null) {
			String addr = ex.getAddress() + ", " + ex.getSub_address();
			ex.setAddress(addr);
		}
		
		result = es.insert(ex);
		
		model.addAttribute("exhibition_no", ex.getExhibition_no());
		model.addAttribute("result", result);
		return "exhibition/exWrite";
	}
	@RequestMapping("exView")
	private String exView(int exhibition_no, String pageNum, String myList, HttpSession session, Model model) throws ParseException {
		ExhibitionDTO ex = es.view(exhibition_no);
		
		String c_id = (String) session.getAttribute("c_id");
		int heart = is.iconChk(exhibition_no, c_id);
		
		String[] addr = ex.getAddress().split(",");
		
		/* JSON파싱 */
        JSONParser jp = new JSONParser();
        JSONObject jo;
        jo = (JSONObject)jp.parse(ex.getHashtags());
        JSONArray ja = (JSONArray)jo.get("hash");
        String c = ja + "";
        Gson gson = new Gson();
        String[] tags = gson.fromJson(c, String[].class);
        List<HashtagDTO> postedHash = new ArrayList<HashtagDTO>();
        for (int i = 0; i < tags.length; i++) {
        	HashtagDTO selected =  hs.select(tags[i]);
        	postedHash.add(selected);
        }
        
        String[] t_links = new String[3];
        t_links[0] = ex.getTicket_link1();
        t_links[1] = ex.getTicket_link2();
        t_links[2] = ex.getTicket_link3();
		
        model.addAttribute("t_links", t_links);
        model.addAttribute("addr", addr[0]);
        model.addAttribute("myList", myList);
        model.addAttribute("heart", heart);
		model.addAttribute("ex", ex);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("postedHash", postedHash);
		return "exhibition/exView";
	}
	
	@RequestMapping(value="ckUpload", method = RequestMethod.POST)
	public void imgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload)
			throws Exception {
		String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources");		
		
		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("application/json");

		try {
			String fileName = UUID.randomUUID().toString().replace("-", "") + "_" + upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + fileName;									

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

			printWriter = res.getWriter();
			String fileUrl = req.getContextPath() + "/ckUpload/" + fileName; // 작성화면
			
			// 업로드시 메시지 출력
			JsonObject json = new JsonObject();
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", fileName);
			json.addProperty("url", fileUrl);
			
			printWriter.println(json);
			printWriter.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	@RequestMapping("/biz/exUpdateForm")
	public String exUpdateForm(int exhibition_no, String pageNum, Model model) throws ParseException {
		ExhibitionDTO ex = es.select(exhibition_no);
		String[] addr = ex.getAddress().split(", ");
		List<HashtagDTO> hashList = hs.hashList();
		
		/* JSON파싱 */
        JSONParser jp = new JSONParser();
        JSONObject jo;
        jo = (JSONObject)jp.parse(ex.getHashtags());
        JSONArray ja = (JSONArray)jo.get("hash");
        String c = ja + "";
        Gson gson = new Gson();
        String[] tags = gson.fromJson(c, String[].class);
        List<String> postedHash = new ArrayList<String>();
        for (int i = 0; i < tags.length; i++) {
        	postedHash.add("\""+tags[i]+"\"");
        }
        
        model.addAttribute("hashList", hashList);
		model.addAttribute("postedHash", postedHash);
		model.addAttribute("ex", ex);
		model.addAttribute("addr", addr[0]);
		if (addr.length == 2) {
			model.addAttribute("sub_addr", addr[1]);
		}
		model.addAttribute("pageNum", pageNum);
		return "exhibition/exUpdateForm";
	}
	@RequestMapping("exUpdate")
	public String exUpdate(ExhibitionDTO ex, String pageNum, Model model, HttpSession session) {	
		if (ex.getFileChange().equals("y")) {
			String realPath = session.getServletContext().getRealPath("/resources/exImg");
			MultipartFile poster = ex.getFile();
			String fileName = UUID.randomUUID().toString().replace("-", "") + "_" + poster.getOriginalFilename();
			try {
				poster.transferTo(new File(realPath + File.separator + fileName));
			} catch (Exception e) {
				System.out.println("업로드 오류");
			}
			ex.setFilename(fileName);	
		} else {
			ex.setFilename(ex.getOldFilename());
		}
		if (ex.getSub_address() != null) {
			String addr = ex.getAddress() + ", " + ex.getSub_address();
			ex.setAddress(addr);
		}
		int result = es.update(ex);
		
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "exhibition/exUpdate";
	}
	@RequestMapping("/biz/exDelete")
	public String exDelete(int exhibition_no, String pageNum, Model model) {
		int result = es.delete(exhibition_no);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "exhibition/exDelete";
	}
	
	@RequestMapping("/biz/exSearchForm")
	public String exDelete() {
		return "exhibition/exSearchForm";
	}
}