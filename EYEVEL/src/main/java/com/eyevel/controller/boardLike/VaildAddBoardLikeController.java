package com.eyevel.controller.boardLike;

import java.io.IOException;

import com.eyevel.dao.BoardLikeDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.BoardLike;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 비동기로 좋아요 추가
public class VaildAddBoardLikeController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int no = Integer.parseInt(req.getParameter("no"));
		String id = (String)req.getSession().getAttribute("loginId");
		
		BoardLike bl = new BoardLike();
		bl.setBoard_no(no);
		bl.setMember_id(id);
		BoardLikeDAO.getInstance().addBoardLike(bl);
		return null;
	}

}