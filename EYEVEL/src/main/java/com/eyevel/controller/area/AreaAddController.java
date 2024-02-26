package com.eyevel.controller.area;

import java.io.IOException;

import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-040 : 관광지 추가 (관리자) 
public class AreaAddController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		return "eyevel/area/city";
	}

}
