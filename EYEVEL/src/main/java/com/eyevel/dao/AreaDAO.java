package com.eyevel.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eyevel.util.MybatisConfig;
import com.eyevel.vo.Area;

//CLS-008 관광지테이블 에서 값을 가져오는 클래스
public class AreaDAO {
	private static AreaDAO instance = new AreaDAO();

	public static AreaDAO getInstance() {
		return instance;
	}
	
	public Area areaContents(int no){
		SqlSession session = MybatisConfig.getInstance().openSession();
		Area a = session.selectOne("areaContent",no);
		session.close();
		return a;
	}
	
	//관광지 리스트를 가져오는 메소드
	public List<Area> areaList(){
		SqlSession session = MybatisConfig.getInstance().openSession();
		List<Area> list = session.selectList("areaList");
		session.close();
		return list;
	}

	public List<Area> areaContinentList(String area) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		List<Area> list = session.selectList("areaContinentList",area);
		session.close();
		return list;
	}
	
	// 관광지 추가
	public void areaAdd(Area a) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.insert("areaAdd", a);
		session.commit();
		session.close();
	}
	
	// 관광지 넘버 가져오기
	public int areaGetNo(int id) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		int cnt = session.selectOne("areaGetNo", id);
		session.close();
		return cnt;
	}
}
