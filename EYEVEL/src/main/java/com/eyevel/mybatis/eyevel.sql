create database eyevel;
use eyevel;

create table member(
	id varchar(20) primary key not null, -- 유저 ID
    pw varchar(20) not null, -- 유저 PW
    name varchar(20) not null, -- 유저 이름
    email varchar(255) not null, -- 유저 이메일
    img varchar(255) not null -- 프로필 이미지
);
insert into member values ('admin', '1234', '관리자', 'admin@admin.com', 'admin.jpg');
select * from member;
insert into member values ('test1', '1234', 'test1', 'test@test.com', 'admin.jpg');
create table area(
	no int auto_increment primary key not null, -- 관광지 고유 넘버
    name varchar(255) not null, -- 관광지 이름
    contents varchar(1000) not null, -- 관광지 설명
    link_url varchar(1000) not null, -- 동영상 링크
    continent int not null, -- 대륙
    dir_X int not null, -- x 좌표
    dir_Y int not null, -- y 좌표
    lon float not null, -- 경도
    lat float not null, -- 위도
    id int not null -- 관광지 ID
);

select * from area;

create table comment(
	no int auto_increment primary key not null, -- 댓글 고유 넘버
    member_id varchar(20) not null, -- 유저 ID
    foreign key(member_id) references member(id),
    area_no int not null, -- 관광지 고유 넘버
    foreign key(area_no) references area(no),
    reg_datetime datetime not null, -- 작성일, 작성시간
    contents varchar(255) not null -- 내용
);

select * from comment;

create table zzim(
	area_no int not null, -- 관광지 고유 넘버
    foreign key(area_no) references area(no),
    member_id varchar(20) not null, -- 유저 ID
    foreign key(member_id) references member(id)
);

select * from zzim;

create table area_img(
	area_no int not null, -- 관광지 고유 넘버
    foreign key(area_no) references area(no),
    weather int not null, -- 날씨 속성값
    img varchar(255) not null -- 이미지 파일명
);

select * from area_img;

create table board(
	no int auto_increment primary key not null, -- 게시글 고유 넘버
    category int not null, -- 게시글 종류 (공지, 건의)
    is_private int not null, -- 공개 여부
    member_id varchar(20) not null, -- 유저 ID
    foreign key(member_id) references member(id),
    title varchar(255) not null, -- 제목
    contents varchar(1000) not null, -- 내용
    reg_date datetime not null, -- 작성일
    hits int not null, -- 조회수
    heart int not null, -- 좋아요
    admin_check int not null -- 관리자 확인 유무
);

select * from board;
insert into board values(null, 1, 1, 'test1', 'title1', 'contents1', '2024-02-26', 1, 2, 1);