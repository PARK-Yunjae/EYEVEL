package com.eyevel.controller.admin;

import java.io.IOException;

import com.eyevel.dao.AreaDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Area;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-064 : 관리자 관광지 수정
public class AdminAreaInfoControlle implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if(!req.getSession().getAttribute("loginId").equals("admin")) {
			return "eyevel/parts/main";
		}
		
		int no = Integer.parseInt(req.getParameter("no"));
		
		Area vo = AreaDAO.getInstance().areaContents(no); 
		req.setAttribute("vo", vo);
		
		return "eyevel/admin/adminAreaAdd";
	}

}
