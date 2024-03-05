package com.eyevel.controller.admin;

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

// CLS-063 : 관리자 관광지 추가
public class AdminAreaAddController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 잘못된 접근 시 메인으로 보내기?
		if (!req.getSession().getAttribute("loginId").equals("admin")) {
			return "eyevel/parts/main";
		}
		if (req.getParameter("area_name") == null) {
			int x = Integer.parseInt(req.getParameter("x"));
			int y = Integer.parseInt(req.getParameter("y"));
			String continentName = req.getParameter("continentName");

			req.setAttribute("x", x);
			req.setAttribute("y", y);
			req.setAttribute("continentName", continentName);

			return "eyevel/admin/adminAreaAdd";
		} else {
			String area_name = req.getParameter("area_name");
			String saveDirectory = req.getServletContext().getInitParameter("saveDirectory")+"/area/"+ area_name +"/"; // add?파일?
			// 해당 경로에 폴더가 없으면 만들어줌 Uploads로
			Path saveDirPath = Paths.get(saveDirectory);
			if (!Files.isDirectory(saveDirPath)) {
				Files.createDirectories(saveDirPath);
			}
			System.out.println("saveDirectory = " + saveDirectory);

			int area_id = Integer.parseInt(req.getParameter("area_id"));
			String area_url = req.getParameter("area_url").trim();
			// url 주소 앞 자르기
			if(area_url.indexOf("https://youtu.be/") != -1) {
				area_url = area_url.replace("https://youtu.be/", "");
			}
			ArrayList<String> imgs = FileUtil.multipleFile(req, saveDirectory, area_name);

			String contents = req.getParameter("area_contents");
			int x = Integer.parseInt(req.getParameter("x"));
			int y = Integer.parseInt(req.getParameter("y"));
			String continent= req.getParameter("continentName");

			Area a = new Area();
			a.setName(area_name);
			a.setContents(contents);
			a.setLink_url(area_url);
			a.setContinent(continent);
			a.setDir_X(x);
			a.setDir_Y(y);
			a.setId(area_id);
			AreaDAO.getInstance().areaAdd(a);
			
			// 이미지 테이블에 넣기 - 임시
			ArrayList<Area> areaList = (ArrayList<Area>) AreaDAO.getInstance().areaList();
			
			int area_no = areaList.get(areaList.size()-1).getNo();
			System.out.println(area_no);
			
			ArrayList<AreaImg> aiList = new ArrayList<AreaImg>();
			String[] weathers = {"Clear","Clouds","Snow","Rain"};
			// 테이블은 4개만 올라가도록 수정해야함.
			for(int i=0 ; i<4 ; i++) {
				AreaImg ai = new AreaImg();
				ai.setArea_no(area_no);
				ai.setWeather(weathers[i]);
				ai.setImg(imgs.get(i));
				
				aiList.add(ai);
			}

			AreaImgDAO.getInstance().addAreaImg(aiList);
			
			String ctx = req.getContextPath();
			return "redirect:" + ctx + "/adminAreaList.do";
		}

	}

}
