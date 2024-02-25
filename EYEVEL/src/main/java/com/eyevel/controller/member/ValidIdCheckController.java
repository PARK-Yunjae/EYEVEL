package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//CLS-033 : 아이디 중복체크(비동기)
public class ValidIdCheckController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("id").trim();
		
		if (req.getParameter("id") == null || id.equals("")) {
			res.getWriter().print("아이디값 없음");
			return null;
		}
		
		int cnt = MemberDAO.getInstance().checkId(id);
		res.getWriter().print(cnt);

		return null;
	}

}
