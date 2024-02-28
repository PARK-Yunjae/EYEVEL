// 화살표 버튼 관련 변수
let complain_arrow = document.querySelectorAll(".complain_title");
let complain_contents = document.querySelectorAll(".complain_contents");
let arrow = document.querySelectorAll(".complain_title_arrow");
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
let complain_main = document.querySelectorAll(".complain_main");

category.forEach((e, i) =>{
	e.addEventListener("click", () =>{
		if(i == 0){
			for(let j=0 ; j<complain_main.length ; j++){
				complain_main[j].classList.add("on");
			}
		}else if(i == 1){
			for(let j=0 ; j<complain_main.length ; j++){
				if(complain_main[j].classList.item(1) == '91'){
					complain_main[j].classList.add("on");
				}else{
					complain_main[j].classList.remove("on");
				}
			}
		}else if(i == 2){
			for(let j=0 ; j<complain_main.length ; j++){
				if(complain_main[j].classList.item(1) == '92'){
					complain_main[j].classList.add("on");
				}else{
					complain_main[j].classList.remove("on");
				}
			}
		}else if(i == 3){
			for(let j=0 ; j<complain_main.length ; j++){
				if(complain_main[j].classList.item(1) == '93'){
					complain_main[j].classList.add("on");
				}else{
					complain_main[j].classList.remove("on");
				}
			}
		}else if(i == 4){
			console.log(complain_main.length);
			for(let j=0 ; j<complain_main.length ; j++){
				if(complain_main[j].classList.item(1) == '94'){
					complain_main[j].classList.add("on");
				}else{
					complain_main[j].classList.remove("on");
				}
			}
		}
	})
})