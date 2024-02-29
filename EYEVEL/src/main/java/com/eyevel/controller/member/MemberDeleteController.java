package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.dao.ZzimDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-031 : 회원삭제
public class MemberDeleteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if(req.getSession().getAttribute("loginId") == null) {
			return "eyevel/parts/main";
		}
		String id = (String) req.getSession().getAttribute("loginId");
		
		if(req.getSession().getAttribute("loginId").equals("admin")) {
			id = req.getParameter("id");
		}
		
		MemberDAO.getInstance().memberDelete(id);
		ZzimDAO.getInstance().zzimDeletebyId(id);
		
		return "eyevel/main";
	}

}
