package com.eyevel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eyevel.util.MybatisConfig;
import com.eyevel.vo.BoardComment;

// 게시판 댓글 테이블에서 값을 가져오는 클래스
public class BoardCommentDAO {
	private static BoardCommentDAO instance = new BoardCommentDAO();

	public static BoardCommentDAO getInstance() {
		return instance;
	}

	// 해당 게시글의 댓글 리스트를 실어줌
	public List<BoardComment> selectBoardComments(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		List<BoardComment> list = session.selectList("selectBoardComments", no);
		session.close();
		return list;
	}

	// 게시글 댓글 추가
	public void insertBoardComment(BoardComment bc) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.insert("insertBoardComment", bc);
		session.commit();
		session.close();
	}

	// 게시글 댓글 삭제
	public void deleteBoardComment(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.delete("deleteBoardComment", no);
		session.commit();
		session.close();
	}

	// 게시글 댓글 삭제 (게시글 삭제시 전부 삭제)
	public void deleteBoardCommentByBoard(int board_no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.delete("deleteBoardCommentByBoard", board_no);
		session.commit();
		session.close();
	}

	// 게시글 댓글 삭제 (유저 삭제시 전부 삭제)
	public void deleteBoardCommentMemberId(String member_id) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.delete("deleteBoardCommentMemberId", member_id);
		session.commit();
		session.close();
	}
	//	// 마지막으로 저장된 게시글 댓글 가져오기
	//	비동기 용이었는데 보류하기로 함
	//	public BoardComment getLastBoardComment() {
	//		SqlSession session = MybatisConfig.getInstance().openSession();
	//		BoardComment bc = session.selectOne("getLastBoardComment");
	//		session.close();
	//		return bc;
	//	}
}