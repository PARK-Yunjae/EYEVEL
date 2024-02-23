package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//CLS-027 회원가입
public class JoinMemberController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String img = req.getParameter("img");
		
		//맴버 객체에 받아온 정보를 입력
		Member m = new Member();
		m.setId(id);
		m.setPw(pw);
		m.setName(name);
		m.setEmail(email);
		m.setImg(img);
		
		MemberDAO.getInstance().memberInsert(m);
		
		return null;
	}

}
