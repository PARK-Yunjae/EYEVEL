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
		System.out.println("도시로 이동중");
		int id = Integer.parseInt(req.getParameter("id"));
		Area city = AreaDAO.getInstance().areaContents(id);
		
		req.setAttribute("area", city);
		System.out.println("도시정보 :" + city);
		return "eyevel/area/city";
	}

}
