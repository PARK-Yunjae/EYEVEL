//검은 배경
let overlay = null;
let overlayCheck = false;
let warningIcon = "<span><i class='fas fa-exclamation-triangle'></i></span>";


function createOverlay(){
	overlay = document.createElement('div');
    overlay.setAttribute('class', 'overlay');
    document.body.appendChild(overlay);
    overlayCheck = true;	
}

function modalMsgWarning(titleMsg, contentMsg){
	let title = document.querySelector('.modal_warning h2');
	let content = document.querySelector('.modal_warning p');
	title.innerHTML = warningIcon+titleMsg;
	content.innerHTML=contentMsg;
	
	document.querySelector('.modal_warning').classList.add('active');
	
	if(overlay==null) createOverlay();

	document.querySelector('.modal_warning .btn').addEventListener('click', e=>{
		document.querySelector('.modal_warning').classList.remove('active');
		if(overlayCheck) {
			document.body.removeChild(overlay);
			overlay=null;
		}
		overlayCheck = false;
	})
}

function modalMsgForm(titleMsg, contentMsg, form){
	let title = document.querySelector('.modal_alert h2');
	let content = document.querySelector('.modal_alert p');
	title.innerHTML = warningIcon+titleMsg;
	content.innerHTML=contentMsg;
	
	document.querySelector('.modal_alert').classList.add('active');
	
	if(overlay==null) createOverlay();

	document.querySelector('.modal_alert .btn2').addEventListener('click', e=>{
		document.querySelector('.modal_alert').classList.remove('active');
		if(overlayCheck) {
			document.body.removeChild(overlay);
			overlay=null;
		}
		overlayCheck = false;
	})
	
	document.querySelector('.modal_alert .btn1').addEventListener('click', e=>{
		document.querySelector('.modal_alert').classList.remove('active');
		if(overlayCheck) document.body.removeChild(overlay);
		overlayCheck = false;
		overlay=null;
		
		form.submit();
	})
}

let test = null;
function modalMsgTest(titleMsg, contentMsg){
	let title = document.querySelector('.modal_alert h2');
	let content = document.querySelector('.modal_alert p');
	title.innerHTML = warningIcon+titleMsg;
	content.innerHTML=contentMsg;
	
	document.querySelector('.modal_alert').classList.add('active');
	
	if(overlay==null) createOverlay();

	document.querySelector('.modal_alert .btn2').addEventListener('click', e=>{
		document.querySelector('.modal_alert').classList.remove('active');
		if(overlayCheck) {
			document.body.removeChild(overlay);
			overlay=null;
		}
		overlayCheck = false;
		test = "취소";
	})
	
	document.querySelector('.modal_alert .btn1').addEventListener('click', e=>{
		document.querySelector('.modal_alert').classList.remove('active');
		if(overlayCheck) {
			document.body.removeChild(overlay);
			overlay=null;
		}
		
		overlayCheck = false;
		test = "확인";
	})
	
	console.log(test);
	return test;
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