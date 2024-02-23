package kr.basic.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.basic.model.MemberDAO;
import kr.basic.model.MemberVO;

public class MemberDeleteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String ctx = request.getContextPath();

		MemberVO vo = MemberDAO.getInstance().memberContent(Integer.parseInt(request.getParameter("num")));
		String delFileName =  vo !=null ? vo.getsFileName() : null;

		int cnt = MemberDAO.getInstance().memberDelete(request.getParameter("id"));

		if (cnt > 0 && delFileName != null) {
			// 파일 삭제
				String saveDirectory = request.getServletContext().getInitParameter("IMG_DIR");
				Path filePath = Paths.get(saveDirectory, delFileName);
				try {
					Files.deleteIfExists(filePath);
					System.out.println("파일 삭제 완료");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
         // 자동로그아웃
		
	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("loginId");
	    if(!id.equals("admin")) {
		    request.getSession().invalidate();
	    }
			return "redirect:" + ctx + "/memberList.do";

		
	}
}
