package com.eyevel.controller.area;

import java.io.IOException;

import com.eyevel.dao.AreaDAO;
import com.eyevel.dao.AreaImgDAO;
import com.eyevel.dao.CommentDAO;
import com.eyevel.dao.ZzimDAO;
import com.eyevel.frontController.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-041 : 관광지 삭제(관리자)
public class AreaDeleteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if (req.getSession().getAttribute("loginId") == null) {
			return "eyevel/parts/main";
		}
		int no = Integer.parseInt(req.getParameter("no"));
		// 댓글 삭제
		CommentDAO.getInstance().areaCommentDelete(no);
		// area 이미지 삭제
		AreaImgDAO.getInstance().deleteAreaImg(no);
		// 찜목록 삭제
		ZzimDAO.getInstance().zzimDeletebyNo(no);
		// 관광지 삭제
		AreaDAO.getInstance().areaDelete(no);

		String ctx = req.getContextPath();

		return "redirect:" + ctx + "/adminAreaList.do";
	}
}