package com.eyevel.controller.area;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import com.eyevel.dao.AreaDAO;
import com.eyevel.dao.AreaImgDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.util.FileUtil;
import com.eyevel.vo.Area;
import com.eyevel.vo.AreaImg;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLS-044 : 관광지 정보 업데이트 (관리자)
public class AreaUpdateController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if (!req.getSession().getAttribute("loginId").equals("admin")) {
			return "eyevel/parts/main";
		}
		String areaName = req.getParameter("area_name");
		String saveDirectory = req.getServletContext().getInitParameter("saveDirectory")+"/area/"+ areaName + "/";
		// 해당 경로에 폴더가 없으면 만들어줌 Uploads로
		Path saveDirPath = Paths.get(saveDirectory);
		if (!Files.isDirectory(saveDirPath)) {
			Files.createDirectories(saveDirPath);
		}
		String area_url = req.getParameter("area_url").trim();
		String contents = req.getParameter("area_contents");
		// url 주소 앞 자르기
		if(area_url.indexOf("https://youtu.be/") != -1) {
			area_url = area_url.replace("https://youtu.be/", "");
		}
		ArrayList<String> imgs = FileUtil.multipleFile(req, saveDirectory, areaName);
		int no = Integer.parseInt(req.getParameter("no"));
		
		Area a = new Area();
		a.setNo(no);
		a.setLink_url(area_url);
		a.setContents(contents);
		AreaDAO.getInstance().areaUpdate(a);
		
		
		ArrayList<AreaImg> aiList = new ArrayList<AreaImg>();
		String[] weathers = {"Clear","Clouds","Snow","Rain"};
		// 테이블은 4개만 올라가도록 수정해야함.
		for(int i=0 ; i<4 ; i++) {
			AreaImg ai = new AreaImg();
			ai.setArea_no(no);
			ai.setWeather(weathers[i]);
			ai.setImg(imgs.get(i));
			
			aiList.add(ai);
		}
		
		AreaImgDAO.getInstance().updateAreaImg(aiList);
		
		String ctx = req.getContextPath();
		return "redirect:" + ctx + "/adminAreaList.do";
	}

}
