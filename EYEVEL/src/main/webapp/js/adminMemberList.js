//배경 흰색 + 헤더 검정
document.querySelector('header').classList.add('black');
document.querySelector('html').style.background = "none";

function memberDelteModal(id){
	let func = function(){location.href=contextPath+"/memberDelete.do?id="+id};
	modalCheck("경고","유저 정보를 삭제할 경우<br>되돌릴 수 없습니다. 삭제하시겠습니까?",func)
}