create database eyevel;
use eyevel;

-- drop table member;
-- drop table area;
-- drop table zzim;
-- drop table comment;
-- drop table board;
-- drop table area_img;

create table member(
	id varchar(20) primary key not null, -- 유저 ID
    pw varchar(20) not null, -- 유저 PW
    name varchar(20) not null, -- 유저 이름
    email varchar(255) not null, -- 유저 이메일
    img varchar(255) not null -- 프로필 이미지
);

insert into member values ('admin', '1234', '관리자', 'admin@admin.com', 'admin.jpg');
insert into member values ('test1', '1234', 'test1', 'test@test.com', 'admin.jpg');
insert into member values('qwer', '1234a', '단비', 'test@test.com', 'profile.png');

select * from member;

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
VALUES("Seoul","한국 서울입니다","서울 여행","asia",335,770,126.976817,37.575856,1835847);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Tokyo","일본 도쿄입니다","도쿄 여행","asia",320,845,139.767107,35.681282,1850147);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Delhi","인도 델리입니다","델리 여행","asia",500,353,78.042118,27.174992,1273294);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Paris","프랑스 파리입니다","파리 여행","europe",457,419,2.295038,48.873772,2988507);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("London","영국 런던입니다","런던 여행","europe",360,368,-0.124636,51.500722,2643743);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Warsaw","폴란드 바르샤바입니다","바르샤바 여행","europe",598,391,21.014124,52.247741,7531926);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Quebec","퀘벡입니다","퀘벡 여행","northAmerica",637,220,-71.205463,46.812909,6115047);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Los Angeles","LA입니다","LA 여행","northAmerica",460,370,-117.918952,33.812100,5368361);

INSERT INTO area(name, contents, link_url, continent, dir_X,dir_Y, lon, lat, id) 
VALUES("Merida","메리다입니다","메리다 여행","northAmerica",565,470,-88.567800,20.684264,3523349);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Buenos Aires","아르헨티나","부에노스아이레스 여행","southAmerica",660,410,-57.532559,-38.012128,3435910);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Lima","페루 리마입니다","리마 여행","southAmerica",585,220,-77.046271,-12.121535,3936456);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Cascavel","브라질 카스카벨입니다","카스카벨 여행","southAmerica",744,280,-54.434885,-25.692329,3466779);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Nairobi","케냐 나이로비입니다","나이로비 여행","africa",670,280,36.861034,-1.382533,184745);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Cairo","이집트 카이로입니다","카이로 여행","africa",570,110,31.132487,29.977285,360630);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Cape Town","남아프리카공화국 케이프타운입니다","케이프타운 여행","africa",500,500,18.473985,-34.356829,3369157);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Sydney","호주 시드니입니다","시드니 여행","oceania",640,265,151.215339,-33.856775,2147714);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Christchurch","뉴질랜드 크라이스트처치입니다","크라이스트처치 여행","oceania",835,460,172.463070,-43.467099,2192362);

INSERT INTO area(name, contents, link_url, continent, dir_X, dir_Y, lon, lat, id) 
VALUES("Antarctica","남극 펭귄입니다","남극 여행","antarctica",500,500,39.263208,-69.030411,6255152);


select * from area;

create table comment(
	no int auto_increment primary key not null, -- 댓글 고유 넘버
    member_id varchar(20) not null, -- 유저 ID
    foreign key(member_id) references member(id),
    area_no int not null, -- 관광지 고유 넘버
    foreign key(area_no) references area(no),
    reg_datetime datetime not null, -- 작성일, 작성시간
    contents varchar(1000) not null -- 내용
);

