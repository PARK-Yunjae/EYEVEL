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

//		페이징
		int size = list.size();
		int pageCut = 5;
		int nowPage = 1;
		if (req.getParameter("page") != null) {
			nowPage = Integer.parseInt(req.getParameter("page"));
		}
		int startContent = (nowPage - 1) * pageCut;
		int endContent = startContent + pageCut;
		if (endContent > size) {
			endContent = size;
		}
		int totalPage = size / pageCut;
		if (size % pageCut > 0)
			totalPage += 1;

		int startPage = 1;
		if (req.getParameter("start") != null) {
			startPage = Integer.parseInt(req.getParameter("start"));
		}
		int endPage = startPage + 2;
		if (endPage > totalPage)
			endPage = totalPage;

		ArrayList<Board> arr = new ArrayList<Board>();
		for (int i = startContent; i < endContent; i++) {
			arr.add(list.get(i));
		}
		req.setAttribute("list", arr);
		req.setAttribute("size", size);
		req.setAttribute("page", nowPage);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("totalPage", totalPage);

		return "eyevel/board/boardList";
	}

}
