package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//CLS-028 로그인 체크 : 
public class LoginCheckController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String id = req.getParameter("id");
		System.out.println(id);
		if (req.getParameter("id") == null) {
			res.getWriter().print("아이디값 없음");
			return null;
		}

		String pw = req.getParameter("pw");

		String check = MemberDAO.getInstance().checkLogin(id, pw);

		if (check.isEmpty()) {
			res.getWriter().print("로그인 실패");
			return null;
			// 어디로 갈지 위치 지정해줘야함
//			return "redirect:"+ctx+"/memberLogin.do";
		}
		HttpSession session = req.getSession();
		session.setAttribute("loginId", id); // 아이디를 넘겨줘야 삭제버튼을 막을 수 있음.
		res.getWriter().print("로그인 성공");
		// return "redirect:"+ctx+"/memberList.do";
		return null;

	}

}
