package com.eyevel.controller.comment;

import java.io.IOException;

import com.eyevel.dao.CommentDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-055 : 댓글 삭제
public class CommentDeleteController implements Controller {
	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("no"));
		System.out.println(no);
		CommentDAO.getInstance().commentDelete(no);

		String ctx = req.getContextPath();
		return "redirect:" + ctx + "/areaCity.do?no=" + req.getParameter("areaNo");
	}
}