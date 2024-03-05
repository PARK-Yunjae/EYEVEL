package com.eyevel.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.eyevel.util.MybatisConfig;
import com.eyevel.vo.BoardComment;

// 게시판 댓글 테이블 에서 값을 가져오는 클래스
public class BoardCommentDAO {
	
	private static BoardCommentDAO instance = new BoardCommentDAO();

	public static BoardCommentDAO getInstance() {
		return instance;
	}
	
	// 해당 개시글의 댓글 리스트를 실어줌
	public ArrayList<BoardComment> selectBoardComments(int no){
		SqlSession session = MybatisConfig.getInstance().openSession();
		ArrayList<BoardComment> list = null;
		session.selectList("selectBoardComments", no);
		session.close();
		return list;
	}
	
	// 게시글 추가
	public void insertBoardComment(BoardComment bc) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.insert("insertBoardComment", bc);
		session.commit();
		session.close();
	}
	
	// 마지막으로 저장된 게시글 댓글 가져오기
	public BoardComment getLastBoardComment() {
		SqlSession session = MybatisConfig.getInstance().openSession();
		BoardComment bc = session.selectOne("getLastBoardComment");
		session.close();
		return bc;
	}
}