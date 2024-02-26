package com.eyevel.controller.board;

import java.io.IOException;
import java.util.ArrayList;

import com.eyevel.dao.BoardDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Board;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-048 : 게시판 리스트 확인 (페이징)
public class BoardListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		보드 목록 불러오기
		ArrayList<Board> list = (ArrayList<Board>) BoardDAO.getInstance().boardList();
		System.out.println("보드 목록 불러오기 완료");
		System.out.println(list);
		req.setAttribute("list", list);
		return "eyevel/board/boardList";
	}

}
