package com.eyevel.controller.member;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.util.FileUtil;
import com.eyevel.vo.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//CLS-032 : 회원정보 업데이트
public class MemberUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if(req.getSession().getAttribute("loginId") == null) {
			return "eyevel/parts/main";
		}
		
		HttpSession session = req.getSession();
		String saveDirectory = req.getServletContext().getInitParameter("saveDirectory") + "/profile/"; //add?파일?
		// 해당 경로에 폴더가 없으면 만들어줌 Uploads로 
		Path saveDirPath = Paths.get(saveDirectory);
		if (!Files.isDirectory(saveDirPath)) {
			Files.createDirectories(saveDirPath);
		}
		System.out.println("saveDirectory = " + saveDirectory);
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String img = FileUtil.uploadFile(req, saveDirectory, id);
		
		Member m = new Member();
		m.setId(id);
		m.setName(name);
		m.setEmail(email);
		m.setImg(img);
		
		// 이름 수정 시 페이지에 보여주는 이름도 변경
		String oldName = (String)session.getAttribute("name");
		if(!oldName.equals(name) && !session.getAttribute("loginId").equals("admin")) {
			session.setAttribute("name", name);
		};
		
		MemberDAO.getInstance().memberUpdate(m);
		
		String ctx = req.getContextPath();
		
		// 관리자 일때는 관리자 맴버 리스트로
		if(req.getSession().getAttribute("loginId").equals("admin")) {
			return "redirect:"+ctx+"/memberList.do";
		}
		// 아닐때는
		return "eyevel/parts/main";
	}

}
