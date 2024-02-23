package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
//CLS-028 로그인
public class LoginCheckController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = req.getParameter("id");
		System.out.println(id);
		if(req.getParameter("id")==null) {
			System.out.println("아이디값 없음");
			return "";
		}
		
		String pw = req.getParameter("pw");
		String ctx= req.getContextPath();
		
		String check = MemberDAO.getInstance().checkLogin(id,pw);

		if(check.isEmpty()) {
			System.out.println("로그인실패");
			// 어디로 갈지 위치 지정해줘야함
//			return "redirect:"+ctx+"/memberLogin.do";
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("loginId", id); // 아이디를 넘겨줘야 삭제버튼을 막을 수 있음.
			System.out.println("로그인성공");
			//			return "redirect:"+ctx+"/memberList.do";
			return "eyevel/parts/main";
		}
		return null;
	}

}
