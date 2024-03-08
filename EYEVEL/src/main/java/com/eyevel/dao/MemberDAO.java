package com.eyevel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eyevel.util.MybatisConfig;
import com.eyevel.vo.Member;

// CLS-007 유저테이블에서 값을 가져오는 클래스
public class MemberDAO {
	// 싱글톤
	private MemberDAO() {
	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	// 멤버 리스트를 가져오는 메소드
	public List<Member> memberList() {
		// 컨넥션 객체 + sql 쿼리문 실행해주는 객체
		SqlSession session = MybatisConfig.getInstance().openSession();
		List<Member> list = session.selectList("memberList");
		session.close();
		return list;
	}

	// 멤버 가입메소드
	public int memberInsert(Member m) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		int cnt = session.insert("memberInsert", m);
		session.commit();
		session.close();
		return cnt;
	}

	// 회원 로그인
	public String checkLogin(String id, String pw) {
		Member vo = new Member();
		vo.setId(id);
		vo.setPw(pw);
		System.out.println("로그인DAO");
		SqlSession session = MybatisConfig.getInstance().openSession();
		String name = session.selectOne("checkLogin", vo);
		System.out.println(name);
		session.close();
		return name;
	}

	// 중복 id 체크 메소드
	public int checkId(String id) {
		System.out.println("ID비동기 체크 db 접속");
		SqlSession session = MybatisConfig.getInstance().openSession();
		int cnt = session.selectOne("validMemberId", id);
		session.close();
		return cnt;
	}

	// 멤버 하나 가져오는 메소드
	public Member memberContent(String id) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		Member m = session.selectOne("memberContent", id);
		session.close();
		return m;
	}

	// 회원 삭제? 탈퇴?
	public void memberDelete(String id) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		System.out.println("멤버 삭제 id = " + id);
		session.delete("memberDelete", id);
		session.commit();
		session.close();
	}

	// 멤버 업데이트
	public void memberUpdate(Member m) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.selectOne("memberUpdate", m);
		session.commit();
		session.close();
	}
}