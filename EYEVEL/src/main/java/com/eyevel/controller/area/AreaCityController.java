package com.eyevel.controller.area;

import java.io.IOException;
import java.util.List;

import com.eyevel.dao.AreaDAO;
import com.eyevel.dao.AreaImgDAO;
import com.eyevel.dao.CommentDAO;
import com.eyevel.dao.ZzimDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Area;
import com.eyevel.vo.AreaImg;
import com.eyevel.vo.Comment;
import com.eyevel.vo.Zzim;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-039 : 관광지 상세 정보 (맴버용) 
public class AreaCityController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("도시로 이동중");
		int no = Integer.parseInt(req.getParameter("no"));
		Area city = AreaDAO.getInstance().areaContents(no);
		List<Comment> c = (List<Comment>)CommentDAO.getInstance().commentList(no);
		Zzim checkZzim = new Zzim();
		checkZzim.setArea_no(no);
		checkZzim.setMember_id(req.getParameter("loginId"));
		Zzim z = ZzimDAO.getInstance().zzimMemberList(checkZzim);
		List<AreaImg> img = AreaImgDAO.getInstance().getimg(no);
		
		System.out.println("도시정보 :" + city);
		System.out.println("댓글 수 : "+c.size());
		System.out.println("찜 여부 : " + z);
		System.out.println("이미지파일 : " +img);
		req.setAttribute("area", city);
		req.setAttribute("clist", c);
		req.setAttribute("zzim", z);
		req.setAttribute("img", img);
		return "eyevel/area/city";
	}

}
