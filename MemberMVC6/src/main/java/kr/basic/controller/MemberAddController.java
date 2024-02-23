package kr.basic.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.basic.model.MemberDAO;
import kr.basic.model.MemberVO;

public class MemberAddController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String saveDirectory = "C:\\Users\\TJ\\git\\PYMjspWorkspace\\MemberMVC6\\img";

		Path saveDirPath = Paths.get(saveDirectory);
		if (!Files.isDirectory(saveDirPath)) {
			Files.createDirectories(saveDirPath);
		}
		System.out.println("saveDirectory = " + saveDirectory);
		// 반드시 파일 업로드 할때는 MultipartRequest 만 사용 가능

		// 데이터 받기----<주의 하기> request 가 아닌 multi 로 값을 받는다.
		// 폼에서 전송한 파라미터의 이름을 인자로 받아서 그 파라미터의 값을 반환한다. // request 객체 사용할 수 없음

		MultipartRequest multi = new MultipartRequest(request, saveDirPath.toString(), 5 * 1024 * 1024, "UTF-8",
				new DefaultFileRenamePolicy());

		String sFileName = null;
		String oFileName = null;
		if (multi.getFilesystemName("uploadFile") != null) {
			sFileName = multi.getFilesystemName("uploadFile");// 실제 서버에 올라간 파일이름

			oFileName = multi.getOriginalFileName("uploadFile"); // 우리가 업로드한 파일이름
			String fileType = multi.getContentType("uploadFile"); // 파일의 타입 .txt , jpg , .png
			System.out.println("fileType= " + fileType);

		}

		String id = multi.getParameter("id");
		String pass = multi.getParameter("pass");
		String name = multi.getParameter("name");
		int age = Integer.parseInt(multi.getParameter("age"));
		String email = multi.getParameter("email");
		String phone = multi.getParameter("phone");
		MemberVO vo = null;
		System.out.println("savefileName= " + sFileName);
		System.out.println("orginFileName= " + oFileName);
		vo = new MemberVO(id, pass, name, age, email, phone, oFileName, sFileName);

		String ctx = request.getContextPath();
		int cnt = MemberDAO.getInstance().memberInsert(vo);
		if (cnt > 0) {
			return "redirect:" + ctx + "/memberList.do";
		} else {
			throw new ServletException("not insert");
		}
	}

}
