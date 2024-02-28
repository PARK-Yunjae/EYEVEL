package com.eyevel.controller.board;

import java.io.IOException;

import com.eyevel.dao.BoardDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Board;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-049 : 게시글 확인
public class BoardInfoController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int no = -1;
		if (req.getParameter("no") == null) {
			return "eyevel/board/boardList";
		} else {
			no = Integer.parseInt(req.getParameter("no"));
		}
		BoardDAO.getInstance().boardCount(no);
		Board b = BoardDAO.getInstance().boardDetail(no);
		req.setAttribute("board", b);

		return "eyevel/board/boardInfo";
	}

}
