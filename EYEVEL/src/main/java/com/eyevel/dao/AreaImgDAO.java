package com.eyevel.dao;

import java.util.ArrayList;
import java.util.List;

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
			session.insert("addAreaImg",ai);
			session.commit();
		}
		session.close();
	}
	
	// 관광지 이미지 업데이트
	public void updateAreaImg(ArrayList<AreaImg> aiList) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		for(AreaImg ai : aiList) {
			session.insert("addAreaImg",ai);
			session.commit();
		}
		session.close();
	}

	public List<AreaImg> getimg(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		List<AreaImg> list = session.selectList("getAreaimgList", no);
		session.close();
		return list;
	}
	
	//night가 아닌 이미지 불러오기
	public List<AreaImg> getimgWithoutNight(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		List<AreaImg> list = session.selectList("getAreaImgListWithoutNight", no);
		session.close();
		return list;
	}
	
	//관광지의 이미지 파일 삭제
	public void deleteAreaImg(int area_no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.insert("deleteAreaImg", area_no);
		session.commit();
		session.close();
	}
	
}