-- 지역 댓글 더미 데이터
insert into comment values(null, 'test1', '1', '2024-02-27', '서울을 방문한 것은 정말로 흥미로운 경험이었습니다. 이 도시는 현대적인 건물과 전통적인 문화가 어우러져 있는 곳으로, 다양한 활동과 볼거리로 가득 차 있었습니다. 서울의 역사적인 명소들은 정말로 인상적이었습니다. 경복궁과 창경궁은 한국의 역사와 문화를 경험할 수 있는 곳으로, 그 아름다움과 풍경은 정말로 멋졌습니다. 또한, 인사동과 북촌 한옥마을에서는 전통적인 한국 문화를 느낄 수 있었는데, 그곳에서의 산책은 정말로 특별한 경험이었습니다.');
insert into comment values(null, 'qwer', '1', '2024-02-28', '도시의 현대적인 면도 매우 인상적이었습니다. 명동과 강남은 쇼핑과 엔터테인먼트를 즐길 수 있는 곳으로, 다양한 상점과 레스토랑들이 모여 있어서 시간 가는 줄 모르고 둘러볼 수 있었습니다. 또한, 남산 타워에서의 전망은 정말로 멋있었고, 도시의 경치를 한 눈에 감상할 수 있었습니다.');
insert into comment values(null, 'qwer', '1', '2024-03-01', '서울은 또한 음식 문화로도 유명합니다. 현지 음식점에서 맛본 한국 요리들은 정말로 풍부하고 맛있었는데, 특히 김치와 불고기는 정말로 인상적이었습니다. 또한, 서울의 카페 문화도 매우 발전되어 있어서, 다양한 커피숍에서 휴식을 취할 수 있었습니다. 서울을 방문하면서 한국의 다양한 면을 경험할 수 있었습니다. 역사와 현대, 전통과 현대가 공존하는 이 도시는 정말로 방문할 만한 가치가 있는 곳이었습니다.');
insert into comment values(null, 'test1', '2', '2024-02-27', '도쿄의 역사적인 명소들은 정말로 인상적이었습니다. 아사쿠사의 센소지텐은 오래된 시장과 절을 포함한 역사적인 지역으로, 그곳을 방문하면서 과거의 일본을 느낄 수 있었습니다. 또한, 메이지 신궁과 에도 성은 전통적인 일본 건축물의 아름다움을 감상할 수 있는 곳으로, 그 곳에서의 산책은 정말로 특별한 경험이었습니다. 도쿄는 또한 음식 문화로도 유명합니다. 현지 음식점에서 맛본 일본 요리들은 정말로 풍부하고 맛있었는데, 특히 라멘과 초밥은 정말로 인상적이었습니다.');
insert into comment values(null, 'test1', '3', '2024-02-27', '타지마할은 정말로 아름다운 건축물입니다. 백석으로 만들어진 그 흰색의 외관은 태양의 빛에 의해 다양한 색깔로 빛나며, 그 아름다움은 정말로 인상적이었습니다. 특히, 일몰이나 일출 때의 타지마할은 그 아름다움이 한층 더 빛을 발하며, 그 순간은 정말로 잊지 못할 순간이었습니다.');
insert into comment values(null, 'qwer', '4', '2024-02-01', '파리는 음식 문화가 다양하고 특색 있어요. 특히 현지의 맛집을 찾아 다니면서 현지인들의 문화를 느낄 수 있었습니다. 그러나 외국인 관광객을 위한 안내가 부족한 점이 아쉽습니다.');
insert into comment values(null, 'qwer', '5', '2024-02-02', '* 비밀 댓글입니다.');
insert into comment values(null, 'qwer', '6', '2024-02-03', '저는 퀘벡에서 유명한 관광 명소들을 방문했는데, 특히 도심에 위치한 공원이 정말 멋졌어요. 자연과 도시의 조화가 아름답게 어우러져 있어서 시간 가는 줄 모르고 머물고 싶었습니다.');
insert into comment values(null, 'qwer', '7', '2024-02-04', '도시 전체적으로 안전한 분위기를 느낄 수 있었고, 특히 밤에도 거리를 두루 둘러보는 것이 안전해서 좋았습니다. 현지인들의 친절함과 안전한 분위기가 도시를 여행하는데 큰 장점이었습니다.');
insert into comment values(null, 'qwer', '8', '2024-02-05', 'LA 는 교통 체계가 잘 되어 있어 이동이 편리하고, 특히 대중 교통 시스템이 효율적이에요. 하지만 최근에는 인프라 문제로 교통 체증이 심해지고 있다는 점이 아쉽습니다. 이에 대한 개선이 시급하다고 생각합니다.');
insert into comment values(null, 'qwer', '9', '2024-02-06', '저는 최근 멕시코의 메리다를 방문했고, 이 곳에서의 경험은 정말로 잊을 수 없는 것이었습니다. 메리다는 컬러풀한 건물들과 아름다운 콜로니얼 어구들로 가득한 매력적인 도시입니다. 이곳을 방문한 순간부터 멕시코의 역사와 문화에 빠져들었습니다. 우선, 메리다의 거리는 매우 활기차고 활달합니다. 낮에는 관광객들과 현지인들이 거리를 무리지어 다니며 문화 행사나 공연을 즐기고, 밤에는 레스토랑이나 바에서 식사를 하고 춤을 춥니다. 특히, 주말에는 주요 광장에서 무료 공연이 열리는데, 이곳에서 현지 문화와 음악을 경험할 수 있었습니다. 또한, 메리다는 맛있는 음식으로도 유명합니다. 현지 음식점에서 맛보는 로컬 음식들은 정말로 현지 문화를 느낄 수 있는 좋은 기회였습니다. 특히, 유명한 화이트 주스(코코넛 밀크)와 고전적인 요리들을 맛볼 수 있었는데, 이들은 멕시코의 정통음식으로 놀라운 맛을 선사했습니다. 메리다를 여행하면서 놓치지 않을 수 없는 것은 주변의 유적지들입니다. 채플라르 델 칸토, 우시링테 박물관, 친첸 이코 사이트 등의 역사적인 장소들은 멕시코의 풍부한 역사와 문화를 알 수 있는 소중한 장소들이었습니다. 좋은 날씨와 풍부한 문화, 맛있는 음식 등 메리다는 정말로 멕시코를 경험하는 데 최적의 장소 중 하나입니다. 다시 한 번 방문하고 싶은 도시 중 하나입니다.');
insert into comment values(null, 'qwer', '10', '2024-02-07', '부에노스아이레스는 탱고의 발원지로도 유명합니다. 도시 곳곳에서는 탱고 공연을 감상할 수 있었는데, 현지 음악과 춤의 아름다움은 정말로 마음을 사로잡았습니다. 특히, 산 탈모 홀(San Telmo Hall)에서의 탱고 쇼는 정말로 잊을 수 없는 경험이었습니다. 부에노스아이레스에서의 여행은 정말로 잊지 못할 경험이었습니다. 이곳을 방문하면서 아르헨티나의 역사와 문화를 경험하고, 도시의 활기찬 분위기를 느낄 수 있었습니다.');
insert into comment values(null, 'qwer', '11', '2024-02-08', '리마의 해안은 정말로 멋진 풍경을 자랑합니다. 바다가 바닥에 부딪치는 파도 소리를 들으며 산책하는 것은 정말로 평화로웠습니다. 특히, 마티네스 해변에서의 일몰은 정말로 아름다웠는데, 그 곳에서의 경치는 저의 여행에 잊지 못할 순간으로 남았습니다.');
insert into comment values(null, 'qwer', '12', '2024-02-09', '폭포를 가까이에서 바라보는 것은 정말로 숨막히는 경험이었습니다. 공원 안의 다리를 걷다가 폭포의 거대한 울림과 떨어지는 물방울의 강도를 느끼면서, 정말로 자연의 위대함을 깨닫게 되었습니다. 그 옆에 서서 아래로 내리는 물의 힘과 아름다움을 온 몸으로 체험할 수 있었습니다. 또한, 보트 투어를 통해 폭포를 더 가까이에서 경험할 수 있었습니다. 보트가 폭포에 가까이 다가가면서, 물을 튀겨내며 시원한 물줄기를 느낄 수 있었습니다. 이 때의 경험은 정말로 감동적이었고, 한 번 더 경험하고 싶다는 생각이 들었습니다. 이과수 폭포는 정말로 자연의 위대함을 체험할 수 있는 멋진 장소입니다. 그 아름다움과 힘은 정말로 인상적이었고, 폭포를 방문한 것은 제 인생에서 큰 축복 중 하나였습니다.');
insert into comment values(null, 'qwer', '13', '2024-02-10', '나이로비의 역사적인 명소들은 정말로 인상적이었습니다. 나이로비 국립 박물관은 아프리카의 다양한 문화와 역사를 자세히 알 수 있는 곳으로, 다양한 전시물과 유물들을 볼 수 있었습니다. 또한, 카렌 배노크 재단은 여러 아프리카 동물들을 보존하는 데 기여하고 있는데, 그곳을 방문하면서 사파리의 느낌을 경험할 수 있었습니다. 나이로비는 또한 자연 경관으로도 유명합니다. 나이로비 국립 공원에서는 사파리를 즐길 수 있는데, 여기서 아프리카의 다양한 동물들을 만날 수 있었습니다. 특히, 보테족이라 불리는 사자들은 정말로 멋진 모습을 자랑했습니다.');
insert into comment values(null, 'qwer', '14', '2024-02-11', '카이로는 고대 역사의 유산을 간직하고 있는 도시로서, 이집트 박물관을 방문하면서 푸른 나일 강의 지형과 수많은 고대 유물들을 감상할 수 있었습니다. 특히, 킹 툿 앙카멘의 황금 마스크와 같은 유명한 아티팩트들은 정말로 인상적이었습니다.');
insert into comment values(null, 'qwer', '15', '2024-02-12', '희망봉을 등반한 것은 저에게 큰 자부심과 만족감을 주었습니다. 이 도전적인 등반은 물리적인 힘과 정신적인 집중력을 요구했지만, 정상에서의 경치와 성취감은 모든 어려움을 가치 있게 만들어 주었습니다. 희망봉을 등반한 것은 저에게 큰 도전이었지만, 그 경험은 정말로 값진 것이었습니다. 이 도전을 통해 저는 더 많은 것을 배우고, 자신감을 얻을 수 있었으며, 특별한 순간을 경험할 수 있었습니다.');
insert into comment values(null, 'qwer', '16', '2024-02-13', '시드니는 정말로 다양한 문화와 역사를 자랑합니다. 특히 거리 골목마다 느껴지는 고유한 분위기가 매력적이에요. 저는 특히 복고풍 카페와 예술 갤러리를 찾아다니면서 시간을 보냈는데, 이곳을 방문하면서 진정한 도시의 매력을 경험할 수 있었습니다.');
insert into comment values(null, 'qwer', '17', '2024-02-14', '크라이스트처치는 문화적인 다양성을 경험할 수 있는 곳입니다. 다양한 종교와 문화가 공존하고 있어서 특색 있는 축제와 이벤트가 매력적입니다. 다양성을 경험하고 싶은 여행객에게 추천할 만한 도시입니다.');
insert into comment values(null, 'qwer', '18', '2024-02-15', '남극에서의 생활은 독특한 경험이었습니다. 얼음에 둘러싸인 황량한 환경에서 생활하면서, 산책이나 특별한 활동을 즐길 수 있었습니다. 또한, 동료들과 함께 공유하는 경험은 저의 여행에 더욱 특별한 의미를 부여했습니다. 남극을 방문하면서 자연의 위대함과 아름다움을 느낄 수 있었고, 그 고립된 환경에서의 생존력과 자연과의 조화를 경험할 수 있었습니다. 이 독특한 대륙은 정말로 방문할 만한 가치가 있는 곳이며, 그곳에서의 경험은 평생 잊지 못할 것입니다.');

