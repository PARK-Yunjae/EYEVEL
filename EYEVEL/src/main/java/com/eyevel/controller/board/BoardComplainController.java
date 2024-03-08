package com.eyevel.controller.board;

import java.io.IOException;
import java.util.List;

import com.eyevel.dao.BoardDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Board;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-051 : 자주 하는 질문
public class BoardComplainController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		List<Board> list = BoardDAO.getInstance().boardQnAList();

		req.setAttribute("list", list);

		return "eyevel/board/boardComplain";
	}
}