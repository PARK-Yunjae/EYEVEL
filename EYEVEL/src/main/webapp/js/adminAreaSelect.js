let select_image = document.querySelector(".select_image");
let select_img = document.querySelector('.select_img');
let continent_nav_li = document.querySelectorAll('.continent_nav li');

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
	let continentName = select_image.classList.item(1);
	location.href = contextPath + "/adminAreaAdd.do?x=" + e.offsetX + "&y=" + e.offsetY + "&continentName=" + continentName;
})
