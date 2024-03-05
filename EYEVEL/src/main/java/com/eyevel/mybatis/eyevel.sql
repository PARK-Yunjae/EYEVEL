create database eyevel;
use eyevel;

drop table member;
drop table area;
drop table zzim;
drop table comment;
drop table board;
drop table area_img;

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
    continent varchar(20) not null, -- 대륙
    dir_X int not null, -- x 좌표
    dir_Y int not null, -- y 좌표
    lon float not null, -- 경도
    lat float not null, -- 위도
    id int not null -- 관광지 ID
);
INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Seoul","한국 서울입니다","서울 여행","asia",770,335,126.976817,37.575856,1835847);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Tokyo","일본 도쿄입니다","도쿄 여행","asia",845,320,139.767107,35.681282,1850147);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Delhi","인도 델리입니다","델리 여행","asia",460,455,78.042118,27.174992,1273294);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Paris","프랑스 파리입니다","파리 여행","europe",320,355,2.295038,48.873772,2988507);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("London","영국 런던입니다","런던 여행","europe",380,415,-0.124636,51.500722,2643743);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Warsaw","폴란드 바르샤바입니다","바르샤바 여행","europe",510,370,21.014124,52.247741,7531926);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Quebec","퀘벡입니다","퀘벡 여행","northAmerica",615,205,-71.205463,46.812909,6115047);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Los Angeles","LA입니다","LA 여행","northAmerica",325,340,-117.918952,33.812100,5368361);

INSERT INTO area(name, contents, link_url, continent, dir_X,dir_Y, lon, lat, id) 
VALUES("Merida","메리다입니다","메리다 여행","northAmerica",530,470,-88.567800,20.684264,3523349);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Buenos Aires","아르헨티나","부에노스아이레스 여행","southAmerica",575,410,-57.532559,-38.012128,3435910);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Lima","페루 리마입니다","리마 여행","southAmerica",510,220,-77.046271,-12.121535,3936456);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Cascavel","브라질 카스카벨입니다","카스카벨 여행","southAmerica",700,280,-54.434885,-25.692329,3466779);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Nairobi","케냐 나이로비입니다","나이로비 여행","africa",670,280,36.8167,-1.2833,184745);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Cairo","이집트 카이로입니다","카이로 여행","africa",570,110,31.2497,30.0626,360630);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Cape Town","남아프리카공화국 케이프타운입니다","케이프타운 여행","africa",500,500,18.4232,-33.9258,3369157);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Sydney","호주 시드니입니다","시드니 여행","oceania",640,265,151.2073,-33.8679,2147714);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Christchurch","뉴질랜드 크라이스트처치입니다","크라이스트처치 여행","oceania",835,460,172.6333,-43.5333,2192362);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Antarctica","남극 펭귄입니다","남극 여행","antarctica",500,500,18.4232,-33.9258,6255152);

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


insert into comment values(null,'test1','1','2024-02-27','댓글입니다');
insert into comment values(null,'test1','1','2024-02-27','댓글입니다2');
insert into comment values(null,'test1','2','2024-02-27','댓글입니다');
insert into comment values(null,'test1','3','2024-02-27','댓글입니다');


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
    weather varchar(10) not null, -- 날씨 속성값
    img varchar(255) not null -- 이미지 파일명
);