select * from comment;

create table zzim(
	area_no int not null, -- 관광지 고유 넘버
    foreign key(area_no) references area(no),
    member_id varchar(20) not null, -- 유저 ID
    foreign key(member_id) references member(id)
);

-- 찜 목록 더미 데이터
insert into zzim values(1, 'qwer');
insert into zzim values(9, 'qwer');
insert into zzim values(11, 'qwer');
insert into zzim values(17, 'qwer');

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

-- 게시판 더미 데이터
insert into board values(null, 1, 1, 'test1', 'title1', 'contents1', '2024-02-26', 1, 2, 1);
insert into board values(null, 0, 1, 'admin', 'title2', 'contents2', '2024-02-26', 1, 2, 1);
insert into board values(null, 0, 1, 'admin', 'title3', 'contents3', '2024-02-26', 1, 2, 1);
insert into board values(null, 0, 1, 'admin', 'title4', 'contents4', '2024-02-26', 1, 2, 1);
insert into board values(null, 0, 1, 'admin', 'title5', 'contents5', '2024-02-26', 1, 2, 1);
insert into board values(null, 0, 1, 'admin', 'title6', 'contents6', '2024-02-26', 1, 2, 1);
insert into board values(null, 1, 1, 'admin', 'title7', 'contents7', '2024-02-26', 1, 2, 1);
insert into board values(null, 1, 1, 'admin', 'title8', 'contents8', '2024-02-26', 1, 2, 1);
insert into board values(null, 1, 1, 'admin', 'title9', 'contents9', '2024-02-26', 1, 2, 1);
insert into board values(null, 1, 1, 'admin', 'title10', 'contents10', '2024-02-26', 1, 2, 1);
insert into board values(null, 1, 1, 'admin', 'title11', 'contents11', '2024-02-26', 1, 2, 1);
insert into board values(null, 0, 1, 'admin', '필독 - 주의사항', '비속어 사용 시에는 즉시 탈퇴 처리당할 수 있음을 알려드립니다.', '2024-02-25', 0, 0, 1);
insert into board values(null, 0, 1, 'admin', '필독 - 공지사항', '건의 사항 작성 시에는 원하는 나라명과 도시명을 정확히 기재하시고 이유를 작성해 주시길 바랍니다.', '2024-02-25', 0, 0, 1);
insert into board values(null, 1, 1, 'qwer', '여행사이트 서비스 향상을 위한 건의 사항', '아직 나라가 너무 없는 거 같습니다. 좀 더 추가해 주세요', '2024-02-28', 0, 0, 1);
insert into board values(null, 1, 1, 'qwer', '추가해 주세요', '스페인 바르셀로나를 추가해 주세요. 제가 꼭 가보고 싶은 도시중 하나인데 인터넷 검색 말고는 정보가 너무 없는 것 같습니다', '2024-03-02', 0, 0, 1);

