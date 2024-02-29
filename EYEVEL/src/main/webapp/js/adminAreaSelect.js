let select_image = document.querySelector(".select_image");
let select_img = document.querySelector('.select_img');
let continent_nav_li = document.querySelectorAll('.continent_nav li');
let select_btn = document.querySelector('.select_btn');

let offY = 0;
let offX = 0;

modalMsgWarning("확인","관광지 위치를 확인하기 위해<br>관광지의 위치를 지도에서 선택해주세요")

continent_nav_li.forEach(e=>{
	e.addEventListener('click', ()=>{
		continent_nav_li.forEach(en=>{
			en.classList.remove('on');
		})
		e.classList.add('on');
	})
})

// 대륙을 클릭 했을때 다른 이미지 띄워주기
function selectContinent(continent) {
	let removeArea = select_image.classList.item(1);
	select_img.src= contextPath+'/img/continent/'+continent+'.png';
	select_image.classList.remove(removeArea);
	select_image.classList.add(continent);
	console.log(select_image.classList.item(1));
}

// 클릭 했을때 좌표 확인하는 이벤트
document.querySelector(".select_image").addEventListener("click", e => {
	// ctx
	let contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
	console.log("")
	
	select_btn.classList.add('on');
	select_btn.style.top=e.offsetY+'px';
	select_btn.style.left=e.offsetX+'px';
	
	offX = e.offsetX;
	offY = e.offsetY;
})

select_btn.addEventListener("click", e => {
	let continentName = select_image.classList.item(1);
	location.href = contextPath + "/adminAreaAdd.do?x=" + offX + "&y=" + offY + "&continentName=" + continentName;
})
