package com.eyevel.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.eyevel.vo.Member;


//CLS-007 유저테이블에서 값을 가져오는 클래스
public class MemberDAO {
	// 싱글톤
	private MemberDAO() {
	}

	static private MemberDAO instance = new MemberDAO();

	static public MemberDAO getInstance() {
		return instance;
	}

	private static SqlSessionFactory sqlSessionFactory;

	// mybatis에서 설정을 가져옴. 처음 실행될때 한번만 실행됨.
	static {
		try {
			String resource = "com/eyevel/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);// 읽기
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 맴버 리스트를 가져오는 메소드
	public List<Member> memberList() {
		// 컨넥션 객체 + sql 쿼리문 실행해주는 객체
		SqlSession session = sqlSessionFactory.openSession();
		List<Member> list = session.selectList("memberList");
		session.close();
		return list;
	}
	//멤버 가입메소드
	public int memberInsert(Member m) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.insert("memberInsert", m);
		
		return cnt;
	}
	//회원 로그인
    public String checkLogin(String id, String pw) {
		Member vo = new Member();
		vo.setId(id);
		vo.setPw(pw);
		System.out.println("로그인DAO");
    	SqlSession session = sqlSessionFactory.openSession();
    	String name = session.selectOne("checkLogin", vo);
    	System.out.println(name);
    	
       return name;
    }
	
}
