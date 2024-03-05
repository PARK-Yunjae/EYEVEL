package com.eyevel.controller.boardComment;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.eyevel.dao.BoardCommentDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.BoardComment;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 게시글 댓글
public class VaildInsertBoardCommentController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String loginId = req.getParameter("loginId");
		String board_no = req.getParameter("board_no");
		String boardComment = req.getParameter("boardComment");
		BoardComment bc = new BoardComment();
		
		bc.setBoard_no(Integer.parseInt(board_no));
		bc.setComment(boardComment);
		bc.setMember_id(loginId);
		
		LocalDateTime now = LocalDateTime.now();
		String fnow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		bc.setReg_Datetime(fnow);
		
		BoardCommentDAO.getInstance().insertBoardComment(bc);
		
		// 게시글 하나 가져와서 실어줘야 함
		bc = BoardCommentDAO.getInstance().getLastBoardComment();
		res.getWriter().print(bc);
		
		return null;
	}

}
