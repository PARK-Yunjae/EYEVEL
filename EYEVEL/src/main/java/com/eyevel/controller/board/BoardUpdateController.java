package com.eyevel.controller.board;

import java.io.IOException;

import com.eyevel.dao.BoardDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Board;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-050 : 게시글 정보 수정
public class BoardUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int no = (Integer) req.getSession().getAttribute("no");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");

		Board b = new Board();
		b.setTitle(title);
		b.setContents(contents);

		BoardDAO.getInstance().boardUpdate(no);

		return "eyevel/board/main";
	}

}
