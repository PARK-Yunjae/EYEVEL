package com.eyevel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eyevel.util.MybatisConfig;
import com.eyevel.vo.Board;

//CLS-011 게시판테이블 에서 값을 가져오는 클래스
public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

//	보드 리스트를 가져오는 메소드
	public List<Board> boardList() {
		SqlSession session = MybatisConfig.getInstance().openSession();
		List<Board> list = session.selectList("boardList");
		System.out.println("list=" + list);
		System.out.println("size=" + list.size());
		System.out.println(list);
		session.close();
		return list;
	}

//	보드 추가
	public int boardAdd(Board b) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		int cnt = session.insert("boardAdd", b);
		session.commit();
		session.close();
		return cnt;
	}

//	보드 하나 가져오는 메소드
	public Board boardDetail(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		Board b = session.selectOne("boardDetail", no);
		session.close();
		return b;
	}

//	보드 삭제
	public void boardDelete(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.selectOne("boardDelete", no);
		session.commit();
		session.close();
	}

//	보드 수정
	public void boardUpdate(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.selectOne("boardUpdate", no);
		session.commit();
		session.close();
	}

//	조회수 증가
	public void boardCount(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.update("boardCount", no);
		session.commit();
		session.close();
	}
}
