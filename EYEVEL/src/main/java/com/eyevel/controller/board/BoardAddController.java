package com.eyevel.controller.board;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
		// 잘못된 접근 시 메인으로 보내기?
		if (req.getSession().getAttribute("loginId") == null) {
			return "eyevel/parts/main";
		}

		String ctx = req.getContextPath();
		if (req.getParameter("title") == null) {
			return "eyevel/board/boardAdd";
		}
		int category = 0;
		int is_private = Integer.parseInt(req.getParameter("is_private"));
		String member_id = (String) req.getSession().getAttribute("loginId");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		LocalDateTime now = LocalDateTime.now();
		String fnow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String reg_date = fnow;
		int admin_check = Integer.parseInt(req.getParameter("admin_check"));
		System.out.println(req.getParameter("notice"));
		if (req.getParameter("notice") == null) {
			category = 1;
		} else {
			category = 0;
		}
		Board b = new Board();
		b.setCategory(category);
		b.setIs_private(is_private);
		b.setMember_id(member_id);
		b.setTitle(title);
		b.setContents(contents);
		b.setRegdate(reg_date);
		b.setHits(0);
		b.setHeart(0);
		b.setAdmin_check(admin_check);

		System.out.println(b);
		BoardDAO.getInstance().boardAdd(b);

		return "redirect:" + ctx + "/boardList" + ".do";
	}

}
