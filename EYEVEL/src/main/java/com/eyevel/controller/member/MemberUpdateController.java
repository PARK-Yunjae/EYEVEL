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

//CLS-032 : 회원정보 업데이트
public class MemberUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String saveDirectory = req.getServletContext().getInitParameter("saveDirectory"); //add?파일?
		// 해당 경로에 폴더가 없으면 만들어줌 Uploads로 
		Path saveDirPath = Paths.get(saveDirectory);
		if (!Files.isDirectory(saveDirPath)) {
			Files.createDirectories(saveDirPath);
		}
		System.out.println("saveDirectory = " + saveDirectory);
		
		String id = (String)req.getSession().getAttribute("loginId");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String img = FileUtil.uploadFile(req, saveDirectory);
		
		Member m = new Member();
		m.setId(id);
		m.setName(name);
		m.setEmail(email);
		m.setImg(img);
		
		MemberDAO.getInstance().memberUpdate(m);
		
		return "eyevel/parts/main";
	}

}
