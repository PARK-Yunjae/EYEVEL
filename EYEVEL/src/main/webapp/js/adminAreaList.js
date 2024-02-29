document.querySelector('header').classList.add('black');
document.querySelector('html').style.background="none";

function areaDelteModal(no){
	let func = function(){location.href=contextPath+"/areaDelete.do?no="+no};
	modalCheck("경고","관광지를 삭제할 경우 찜목록과 이미지<br>댓글까지 모두 삭제됩니다. 괜찮으십니까?",func)
}