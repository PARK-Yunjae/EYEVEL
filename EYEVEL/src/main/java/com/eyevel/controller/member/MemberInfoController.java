package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-030 : 회원정보
public class MemberInfoController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		String id = (String)req.getSession().getAttribute("loginId");
		if(id == null) {
			return "eyevel/parts/main";
		}
		// admin과 member의 값을 분리해서 처리
		if(id.equals("admin")) {
			id = req.getParameter("id");
		}

		Member m = MemberDAO.getInstance().memberContent(id);
		
		req.setAttribute("member", m);
		
		return "eyevel/member/info";
	}

}
