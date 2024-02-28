package com.eyevel.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Area;
import com.eyevel.vo.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//CLS-035 : 회원 리스트 확인(관리자용)
public class AdminMemberListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if(!req.getSession().getAttribute("loginId").equals("admin")) {
			return "eyevel/parts/main";
		}
		
		// 회원목록 불러오기
		ArrayList<Member> list = (ArrayList<Member>)MemberDAO.getInstance().memberList();
		System.out.println("회원목록 불러오기 완료");
		System.out.println(list);

		HttpSession session = req.getSession();
		
		if (session.getAttribute("log") != null) {
			String id = (String)session.getAttribute("id");
			req.setAttribute("id", id);

		} else {
			req.setAttribute("id", null);
		}	
		
		//페이징
		int size = list.size();
		int pageCut = 5;
		int nowPage = 1;
		if(req.getParameter("page")!=null){
			nowPage = Integer.parseInt(req.getParameter("page"));
		}
		int startContent = (nowPage-1)*pageCut;
		int endContent = startContent+pageCut;
		if(endContent>size){
			endContent = size;
		}
		int totalPage = size/pageCut;
		if(size%pageCut>0) totalPage+=1;
		
		int startPage = 1;
		if(req.getParameter("start")!=null){
			startPage = Integer.parseInt(req.getParameter("start"));
		}
		int endPage = startPage+2;
		if(endPage>totalPage) endPage=totalPage;
		
		ArrayList<Member> arr = new ArrayList<Member>();
		for(int i =startContent; i<endContent; i++) {
			arr.add(list.get(i));
		}
		req.setAttribute("list", arr);
		req.setAttribute("size", size);
		req.setAttribute("page", nowPage);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("totalPage", totalPage);
		
		return "eyevel/admin/adminMemberList";
	}

}
