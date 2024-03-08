package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.BoardCommentDAO;
import com.eyevel.dao.BoardDAO;
import com.eyevel.dao.BoardLikeDAO;
import com.eyevel.dao.CommentDAO;
import com.eyevel.dao.MemberDAO;
import com.eyevel.dao.ZzimDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// CLS-031 : 회원삭제
public class MemberDeleteController implements Controller {
	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if (req.getSession().getAttribute("loginId") == null) {
			return "eyevel/parts/main";
		}
		String id = (String) req.getSession().getAttribute("loginId");

		HttpSession session = req.getSession();
		String ctx = req.getContextPath();

		if (session.getAttribute("loginId").equals("admin")) {
			id = req.getParameter("id");
		}
		// 관광지 찜
		ZzimDAO.getInstance().zzimDeletebyId(id);
		// 게시글 좋아요
		BoardLikeDAO.getInstance().deleteBoardLikeMemberId(id);
		// 게시글 댓글
		BoardCommentDAO.getInstance().deleteBoardCommentMemberId(id);
		// 게시글
		BoardDAO.getInstance().boardDeleteMemberId(id);
		// 관광지 댓글
		CommentDAO.getInstance().CommentDeleteMemberId(id);
		// 멤버
		MemberDAO.getInstance().memberDelete(id);

		if (session.getAttribute("loginId").equals("admin")) {
			return "redirect:" + ctx + "/adminMemberList.do";
		} else {
			session.invalidate();
		}
		return "eyevel/parts/main";
	}
}