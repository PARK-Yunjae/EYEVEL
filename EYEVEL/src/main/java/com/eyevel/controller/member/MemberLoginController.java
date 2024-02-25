package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//CLS-028 : 로그인 
public class MemberLoginController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		if (req.getParameter("id") == null || req.getParameter("id").equals("") 
		 || req.getParameter("pw") == null || req.getParameter("pw").equals("")) {
			res.getWriter().print("잘못된 접근");
			return null;
		}

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");

		String check = MemberDAO.getInstance().checkLogin(id, pw);

		HttpSession session = req.getSession();
		session.setAttribute("loginId", id); // 아이디를 넘겨줘야 삭제버튼을 막을 수 있음.
		session.setAttribute("name", check);
		String ctx = req.getContextPath();
		return "redirect:" + ctx + "/main.do";

	}

}
