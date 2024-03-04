package com.eyevel.controller.member;

import java.io.IOException;

import com.eyevel.dao.MemberDAO;
import com.eyevel.dao.ZzimDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Member;
import com.eyevel.vo.Zzim;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-030 : 회원정보
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
		checkZzim.setMember_id(req.getParameter("loginId"));
		Zzim z = ZzimDAO.getInstance().zzimMemberListById(checkZzim);
		req.setAttribute("zzim", z);
		req.setAttribute("member", m);
		System.out.println(z);

		return "eyevel/member/info";
	}

}
