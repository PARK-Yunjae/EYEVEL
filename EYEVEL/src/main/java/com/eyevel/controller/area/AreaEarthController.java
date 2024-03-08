package com.eyevel.controller.area;

import java.io.IOException;

import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-037 : 세계 지도 페이지 이동 컨트롤러
public class AreaEarthController implements Controller {
	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String area = req.getParameter("area");
		req.setAttribute("area", area);

		return "eyevel/area/earth";
	}
}