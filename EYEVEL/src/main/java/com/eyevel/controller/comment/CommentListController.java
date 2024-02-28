package com.eyevel.controller.comment;

import java.io.IOException;

import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-056 : 댓글 리스트
public class CommentListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if(req.getSession().getAttribute("loginId").equals("admin")) {
			return "eyevel/parts/main";
		}

		return null;
	}

}
