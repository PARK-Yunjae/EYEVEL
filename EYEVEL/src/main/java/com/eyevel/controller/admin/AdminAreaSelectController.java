package com.eyevel.controller.admin;

import java.io.IOException;

import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminAreaSelectController implements Controller {
	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if (!req.getSession().getAttribute("loginId").equals("admin")) {
			return "eyevel/parts/main";
		}
		return "eyevel/admin/adminAreaSelect";
	}
}