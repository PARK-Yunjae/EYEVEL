package com.eyevel.controller.comment;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.eyevel.dao.CommentDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Comment;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-054 : 댓글 추가
public class CommentAddController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memberId = req.getParameter("id");
		System.out.println(req.getParameter("id"));
		int areaNo = Integer.parseInt(req.getParameter("no"));
		LocalDateTime now = LocalDateTime.now();
		String fnow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String regDate = fnow;
		String contents = req.getParameter("comment");
		Comment c = new Comment();
		c.setMember_id(memberId);
		c.setArea_no(areaNo);
		c.setReg_datetime(regDate);
		c.setContents(contents);
		System.out.println(c);
		CommentDAO.getInstance().commentAdd(c);
		
		String ctx = req.getContextPath();
		return "redirect:" + ctx + "/areaCity.do?no="+areaNo;
	}

}
