window.onload = function() {
   document.querySelector('#load').style.display='none';
};

let menuToggle = document.querySelector('.menuToggle');
let gnb = document.querySelector('.gnb');
let menuCheck = true;

menuToggle.addEventListener('click', ()=>{
	if(menuCheck){
		menuToggle.classList.add('on');
		gnb.classList.add('on');
		menuCheck = false;
	}else{
		menuToggle.classList.remove('on');
		gnb.classList.remove('on');
		menuCheck = true;
	}
})