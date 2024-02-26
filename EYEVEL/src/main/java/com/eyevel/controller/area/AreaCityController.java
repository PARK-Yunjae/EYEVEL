package com.eyevel.controller.area;

import java.io.IOException;

import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-039 : 관광지 상세 정보 (맴버용) 
public class AreaCityController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		return "eyevel/area/city";
	}

}
