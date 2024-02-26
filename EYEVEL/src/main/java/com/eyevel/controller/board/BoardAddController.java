package com.eyevel.controller.board;

import java.io.IOException;

import com.eyevel.dao.BoardDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Board;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-046 : 게시글 추가
public class BoardAddController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int no = Integer.parseInt(req.getParameter("no"));
		int category = Integer.parseInt(req.getParameter("category"));
		int is_private = Integer.parseInt(req.getParameter("is_private"));
		String member_id = req.getParameter("id");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String reg_date = req.getParameter("reg_date");
		int hits = Integer.parseInt(req.getParameter("hits"));
		int heart = Integer.parseInt(req.getParameter("heart"));
		int admin_check = Integer.parseInt(req.getParameter("admin_check"));

		Board b = new Board();
		b.setNo(no);
		b.setCategory(category);
		b.setIsPrivate(is_private);
		b.setMemberId(member_id);
		b.setTitle(title);
		b.setContents(contents);
		b.setRegdate(reg_date);
		b.setHits(hits);
		b.setHeart(heart);
		b.setAdminCheck(admin_check);

		BoardDAO.getInstance().boardAdd(b);

		return "eyevel/parts/main";
	}

}
