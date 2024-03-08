package com.eyevel.controller.boardComment;

import java.io.IOException;

import com.eyevel.dao.BoardCommentDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 게시글 댓글 삭제
public class BoardCommentDeleteController implements Controller {
	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if (req.getSession().getAttribute("loginId") == null) {
			return "eyevel/parts/main";
		}

		int no = Integer.parseInt(req.getParameter("no"));
		int board_no = Integer.parseInt(req.getParameter("board_no"));
		BoardCommentDAO.getInstance().deleteBoardComment(no);
		String ctx = req.getContextPath();
		return "redirect:" + ctx + "/boardInfo.do?no=" + board_no;
	}
}