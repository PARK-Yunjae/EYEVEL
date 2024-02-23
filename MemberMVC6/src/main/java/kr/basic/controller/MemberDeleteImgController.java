package kr.basic.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.model.MemberDAO;
import kr.basic.model.MemberVO;

public class MemberDeleteImgController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String saveDirectory = request.getServletContext().getInitParameter("IMG_DIR");

		
		int num = Integer.parseInt(request.getParameter("num"));




		MemberVO vo = MemberDAO.getInstance().memberContent(num);
		Path filePath = Paths.get(saveDirectory, vo.getsFileName());
		
		//파일삭제
		try {
			Files.deleteIfExists(filePath);
			System.out.println("파일 삭제 완료");
		} catch (IOException e) {
			e.printStackTrace();
		}

		int cnt = MemberDAO.getInstance().memberUploadPhoto(num, null, null);
		if (cnt > 0) {
			response.getWriter().print("success");
		} else {
			response.getWriter().print("fail");
		}
		return null;
	}

}
