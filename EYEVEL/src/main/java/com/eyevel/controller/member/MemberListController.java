package com.eyevel.controller.member;

import java.io.IOException;
import java.util.ArrayList;

import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//CLS-035 : 회원 리스트 확인(관리자용)
public class MemberListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 회원목록 불러오기
		ArrayList<Member> list = (ArrayList<Member>)MemberDAO.getInstance().memberList();
		System.out.println("회원목록 불러오기 완료");
		System.out.println(list);
		req.setAttribute("list", list);
		HttpSession session = req.getSession();
		
		if (session.getAttribute("log") != null) {
			String id = (String)session.getAttribute("id");
			req.setAttribute("id", id);

		} else {
			req.setAttribute("id", null);
		}	
		return "eyevel/member/memberList";
	}

}
