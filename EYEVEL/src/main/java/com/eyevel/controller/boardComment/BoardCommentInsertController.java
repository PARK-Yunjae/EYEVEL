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

// 게시글 댓글 추가
public class BoardCommentInsertController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if (req.getSession().getAttribute("loginId") == null) {
			return "eyevel/parts/main";
		}
		
		String id = (String)req.getSession().getAttribute("loginId");
		String board_no = req.getParameter("board_no");
		String boardComment = req.getParameter("comment");
		BoardComment bc = new BoardComment();

		bc.setBoard_no(Integer.parseInt(board_no));
		bc.setComment(boardComment);
		bc.setMember_id(id);
		
		LocalDateTime now = LocalDateTime.now();
		String fnow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		bc.setReg_datetime(fnow);
		
		BoardCommentDAO.getInstance().insertBoardComment(bc);
		String ctx = req.getContextPath();
		return "redirect:" + ctx + "/boardInfo.do?no=" + board_no;
	}

}
