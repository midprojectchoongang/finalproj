-- view table
create table business (
	b_id varchar(20) not null primary key,
	b_password varchar(20) not null,
	groupName varchar(100) not null,
	ceoName varchar(20) not null,
	tel varchar(20) not null,  
	email varchar(50) not null,
	groupkind varchar(20) not null,
	licensee varchar(20), -- 사업자 
	corporation varchar(20), -- 법인
	etc varchar(20), -- 기타
	website varchar(50), 
	confirm varchar(20) not null default 'n',
	reg_date date not null,
	del char(1) default 'n'
);

create table customer (
	c_id varchar(20) not null primary key,
	c_password varchar(20) not null,
	nickname varchar(20) not null,
	email varchar(50) not null,
	c_hashtag varchar(300), -- 개인 선호 해쉬태그
	c_role varchar(20) not null default 'customer',
	reg_date date not null,
	del char(1) default 'n'
);

create table exhibition (
	exhibition_no int not null primary key auto_increment, 
	b_id varchar(20) not null references business(b_id), 
	title varchar(100) not null,
	artist varchar(100) not null,
	gallery varchar(50) not null,
	gallery_site varchar(100),
	local_no int(10) not null references local(local_no),
	address varchar(200) not null,
	ticket_link1 varchar(300),
	ticket_link2 varchar(300),
	ticket_link3 varchar(300),
	price int(10) not null,  
	start_date date not null,
	end_date date not null,
	hashtags varchar(2000) not null,
	content varchar(2000) not null,
	like_cnt int(10) default 0,
	reg_date date not null,
	del char(1) default 'n'
);

create table ticketbook (
	ticketbook_no int not null primary key auto_increment,
	c_id varchar(20) not null references customer(c_id),
	title varchar(50) not null,
	content varchar(2000) not null,
	filename varchar(100) not null,
	visit_date date not null,
	reg_date date not null,
	del char(1) default 'n'
);  

create table hashtag (
	hashgroup int,
	hash_title varchar(100) not null primary key,
	kind varchar(10) not null,
	use_count int default 0
); 

select * from hashtag;

insert into hashtag (hashgroup, hash_title, kind) values ('1', '조각', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('1', '회화', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('1', '공예', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('1', '건축', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('1', '설치', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('1', '사진', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('2', '고전', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('2', '중세', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('2', '근대', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('2', '현대', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('3', '국내작가', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('3', '해외작가', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('3', '동양미술', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('3', '서양미술', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('4', '상설전시', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('4', '특별전시', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('4', '기획전시', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('4', '국제교류전시', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('4', '체험형', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('5', '무료입장', 'basic');
insert into hashtag (hashgroup, hash_title, kind) values ('5', '기념품샵', 'basic');

create table interest (
	interest_no int primary key auto_increment,
	exhibition_no int references exhibition(exhibition_no),  
	c_id varchar(20) not null references customer(c_id), 
	reg_date date not null,
	del char(1) default 'n'
);

create table comment (
	comment_no int primary key auto_increment,
	c_id varchar(20) not null references customer(c_id),
	content varchar(2000) not null,
	reg_date date not null,
	del char(1) default 'n'
); 

create table imageEx (
	imageEx_name varchar(100) not null primary key, 
	exhibition_no int references exhibition(exhibition_no)
);

create table local (
	local_no int(10) not null primary key, 
	local_name varchar(20) not null
);