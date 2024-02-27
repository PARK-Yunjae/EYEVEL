package com.eyevel.dao;



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
	
}
