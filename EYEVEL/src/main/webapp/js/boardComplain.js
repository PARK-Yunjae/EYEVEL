// 화살표 버튼 관련 변수
let complain_title = document.querySelectorAll(".complain_title");
let complain_arrow = document.querySelectorAll(".complain_title_arrow");
let complain_contents = document.querySelectorAll(".complain_contents");
let arrow = document.querySelectorAll(".complain_title_arrow");
let arrowPass = true;

document.querySelector('header').classList.add('black');
document.querySelector('html').style.background="none";

complain_title.forEach((e, i) => {
	e.addEventListener("click", () => {
		if(arrowPass){
			complain_arrow[i].classList.add('on');
			complain_contents[i].classList.add('on');
			arrowPass = false;
		}else{
			complain_arrow[i].classList.remove('on');
			complain_contents[i].classList.remove('on');
			arrowPass = true;
		}
	});
});

// 게시물 선택시 해당 카테고리만 보여주기

let category = document.querySelectorAll(".complain_category");
let complain_main = document.querySelectorAll(".complain_main");

category.forEach((e, i) =>{
	e.addEventListener("click", () =>{
		category.forEach(en=>{
			en.classList.remove('on');
		})
		e.classList.add('on');
		
		complain_main.forEach(en=>{
				en.classList.remove('on');
		});
		if(i == 0){
			complain_main.forEach(en=>{
				en.classList.add('on');
			})
		}else if(i == 1){
			document.querySelectorAll('.cate91').forEach(e=>{
				e.classList.add('on');
			})
		}else if(i == 2){
			document.querySelectorAll('.cate92').forEach(e=>{
				e.classList.add('on');
			})
		}else if(i == 3){
			document.querySelectorAll('.cate93').forEach(e=>{
				e.classList.add('on');
			})
		}else if(i == 4){
			document.querySelectorAll('.cate94').forEach(e=>{
				e.classList.add('on');
			})
		}
	})
})