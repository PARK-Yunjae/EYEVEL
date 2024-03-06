

let select_image = document.querySelector(".select_image");
let select_img = document.querySelector('.select_img');
let continent_nav_li = document.querySelectorAll('.continent_nav li');
let select_btn = document.querySelector('.select_btn');

let offY = 0;
let offX = 0;


continent_nav_li.forEach(e=>{
	e.addEventListener('click', ()=>{
		select_btn.classList.remove('on');
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
document.querySelector(".select_img").addEventListener("click", e => {
	// ctx
	let contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
	
	select_btn.classList.add('on');
	select_btn.style.top=e.offsetY+'px';
	select_btn.style.left=e.offsetX+'px';
	
	offX = e.offsetX;
	offY = e.offsetY;
	
	console.log("offsetX="+offX);
	console.log("offsetY="+offY);
})

// 선택 완료 눌렀을 시 페이지 이동
/*
select_btn.addEventListener("click", e => {
	let continentName = select_image.classList.item(1);
	location.href = contextPath + "/adminAreaAdd.do?x=" + offX + "&y=" + offY + "&continentName=" + continentName;
})
*/
let innerWidth = window.innerWidth;

window.onresize = function(e){
	innerWidth = window.innerWidth;
	console.log(innerWidth);
	document.querySelector('.modal_warning').classList.remove('active');
	if(overlayCheck) {
		document.body.removeChild(overlay);
		overlay=null;
		overlayCheck = false;
	}
	if(innerWidth<"1200"){
		modalMsgWarning("경고","관광지 추가는 1200 이상의<br>PC화면에서만 가능합니다",false);
		select_btn.addEventListener("click", e => {
			location.href = contextPath + "/adminAreaList.do";
		})
	}else{
		modalMsgWarning("확인","관광지 위치를 확인하기 위해<br>관광지의 위치를 지도에서 선택해주세요",false);
		select_btn.addEventListener("click", e => {
			let continentName = select_image.classList.item(1);
			location.href = contextPath + "/adminAreaAdd.do?x=" + offX + "&y=" + offY + "&continentName=" + continentName;
		})
	}
}

if(innerWidth<"1200"){
	modalMsgWarning("경고","관광지 추가는 1200 이상의<br>PC화면에서만 가능합니다",false);
	select_btn.addEventListener("click", e => {
			location.href = contextPath + "/adminAreaList.do";
	})
}else{
	modalMsgWarning("확인","관광지 위치를 확인하기 위해<br>관광지의 위치를 지도에서 선택해주세요",false);
	select_btn.addEventListener("click", e => {
		let continentName = select_image.classList.item(1);
		location.href = contextPath + "/adminAreaAdd.do?x=" + offX + "&y=" + offY + "&continentName=" + continentName;
	})
}