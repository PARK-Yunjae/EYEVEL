package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-032 : 회원정보 업데이트
public class MemberUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = (String)req.getSession().getAttribute("loginId");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		Member m = new Member();
		m.setId(id);
		m.setName(name);
		m.setEmail(email);
		
		MemberDAO.getInstance().memberUpdate(m);
		
		return "eyevel/member/main";
	}

}
