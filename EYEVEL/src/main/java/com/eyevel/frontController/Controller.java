package com.eyevel.frontController;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Controller {
	  public String requestHandler(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException;
}
