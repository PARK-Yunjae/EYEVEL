package kr.basic.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.basic.model.MemberDAO;

public class MemberUploadImgController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

         String saveDirectory = request.getServletContext().getInitParameter("IMG_DIR");
         System.out.println("saveDirectory= " + saveDirectory);
         
	//	String saveDirectory = request.getServletContext().getRealPath("/Uploads");

		Path saveDirPath = Paths.get(saveDirectory);
		if (!Files.isDirectory(saveDirPath)) {
			Files.createDirectories(saveDirPath);
		}
		System.out.println("saveDirectory = " + saveDirectory);

		if(request.getParameter("sName") != null) {
			Path filePath = Paths.get(saveDirectory, request.getParameter("sName"));		
			System.out.println(filePath.toString());
			
			try {
				boolean check = Files.deleteIfExists(filePath);
				if(check) {
					System.out.println("파일 삭제 완료 ");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

			return null;
		}
		

		
		// cos.jar 파일안에 있는 내용 
		MultipartRequest multi = new MultipartRequest(request, saveDirPath.toString(), 10 * 1024 * 1024, "utf-8",
				new DefaultFileRenamePolicy());  //파일이름이 서버 이미지 폴더안에 중복이 되면 중복된 파일에다가 + 2 => 파일 이름 중복처리 

		String sFileName = null;
		String oFileName = null;
		
		if (multi.getFilesystemName("uploadFile") != null) {
			sFileName = multi.getFilesystemName("uploadFile");// 실제 서버에 올라간 파일이름

			oFileName = multi.getOriginalFileName("uploadFile"); // 우리가 업로드한 파일이름
			//String fileType = multi.getContentType("uploadFile"); // 파일의 타입 .txt , jpg , .png
			//System.out.println("fileType= " + fileType);
			
			File file = multi.getFile("uploadFile");
			if (file != null) {
				System.out.println(" 파일 업로드 성공");
			} else {
				System.out.println(" 파일 업로드 실패");
			}

			

		}

		int num = Integer.parseInt(multi.getParameter("num"));
		response.setCharacterEncoding("utf-8");
		int cnt = MemberDAO.getInstance().memberUploadPhoto(num, oFileName, sFileName);
		if (cnt > 0) {
			response.getWriter().print(sFileName);
		} else {
			response.getWriter().print("fail");
		}
		return null;
	}

}
