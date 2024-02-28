//검은 배경
let overlay = null;
let overlayCheck = false;

let title = document.querySelector('.modal_warning h2');
let content = document.querySelector('.modal_warning p');


function modalMsg(titleMsg, contentMsg){
	title.innerHTML = "<span><i class='fas fa-exclamation-triangle'></i></span>"+titleMsg;
	content.innerHTML=contentMsg;
	
	document.querySelector('.modal_warning').classList.add('active');
	
	if(overlay==null){
		overlay = document.createElement('div');
    	overlay.setAttribute('class', 'overlay');
    	document.body.appendChild(overlay);
    	overlayCheck = true;		
	}

	document.querySelector('.modal_warning .btn').addEventListener('click', e=>{
		document.querySelector('.modal_warning').classList.remove('active');
		if(overlayCheck) document.body.removeChild(overlay);
	})
}


/*
function modalMsg(titleMsg, contentMsg, url){
	title.innerHTML = titleMsg;
	content.innerHTML=contentMsg;
	
	document.querySelector('.modal_warning').classList.add('active');
	
	document.querySelector('.modal_warning .btn').addEventListener('click', e=>{
		document.querySelector('.modal_warning').classList.remove('active');
	})
}
*/