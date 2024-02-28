package com.eyevel.controller.board;

import java.io.IOException;

import com.eyevel.dao.BoardDAO;
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

		BoardDAO.getInstance().boardDelete(no);

		return "redirect:" + ctx + "/boardList" + ".do";
	}

}
