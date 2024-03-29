package com.eyevel.frontController;

import java.util.HashMap;

import com.eyevel.controller.admin.*;
import com.eyevel.controller.area.*;
import com.eyevel.controller.board.*;
import com.eyevel.controller.boardComment.*;
import com.eyevel.controller.boardLike.*;
import com.eyevel.controller.comment.*;
import com.eyevel.controller.member.*;
import com.eyevel.controller.zzim.*;

// CLS-024 : 각 컨트롤러들을 하나로 묶어주는 맵 클래스
public class HandlerMapping {
	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();

		// main
		mappings.put("/main.do", new MainController());

		// member
		mappings.put("/memberJoin.do", new MemberJoinController()); // 회원가입
		mappings.put("/memberLogin.do", new MemberLoginController()); // 로그인
		mappings.put("/memberLogout.do", new MemberLogoutController()); // 로그아웃
		mappings.put("/memberInfo.do", new MemberInfoController()); // 회원정보
		mappings.put("/memberDelete.do", new MemberDeleteController()); // 회원탈퇴
		mappings.put("/memberUpdate.do", new MemberUpdateController()); // 회원수정
		mappings.put("/validIdCheck.do", new ValidIdCheckController()); // 비동기 중복 id 체크
		mappings.put("/validLoginCheck.do", new ValidLoginCheckController()); // 비동기 로그인 체크
		mappings.put("/vaildEmailVerification.do", new ValidEmailVerificationController()); // 비동기 로그인 체크

		// area
		mappings.put("/areaEarth.do", new AreaEarthController()); // 전체
		mappings.put("/areaContinent.do", new AreaContinentController()); // 대륙
		mappings.put("/areaCity.do", new AreaCityController()); // 관광지 상세 정보 (맴버용) 
		mappings.put("/areaDelete.do", new AreaDeleteController()); // 관광지 삭제 (관리자)
		mappings.put("/areaUpdate.do", new AreaUpdateController()); // 관광지 정보 업데이트 (관리자)
		mappings.put("/validAreaId.do", new ValidAreaIdController()); // 관광지 아이디 중복체크
		mappings.put("/recommendPlaces.do", new AreaRecommendController()); // 관광지 AI 경로추천

		// board
		mappings.put("/boardAdd.do", new BoardAddController()); // 게시글 추가
		mappings.put("/boardDelete.do", new BoardDeleteController()); // 게시글 삭제
		mappings.put("/boardList.do", new BoardListController()); // 게시판 리스트 확인 (페이징)
		mappings.put("/boardInfo.do", new BoardInfoController()); // 게시글 확인
		mappings.put("/boardUpdate.do", new BoardUpdateController()); // 게시글 정보 수정
		mappings.put("/boardComplain.do", new BoardComplainController()); // 자주 하는 질문

		// zzim
		mappings.put("/zzimAdd.do", new ZzimAddController()); // 좋아요 추가
		mappings.put("/zzimDelete.do", new ZzimDeleteController()); // 좋아요 삭제
		mappings.put("/zzimMemberList.do", new ZzimMemberListController()); // 유저 찜 리스트

		// comment
		mappings.put("/commentAdd.do", new CommentAddController()); // 댓글 추가
		mappings.put("/commentDelete.do", new CommentDeleteController()); // 댓글 삭제
		mappings.put("/commentList.do", new CommentListController()); // 댓글 목록 (관리자)

		// admin
		mappings.put("/adminMain.do", new AdminMainController()); // 관리자 메인
		mappings.put("/adminAreaList.do", new AdminAreaListController()); // 관리자 관광지 관리
		mappings.put("/adminAreaAdd.do", new AdminAreaAddController()); // 관광지 추가
		mappings.put("/adminAreaInfo.do", new AdminAreaInfoControlle()); // 관광지 수정
		mappings.put("/adminAreaSelect.do", new AdminAreaSelectController()); // 관광지 선택
		mappings.put("/adminMemberList.do", new AdminMemberListController()); //회원목록

		// boardLike
		mappings.put("/validAddBoardLike.do", new VaildAddBoardLikeController()); // 비동기 게시물 좋아요 삭제
		mappings.put("/validDeleteBoardLike.do", new VaildDeleteBoardLikeController()); // 비동기 게시물 좋아요 삭제

		// boardComment
		mappings.put("/boardCommentInsert.do", new BoardCommentInsertController()); // 게시글 댓글 추가
		mappings.put("/boardCommentDelete.do", new BoardCommentDeleteController()); // 게시글 댓글 삭제

		// naver
		mappings.put("/naverLoginCallBack.do", new NaverLoginCallBackController()); // 네이버 콜백 페이지 이동 전용
	}

	public Controller getController(String key) {
		return mappings.get(key);
	}
}