insert into area_img values(1,'Clear','gwanghwamun_sunny');
insert into area_img values(1,'Clouds','gwanghwamun_cloudy');
insert into area_img values(1,'Snow','gwanghwamun_snowy');
insert into area_img values(1,'Rain','gwanghwamun_rainy');
insert into area_img values(2,'Clear','Tokyo station_sunny');
insert into area_img values(2,'Clouds','Tokyo station_cloudy');
insert into area_img values(2,'Snow','Tokyo station_snowy');
insert into area_img values(2,'Rain','Tokyo station_rainy');
insert into area_img values(3,'Clear','Taj Mahal_sunny');
insert into area_img values(3,'Clouds','Taj Mahal_cloudy');
insert into area_img values(3,'Snow','Taj Mahal_snowy');
insert into area_img values(3,'Rain','Taj Mahal_rainy');
insert into area_img values(4,'Clear','Triumphal Arch_sunny');
insert into area_img values(4,'Clouds','Triumphal Arch_cloudy');
insert into area_img values(4,'Snow','Triumphal Arch_snowy');
insert into area_img values(4,'Rain','Triumphal Arch_rainy');
insert into area_img values(5,'Clear','bigben_sunny');
insert into area_img values(5,'Clouds','bigben_cloudy');
insert into area_img values(5,'Snow','bigben_snowy');
insert into area_img values(5,'Rain','bigben_rainy');
insert into area_img values(6,'Clear','warsaw_sunny');
insert into area_img values(6,'Clouds','warsaw_cloudy');
insert into area_img values(6,'Snow','warsaw_snowy');
insert into area_img values(6,'Rain','warsaw_rainy');
insert into area_img values(7,'Clear','old Quebec_sunny');
insert into area_img values(7,'Clouds','old Quebec_cloudy');
insert into area_img values(7,'Snow','old Quebec_snowy');
insert into area_img values(7,'Rain','old Quebec_rainy');
insert into area_img values(8,'Clear','disneyland_sunny');
insert into area_img values(8,'Clouds','disneyland_cloudy');
insert into area_img values(8,'Snow','disneyland_snowy');
insert into area_img values(8,'Rain','disneyland_rainy');
insert into area_img values(9,'Clear','Chichen Itza_sunny');
insert into area_img values(9,'Clouds','Chichen Itza_cloudy');
insert into area_img values(9,'Snow','Chichen Itza_snowy');
insert into area_img values(9,'Rain','Chichen Itza_rainy');
insert into area_img values(10,'Clear','Mar del Plata_sunny');
insert into area_img values(10,'Clouds','Mar del Plata_cloudy');
insert into area_img values(10,'Snow','Mar del Plata_snowy');
insert into area_img values(10,'Rain','Mar del Plata_rainy');
insert into area_img values(11,'Clear','miraflores_sunny');
insert into area_img values(11,'Clouds','miraflores_cloudy');
insert into area_img values(11,'Snow','miraflores_snowy');
insert into area_img values(11,'Rain','miraflores_rainy');
insert into area_img values(12,'Clear','iguazu_sunny');
insert into area_img values(12,'Clouds','iguazu_cloudy');
insert into area_img values(12,'Snow','iguazu_snowy');
insert into area_img values(12,'Rain','iguazu_rainy');
insert into area_img values(13,'Clear','Nairobi National Park_sunny');
insert into area_img values(13,'Clouds','Nairobi National Park_cloudy');
insert into area_img values(13,'Snow','Nairobi National Park_snowy');
insert into area_img values(13,'Rain','Nairobi National Park_rainy');
insert into area_img values(14,'Clear','pyramid_sunny');
insert into area_img values(14,'Clouds','pyramid_cloudy');
insert into area_img values(14,'Snow','pyramid_snowy');
insert into area_img values(14,'Rain','pyramid_rainy');
insert into area_img values(15,'Clear','Cape of Good Hope_sunny');
insert into area_img values(15,'Clouds','Cape of Good Hope_cloudy');
insert into area_img values(15,'Snow','Cape of Good Hope_snowy');
insert into area_img values(15,'Rain','Cape of Good Hope_rainy');
insert into area_img values(16,'Clear','Opera House_sunny');
insert into area_img values(16,'Clouds','Opera House_cloudy');
insert into area_img values(16,'Snow','Opera House_snowy');
insert into area_img values(16,'Rain','Opera House_rainy');
insert into area_img values(17,'Clear','Orana Wildlife Park_sunny');
insert into area_img values(17,'Clouds','Orana Wildlife Park_cloudy');
insert into area_img values(17,'Snow','Orana Wildlife Park_snowy');
insert into area_img values(17,'Rain','Orana Wildlife Park_rainy');
insert into area_img values(18,'Clear','Antarctica_sunny');
insert into area_img values(18,'Clouds','Antarctica_cloudy');
insert into area_img values(18,'Snow','Antarctica_snowy');
insert into area_img values(18,'Rain','Antarctica_rainy');


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
insert into board values(null, 0, 1, 'test1', 'title2', 'contents2', '2024-02-26', 1, 2, 1);
insert into board values(null, 0, 1, 'admin', 'title3', 'contents3', '2024-02-26', 1, 2, 1);
insert into board values(null, 0, 1, 'admin', 'title4', 'contents4', '2024-02-26', 1, 2, 1);
insert into board values(null, 0, 1, 'admin', 'title5', 'contents5', '2024-02-26', 1, 2, 1);
insert into board values(null, 0, 1, 'admin', 'title6', 'contents6', '2024-02-26', 1, 2, 1);
insert into board values(null, 1, 1, 'admin', 'title7', 'contents7', '2024-02-26', 1, 2, 1);
insert into board values(null, 1, 1, 'admin', 'title8', 'contents8', '2024-02-26', 1, 2, 1);
insert into board values(null, 1, 1, 'admin', 'title9', 'contents9', '2024-02-26', 1, 2, 1);
insert into board values(null, 1, 1, 'admin', 'title10', 'contents10', '2024-02-26', 1, 2, 1);
insert into board values(null, 1, 1, 'admin', 'title11', 'contents11', '2024-02-26', 1, 2, 1);

-- 자주 묻는 더미 질문
insert into board values(null, 90, 1, 'admin', '질문1', '답변1', '2024-02-26', 1, 2, 1);
insert into board values(null, 90, 1, 'admin', '질문2', '답변2', '2024-02-26', 1, 2, 1);
insert into board values(null, 91, 1, 'admin', '질문3', '답변3', '2024-02-26', 1, 2, 1);
insert into board values(null, 91, 1, 'admin', '질문4', '답변4', '2024-02-26', 1, 2, 1);
insert into board values(null, 91, 1, 'admin', '질문5', '답변5', '2024-02-26', 1, 2, 1);
insert into board values(null, 92, 1, 'admin', '질문6', '답변6', '2024-02-26', 1, 2, 1);
insert into board values(null, 93, 1, 'admin', '질문7', '답변7', '2024-02-26', 1, 2, 1);
insert into board values(null, 94, 1, 'admin', '질문8', '답변8', '2024-02-26', 1, 2, 1);

-- 게시글 좋아요 테이블
create table boardlike(
	board_no int not null, -- 게시글 고유 넘버
    foreign key(board_no) references board(no),
    member_id varchar(20) not null, -- 유저 ID
    foreign key(member_id) references member(id)
);

-- 게시글 댓글 테이블
create table boardComment(
	no int auto_increment primary key not null, -- 게시글 댓글 고유 넘버
	board_no int not null,	-- 게시글 번호
	foreign key(board_no) references board(no),
	comment varchar(1000) not null, -- 댓글 내용
	member_id varchar(20) not null,
    foreign key(member_id) references member(id),
	reg_datetime datetime not null -- 작성일, 작성시간
);