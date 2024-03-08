package com.eyevel.controller.area;

import java.io.IOException;

import com.eyevel.dao.AreaDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//관광지 아이디, 이름 중복체크
public class ValidAreaIdController implements Controller {
	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int area_id = Integer.parseInt(req.getParameter("area_id"));
		String area_name = req.getParameter("area_name");

		int cnt = AreaDAO.getInstance().checkAreaId(area_id);
		cnt += AreaDAO.getInstance().checkAreaName(area_name);
		System.out.println(cnt);

		if (cnt >= 1) {
			res.getWriter().print("중복");
		} else {
			res.getWriter().print("중복아님");
		}
		return null;
	}
}