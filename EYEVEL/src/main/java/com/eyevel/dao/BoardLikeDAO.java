package com.eyevel.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.eyevel.util.MybatisConfig;
import com.eyevel.vo.BoardLike;

// 게시판좋아요 테이블에서 값을 가져오는 클래스
public class BoardLikeDAO {
	private static BoardLikeDAO instance = new BoardLikeDAO();

	public static BoardLikeDAO getInstance() {
		return instance;
	}

	// 게시글에서 내가 좋아요 한 글이 있다면 가저감
	public BoardLike getMyBoardLike(HashMap<String, String> myLike){
		SqlSession session = MybatisConfig.getInstance().openSession();
		BoardLike bl = session.selectOne("getMyBoardLike", myLike);
		session.close();
		return bl;
	}
	
	// 좋아요 추가
	public void addBoardLike(BoardLike bl) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.insert("addBoardLike", bl);
		session.commit();
		session.close();
	}
	
	// 좋아요 삭제
	public void deleteBoardLike(BoardLike bl) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.delete("deleteBoardLike", bl);
		session.commit();
		session.close();
	}
}
