package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-034 : 로그인 체크 (비동기)
public class ValidLoginCheckController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		if (req.getParameter("id") == null) {
			res.getWriter().print("아이디값 없음");
			return null;
		}

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		System.out.println(id);
		System.out.println(pw);

		String check = MemberDAO.getInstance().checkLogin(id, pw);

		if (check == null) {
			res.getWriter().print("로그인 실패");
			return null;
		}
		res.getWriter().print("로그인 성공");
		return null;
	}

}
