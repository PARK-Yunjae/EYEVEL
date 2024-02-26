package com.eyevel.controller.area;

import java.io.IOException;

import com.eyevel.dao.AreaDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Area;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-039 : 관광지 상세 정보 (맴버용) 
public class AreaCityController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("id");
		Area city = AreaDAO.getInstance().areaContents(id);
		
		req.setAttribute("content", city);

		return "eyevel/area/city";
	}

}
