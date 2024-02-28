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

insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("서울","서울은 대한민국의 수도로, 전통과 현대가 공존하는 도시입니다. 고궁, 전통시장, 한강의 아름다운 풍경과 함께 최첨단 건축물, 쇼핑몰, 세계적인 음식 문화를 경험할 수 있습니다. 역사적 명소와 문화의 거리, 다채로운 먹거리와 쇼핑, 활기찬 나이트라이프까지, 서울은 방문객에게 잊지 못할 추억을 선사합니다.","viIhOorr11I?si=aOuXe9YNoefW62Jm","asia",0,0,0,0,0);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("도쿄","도쿄는 일본의 수도로, 놀라운 기술, 전통과 현대 문화의 완벽한 조화를 경험할 수 있는 세계적인 메트로폴리스입니다. 고즈넉한 신사와 정원에서부터 번화한 시부야와 긴자의 쇼핑가, 미슐랭 스타 레스토랑까지, 도쿄는 다양한 매력을 지닌 도시입니다. 애니메이션과 패션의 중심지로도 유명하며, 방문객들은 전통과 혁신이 어우러진 도쿄의 독특한 분위기를 만끽할 수 있습니다.","viIhOorr11I?si=aOuXe9YNoefW62Jm","asia",0,0,139.6917,35.6895,1850147);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("델리","인도 델리입니다","-Xlzej8RTTU?si=-39hgQMewDeuAYd2","asia",0,0,77.2167,28.6667,1273294);

insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("파리","프랑스 파리입니다","WHNNHAoaZD4?si=bcO4MTWWc_BgOm6m","europe",0,0,2.3488,48.8534,2988507);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("런던","영국 런던입니다","G5V4wBjR880?si=PndS_YaRq_f2FhnD","europe",0,0,-0.1257,51.5085,2643743);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("바르샤바","폴란드 바르샤바입니다","FcjeOHCLaDQ?si=6LkLU63AhNeBPp23","europe",0,0,21.0614,52.2331,7531926);

insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("퀘벡","퀘벡입니다","b0skYkjbZto?si=ytqkvMKBdiNnPww4","northAmerica",0,0,-71.9991,52.0002,6115047);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("로스엔젤리스","LA입니다","o-U7UlZ6vcA?si=Y0NMpejwHHJfUyBt","northAmerica",0,0,-118.2437,34.0522,5368361);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("메리다","메리다입니다","_h5SnqZVtD4?si=RatABxh1e9eNJu-B","northAmerica",0,0,-89.6167,20.9667,3523349);

insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("부에노스아이레스","아르헨티나","oTDXnAXw66Y?si=IMh5o3iO29UqiQKn","southAmerica",0,0,-58.3772,-34.6132,3435910);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("리마","페루 리마입니다","dk-NdzCrxvw?si=XnlFFt_iXXhOtlGh","southAmerica",0,0,-77.0282,-12.0432,3936456);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("카스카벨","브라질 카스카벨입니다","5R3eZqy-_gc?si=6kwg0u7q1b64HaQn","southAmerica",0,0,-53.4553,-24.9558,3466779);

insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("나이로비","케냐 나이로비입니다","RNPk-cx5NgE?si=TxMoCC-zOGS8sKP7","africa",0,0,36.8167,-1.2833,184745);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("카이로","이집트 카이로입니다","6OhdZ9TurMs?si=Vm_DokeGFZeKTDJF","africa",0,0,31.2497,30.0626,360630);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("케이프타운","남아프리카공화국 케이프타운입니다","69DzEF_RAcA?si=wESARcCaGB1FF0GN","africa",0,0,18.4232,-33.9258,3369157);

insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("시드니","호주 시드니입니다","2QVwEWIKMI8?si=Vd3gdmeuiUqdvpPq","oceania",0,0,151.2073,-33.8679,2147714);
insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("크라이스트처치","뉴질랜드 크라이스트처치입니다","JuKUY0yKeaI?si=KYu45NJQ3vJf-pX1","oceania",0,0,172.6333,-43.5333,2192362);

insert into area(name, contents, link_url,continent,dir_X,dir_Y, lon, lat, id) values("남극","남극 펭귄입니다","OfO6zxvhtBg?si=uacMkJOK2moZadJA","antarctica",0,0,18.4232,-33.9258,6255152);

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


insert into comment(null,'test1','1','2024-02-27','댓글입니다');
insert into comment(null,'test1','1','2024-02-27','댓글입니다2');
insert into comment(null,'test1','2','2024-02-27','댓글입니다');
insert into comment(null,'test1','3','2024-02-27','댓글입니다');


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



-- 자주 묻는 더미 질문
insert into board values(null, 90, 1, 'admin', '질문1', '답변1', '2024-02-26', 1, 2, 1);
insert into board values(null, 90, 1, 'admin', '질문2', '답변2', '2024-02-26', 1, 2, 1);
insert into board values(null, 91, 1, 'admin', '질문3', '답변3', '2024-02-26', 1, 2, 1);
insert into board values(null, 91, 1, 'admin', '질문4', '답변4', '2024-02-26', 1, 2, 1);
insert into board values(null, 91, 1, 'admin', '질문5', '답변5', '2024-02-26', 1, 2, 1);
insert into board values(null, 92, 1, 'admin', '질문6', '답변6', '2024-02-26', 1, 2, 1);
insert into board values(null, 93, 1, 'admin', '질문7', '답변7', '2024-02-26', 1, 2, 1);
insert into board values(null, 94, 1, 'admin', '질문8', '답변8', '2024-02-26', 1, 2, 1);
