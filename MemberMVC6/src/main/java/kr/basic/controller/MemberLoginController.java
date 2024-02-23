package kr.basic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.basic.model.MemberDAO;

public class MemberLoginController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		if (request.getParameter("id") == null) {
			return "memberLogin";
		}
		String pw = request.getParameter("pw");

		String ctx = request.getContextPath();
         String name = MemberDAO.getInstance().checkLogin(id, pw);
		if (name == null) {
			return "redirect:" + ctx + "/memberLogin.do";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("log", MemberDAO.getInstance().getMemberNo(id));
			session.setAttribute("loginId", id);
			
			System.out.println( name + " 회원 로그인 성공 ");
			return "redirect:" + ctx + "/memberList.do";
		}

	}
}