-- 자주 묻는 더미 질문
insert into board values(null, 90, 1, 'admin', '질문1', '답변1', '2024-02-26', 1, 2, 1);
insert into board values(null, 90, 1, 'admin', '질문2', '답변2', '2024-02-26', 1, 2, 1);
insert into board values(null, 91, 1, 'admin', '질문3', '답변3', '2024-02-26', 1, 2, 1);
insert into board values(null, 91, 1, 'admin', '질문4', '답변4', '2024-02-26', 1, 2, 1);
insert into board values(null, 91, 1, 'admin', '질문5', '답변5', '2024-02-26', 1, 2, 1);
insert into board values(null, 92, 1, 'admin', '질문6', '답변6', '2024-02-26', 1, 2, 1);
insert into board values(null, 93, 1, 'admin', '질문7', '답변7', '2024-02-26', 1, 2, 1);
insert into board values(null, 94, 1, 'admin', '질문8', '답변8', '2024-02-26', 1, 2, 1);

select * from board;

-- 게시글 좋아요 테이블
create table boardlike(
	board_no int not null, -- 게시글 고유 넘버
    foreign key(board_no) references board(no),
    member_id varchar(20) not null, -- 유저 ID
    foreign key(member_id) references member(id)
);

select * from boardlike;

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

-- 게시판 댓글 더미 데이터
insert into boardcomment values(null, 1, '안녕하세요', 'qwer', '2024-03-06');
insert into boardcomment values(null, 2, '안녕하세요', 'qwer', '2024-03-06');
insert into boardcomment values(null, 3, '안녕하세요', 'qwer', '2024-03-06');
insert into boardcomment values(null, 4, '안녕하세요', 'qwer', '2024-03-06');
insert into boardcomment values(null, 5, '안녕하세요', 'qwer', '2024-03-06');
insert into boardcomment values(null, 6, '안녕하세요', 'qwer', '2024-03-06');
insert into boardcomment values(null, 7, '안녕하세요', 'qwer', '2024-03-06');
insert into boardcomment values(null, 8, '안녕하세요', 'qwer', '2024-03-06');
insert into boardcomment values(null, 9, '안녕하세요', 'qwer', '2024-03-06');
insert into boardcomment values(null, 10, '안녕하세요', 'qwer', '2024-03-06');
insert into boardcomment values(null, 11, '안녕하세요', 'qwer', '2024-03-06');
insert into boardcomment values(null, 14, '공지 사항을 안 읽어봤었네요. 죄송합니다', 'qwer', '2024-03-01');

select * from boardComment;