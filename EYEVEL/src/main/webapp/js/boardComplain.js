// 화살표 버튼 관련 변수
let complain_arrow = document.querySelectorAll(".complain_arrow");
let complain_contents = document.querySelectorAll(".complain_contents");
let arrowPass = true;

complain_arrow.forEach((e, i) => {
	e.addEventListener("click", () => {
		if(arrowPass){
			complain_contents[i].style.display = "block";
			arrowPass = false;
		}else{
			complain_contents[i].style.display = "none";
			arrowPass = true;
		}
	});
});

// 게시물 선택시 해당 카테고리만 보여주기

let category = document.querySelectorAll(".complain_category");

category.forEach((e, i) =>{
	e.addEventListener("click", () =>{
		
	})
})