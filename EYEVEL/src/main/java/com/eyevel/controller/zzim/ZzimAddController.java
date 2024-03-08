package com.eyevel.controller.zzim;

import java.io.IOException;

import com.eyevel.dao.ZzimDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Zzim;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-051 : 좋아요 추가
public class ZzimAddController implements Controller {
	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Zzim checkZzim = new Zzim();
		checkZzim.setArea_no(Integer.parseInt(req.getParameter("no")));
		checkZzim.setMember_id((String) req.getSession().getAttribute("loginId"));
		ZzimDAO.getInstance().zzimAdd(checkZzim);
		System.out.println("찜추가");
		// String ctx = req.getContextPath();
		// return "redirect:" + ctx + "/areaCity.do?no="+checkZzim.getArea_no();
		return null;
	}
}