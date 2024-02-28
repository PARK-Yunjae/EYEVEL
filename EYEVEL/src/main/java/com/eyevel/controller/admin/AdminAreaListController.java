package com.eyevel.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import com.eyevel.dao.AreaDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Area;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-062 : 관리자 관광지 리스트
public class AdminAreaListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if(!req.getSession().getAttribute("loginId").equals("admin")) {
			return "eyevel/parts/main";
		}
		
		ArrayList<Area> list =  (ArrayList<Area>) AreaDAO.getInstance().areaList();
		
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
		
		ArrayList<Area> arr = new ArrayList<Area>();
		for(int i =startContent; i<endContent; i++) {
			arr.add(list.get(i));
		}
		req.setAttribute("list", arr);
		req.setAttribute("size", size);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("totalPage", totalPage);
		
		return "eyevel/admin/adminAreaList";
	}

}
