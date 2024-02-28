package com.eyevel.controller.board;

import java.io.IOException;

import com.eyevel.dao.BoardDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Board;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-050 : 게시글 정보 수정
public class BoardUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if (req.getSession().getAttribute("loginId") == null) {
			return "eyevel/parts/main";
		}
		if (req.getParameter("title") == null) {
			int no = Integer.parseInt(req.getParameter("no"));
			Board b = BoardDAO.getInstance().boardDetail(no);
			req.setAttribute("board", b);
			return "eyevel/board/boardAdd";
		}
		String ctx = req.getContextPath();
		System.out.println(req.getParameter("no"));
		int no = Integer.parseInt(req.getParameter("no"));
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");

		BoardDAO.getInstance().boardUpdate(no, title, contents);

		return "redirect:" + ctx + "/boardList" + ".do";
	}

}
