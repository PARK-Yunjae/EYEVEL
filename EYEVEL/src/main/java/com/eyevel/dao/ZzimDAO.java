package com.eyevel.dao;

import org.apache.ibatis.session.SqlSession;

import com.eyevel.util.MybatisConfig;
import com.eyevel.vo.Zzim;

//CLS-009 찜테이블 에서 값을 가져오는 클래스
public class ZzimDAO {

	private static ZzimDAO instance = new ZzimDAO();

	public static ZzimDAO getInstance() {
		return instance;
	}

	public Zzim zzimMemeberList(Zzim zzim) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		Zzim z = session.selectOne("ZzimMemberList",zzim);
		session.close();
		return z;
	}

	public void zzimDelete(Zzim checkZzim) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.delete("ZzimDelete",checkZzim);
		session.commit();
		session.close();

	}

	public void zzimAdd(Zzim checkZzim) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		System.out.println(checkZzim);
		session.insert("ZzimAdd",checkZzim);
		session.commit();
		session.close();
	}
	
}
