package com.eyevel.frontController;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.vo.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 네이버 로그인 콜백 시 토큰값 받아오기
public class NaverLoginCallBackController implements Controller {
	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		String id = ("n_" + email).replace("@naver.com", "");
		String name = req.getParameter("name");
		// 아이디가 없으면 가입시키고 로그인 있으면 그냥 로그인
		Member m = MemberDAO.getInstance().memberContent(id);
		System.out.println(m);
		if (m == null) {
			m = new Member();
			m.setId(id);
			m.setPw(id);
			m.setName(name);
			m.setEmail(email);
			m.setImg("profile.png");
			MemberDAO.getInstance().memberInsert(m);
		}
		HttpSession session = req.getSession();
		session.setAttribute("loginId", id); // 아이디를 넘겨줘야 삭제버튼을 막을 수 있음.
		session.setAttribute("name", name);
		session.setAttribute("naver", "true");
		String ctx = req.getContextPath();

		return "redirect:" + ctx + "/main.do";
	}
}