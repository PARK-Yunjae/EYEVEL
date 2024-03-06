package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.dao.ZzimDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//CLS-031 : 회원삭제
public class MemberDeleteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if(req.getSession().getAttribute("loginId") == null) {
			return "eyevel/parts/main";
		}
		String id = (String) req.getSession().getAttribute("loginId");
		
		HttpSession session = req.getSession();
		String ctx = req.getContextPath();
		
		if(session.getAttribute("loginId").equals("admin")) {
			id = req.getParameter("id");
		}
		
		ZzimDAO.getInstance().zzimDeletebyId(id);
		MemberDAO.getInstance().memberDelete(id);
		
		if(session.getAttribute("loginId").equals("admin")) {
			return "redirect:"+ctx+"/adminMemberList.do";
		}else {
			session.setAttribute("loginId", null);			
		}
		return "eyevel/parts/main";
	}

}
