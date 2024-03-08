package com.eyevel.frontController;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-022 : 컨트롤러 인터페이스
public interface Controller {
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException;
}