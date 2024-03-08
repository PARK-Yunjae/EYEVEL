package com.eyevel.controller.board;

import java.io.IOException;

import com.eyevel.dao.BoardCommentDAO;
import com.eyevel.dao.BoardDAO;
import com.eyevel.dao.BoardLikeDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-047 : 게시글 삭제
public class BoardDeleteController implements Controller {
	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if (req.getSession().getAttribute("loginId") == null) {
			return "eyevel/parts/main";
		}
		String ctx = req.getContextPath();
		int no = Integer.parseInt(req.getParameter("no"));

		// 좋아요 삭제
		BoardLikeDAO.getInstance().deleteBoardLikeByBoard(no);
		// 댓글 삭제
		BoardCommentDAO.getInstance().deleteBoardCommentByBoard(no);
		// 마지막으로 게시글 삭제
		BoardDAO.getInstance().boardDelete(no);

		return "redirect:" + ctx + "/boardList" + ".do";
	}
}