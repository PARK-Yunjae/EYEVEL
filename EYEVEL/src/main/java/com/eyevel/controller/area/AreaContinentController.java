package com.eyevel.controller.area;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.eyevel.dao.AreaDAO;
import com.eyevel.dao.AreaImgDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Area;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-038 : 대륙에 있는 도시 목록 보여주는 용도의 컨트롤러
public class AreaContinentController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String area = req.getParameter("area");
		
		ArrayList<Area> list = (ArrayList<Area>) AreaDAO.getInstance().areaContinentList(area);
		System.out.println(list);
		req.setAttribute("list", list);
		for(int i=0; i<list.size(); i++) {
			String img = AreaImgDAO.getInstance().getimg(list.get(i).getNo()).get(0).getImg();
			list.get(i).setLink_url(img);
		}
		
		req.setAttribute("area", area);
		
		return "eyevel/area/continent";
	}

}
