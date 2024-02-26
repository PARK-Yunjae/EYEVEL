package com.eyevel.controller.board;

import java.io.IOException;

import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-046 : 게시글 추가
public class BoardAddController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		return "eyevel/board/boardAdd";
	}

}
