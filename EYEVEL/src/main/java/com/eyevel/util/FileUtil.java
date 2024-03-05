package com.eyevel.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

// CLS-058 : 파일 업로드 다운로드시 불러오는 클래스
public class FileUtil {
	// 폴더 생성
	public static void newFolder(HttpServletRequest req) {
		String saveDirectory = req.getServletContext().getRealPath("/img");
		Path saveDirPath = Paths.get(saveDirectory);
		if (!Files.isDirectory(saveDirPath)) {
			try {
				Files.createDirectories(saveDirPath);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 파일 업로드
	public static String uploadFile(HttpServletRequest req, String sDirectory, String id)
			throws ServletException, IOException {
		// Part 객체를 통해 서버로 전송된 파일명 읽어오기
		Part part = req.getPart("img");

		// Part 객체의 헤더값 중 content-disposition 읽어오기
		String partHeader = part.getHeader("content-disposition");
		// 출력결과 => form-data; name="attachedFile"; filename="파일명.jpg"
		System.out.println("partHeader=" + partHeader);

		// 헤더값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
		String originalFileName = phArr[1].trim().replace("\"", "");
//		String originalFileName = id + ".png";

		// 전송된 파일이 있다면 디렉토리에 저장
		if (!originalFileName.isEmpty()) {
			part.write(sDirectory + File.separator + id + ".png");
		}

		// 원본 파일명 반환
		return id + ".png";
	}

	// 파일명 변경
	public static String renameFile(String sDirectory, String fileName, String area_name, int cnt) {
		// 원본파일의 확장자 잘라내기
		String ext = fileName.substring(fileName.lastIndexOf("."));
		
		String areaWeatherName = area_name + (cnt%4 == 0 ? "_sunny" : cnt%4==1 ? "_cloudy" : cnt%4==2 ? "_rainy" : "_snowy");
		areaWeatherName += cnt>3 ? "_night" : "";
		
		// 날짜 및 시간을 통해 파일명 생성
		//String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		// "날짜_시간.확장자" 형태의 새로운 파일명 생성
		String newFileName = areaWeatherName + ext;

		// 기존 파일명을 새로운 파일명으로 변경
		//File oldFile = new File(sDirectory + File.separator + fileName);
		//File newFile = new File(sDirectory + File.separator + newFileName);
		//oldFile.renameTo(newFile);

		// 변경된 파일명 반환
		return newFileName;
	}

	// multiple 속성 추가로 2개 이상의 파일 업로드
	public static ArrayList<String> multipleFile(HttpServletRequest req, String sDirectory, String area_name)
			throws ServletException, IOException {
		// 파일명 저장을 위한 컬렉션 생성
		ArrayList<String> listFileName = new ArrayList<>();

		// Part 객체를 통해 서버로 전송된 파일명 읽어오기
		Collection<Part> parts = req.getParts();
		int cnt = 0;
		for (Part part : parts) {
			// 파일이 아니라면 업로드의 대상이 아니므로 무시 - indexOf 대신 equals 였음
			if (part.getName().indexOf("weatherImg") == -1)
				continue;
			// Part 객체의 헤더값 중 content-disposition 읽어오기
			String partHeader = part.getHeader("content-disposition");
			// 출력결과 => form-data; name="attachedFile"; filename="파일명.jpg"
			System.out.println("partHeader=" + partHeader);

			// 헤더값에서 파일명 잘라내기
			String[] phArr = partHeader.split("filename=");
			if(phArr[1].equals("\"\"")) {
				cnt++;
				continue;
			}
			String originalFileName = phArr[1].trim().replace("\"", "");
			originalFileName = renameFile(sDirectory,originalFileName,area_name,cnt);
			// 전송된 파일이 있다면 디렉토리에 저장
			if (!originalFileName.isEmpty()) {
				part.write(sDirectory + File.separator + originalFileName);
			}
			originalFileName = originalFileName.substring(0, originalFileName.length()-4);

			//originalFileName = renameFile(sDirectory,phArr[1],area_name,cnt);
			
			// 컬렉션에 추가
			listFileName.add(originalFileName);
			cnt++;
		}

		// 원본 파일명 반환
		return listFileName;
	}

	// 파일 다운로드
	public static void download(HttpServletRequest req, HttpServletResponse resp, String directory, String sfileName,
			String ofileName) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		try {
			// 파일을 찾아 입력 스트림 생성
			File file = new File(sDirectory, sfileName);
			InputStream iStream = new FileInputStream(file);

			// 한글 파일명 깨짐 방지
			String client = req.getHeader("User-Agent");
			if (client.indexOf("WOW64") == -1) {
				ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
			}

			// 파일 다운로드용 응답 헤더 설정
			resp.reset();
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName + "\"");
			resp.setHeader("Content-Length", "" + file.length());

			// out.clear(); // 출력 스트림 초기화

			// response 내장 객체로부터 새로운 출력 스트림 생성
			OutputStream oStream = resp.getOutputStream();

			// 출력 스트림에 파일 내용 출력
			byte b[] = new byte[(int) file.length()];
			int readBuffer = 0;
			while ((readBuffer = iStream.read(b)) > 0) {
				oStream.write(b, 0, readBuffer);
			}

			// 입/출력 스트림 닫음
			iStream.close();
			oStream.close();
		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("예외가 발생하였습니다.");
			e.printStackTrace();
		}
	}

	// 파일 삭제
	public static void deleteFile(HttpServletRequest req, String directory, String filename) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		File file = new File(sDirectory + File.separator + filename);
		if (file.exists()) {
			file.delete();
		}
	}

	// 인터넷에서 긁어온 디렉토리에서 하위 폴더까지 삭제 해주는 메서드
	private static boolean deleteDirectoryAndFiles(File targetFolder) {
		if (!targetFolder.exists()) {
			return false;
		}

		File[] files = targetFolder.listFiles();
		for (File file : files) {
			if (file.isDirectory()) {
				deleteDirectoryAndFiles(file);
			}
			file.delete();
		}

		return targetFolder.delete();
	}

	// 파일 전체 삭제
	public static void deleteAllFile(HttpServletRequest req, String directory) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		File file = new File(sDirectory + File.separator);
		deleteDirectoryAndFiles(file);
	}

}
