package com.eyevel.controller.area;

import java.io.IOException;

import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-038 : 대륙에 있는 도시 목록 보여주는 용도의 컨트롤러
public class AreaContinentController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String area = req.getParameter("area");
		
		
		return "eyevel/area/"+area;
	}

}
