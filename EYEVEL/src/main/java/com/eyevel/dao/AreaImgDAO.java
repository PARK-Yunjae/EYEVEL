package com.eyevel.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.eyevel.util.MybatisConfig;
import com.eyevel.vo.AreaImg;

//CLS-012 관광지이미지테이블 에서 값을 가져오는 클래스
public class AreaImgDAO {

	private static AreaImgDAO instance = new AreaImgDAO();

	public static AreaImgDAO getInstance() {
		return instance;
	}
	
	// 관광지 추가 시 이미지 파일 추가
	public void addAreaImg(ArrayList<AreaImg> aiList) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		for(AreaImg ai : aiList) {
			System.out.println("아");
			session.insert("addAreaImg",ai);
			session.commit();
		}
		session.close();
	}
	
	//관광지의 이미지 파일 삭제
	public void deleteAreaImg(int area_no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.insert("deleteAreaImg", area_no);
		session.commit();
		session.close();
	}
	
}
