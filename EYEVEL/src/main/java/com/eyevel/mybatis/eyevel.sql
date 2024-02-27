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
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("seoul","서울은 대한민국의 수도로, 전통과 현대가 공존하는 도시입니다. 고궁, 전통시장, 한강의 아름다운 풍경과 함께 최첨단 건축물, 쇼핑몰, 세계적인 음식 문화를 경험할 수 있습니다. 역사적 명소와 문화의 거리, 다채로운 먹거리와 쇼핑, 활기찬 나이트라이프까지, 서울은 방문객에게 잊지 못할 추억을 선사합니다.","viIhOorr11I?si=aOuXe9YNoefW62Jm",0,0,0,0,0,0);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("도쿄","도쿄는 일본의 수도로, 놀라운 기술, 전통과 현대 문화의 완벽한 조화를 경험할 수 있는 세계적인 메트로폴리스입니다. 고즈넉한 신사와 정원에서부터 번화한 시부야와 긴자의 쇼핑가, 미슐랭 스타 레스토랑까지, 도쿄는 다양한 매력을 지닌 도시입니다. 애니메이션과 패션의 중심지로도 유명하며, 방문객들은 전통과 혁신이 어우러진 도쿄의 독특한 분위기를 만끽할 수 있습니다.","viIhOorr11I?si=aOuXe9YNoefW62Jm",0,0,0,139.6917,35.6895,1850147);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("델리","인도 델리입니다","-Xlzej8RTTU?si=-39hgQMewDeuAYd2",0,0,0,77.2167,28.6667,1273294);

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