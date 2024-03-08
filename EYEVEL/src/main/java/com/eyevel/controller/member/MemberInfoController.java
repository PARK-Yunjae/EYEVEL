package com.eyevel.controller.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.eyevel.dao.AreaDAO;
import com.eyevel.dao.AreaImgDAO;
import com.eyevel.dao.MemberDAO;
import com.eyevel.dao.ZzimDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Area;
import com.eyevel.vo.Member;
import com.eyevel.vo.Zzim;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-030 : 회원정보
public class MemberInfoController implements Controller {
	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		String id = (String) req.getSession().getAttribute("loginId");
		if (id == null) {
			return "eyevel/parts/main";
		}
		// admin과 member의 값을 분리해서 처리
		if (id.equals("admin")) {
			id = req.getParameter("id");
		}

		Member m = MemberDAO.getInstance().memberContent(id);

		Zzim checkZzim = new Zzim();
		checkZzim.setMember_id(id);
		List<Zzim> z = ZzimDAO.getInstance().zzimMemberListById(checkZzim);
		ArrayList<Area> a = (ArrayList<Area>) AreaDAO.getInstance().areaListByZzim(z);
		for (int i = 0; i < a.size(); i++) {
			String img = AreaImgDAO.getInstance().getimg(a.get(i).getNo()).get(0).getImg();
			a.get(i).setLink_url(img);
		}
		req.setAttribute("member", m);
		req.setAttribute("zzim", z);
		req.setAttribute("area", a);

		return "eyevel/member/info";
	}
}