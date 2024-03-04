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

	public Zzim zzimMemberList(Zzim zzim) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		Zzim z = session.selectOne("ZzimMemberList",zzim);
		session.close();
		return z;
	}
	
	public Zzim zzimMemberListById(Zzim zzim) {
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

	public void zzimDeletebyId(String id) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.delete("ZzimDeleteById",id);
		session.commit();
		session.close();
		
	}
	
	//관광지 넘버로 찜목록 삭제
	public void zzimDeletebyNo(int area_no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.delete("ZzimDeleteByNo",area_no);
		session.commit();
		session.close();
	}
	
}
