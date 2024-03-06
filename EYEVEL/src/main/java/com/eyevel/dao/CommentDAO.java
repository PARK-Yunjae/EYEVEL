package com.eyevel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eyevel.util.MybatisConfig;
import com.eyevel.vo.Comment;

//CLS-010 댓글테이블 에서 값을 가져오는 클래스
public class CommentDAO {
	
	private static CommentDAO instance = new CommentDAO();

	public static CommentDAO getInstance() {
		return instance;
	}

	public List<Comment> commentList(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		List<Comment> c = session.selectList("commentList",no);
		session.close();

		return c;
	}

	public void commentAdd(Comment c) {
		
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.insert("commentAdd", c);
		session.commit();
		session.close();
		
	}

	public void commentDelete(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.delete("commentDelete", no);
		session.commit();
		session.close();
		
	}
	
	//관광지의 댓글 삭제
	public void areaCommentDelete(int area_no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.delete("areaCommentDelete", area_no);
		session.commit();
		session.close();
	}
	
	//유저의 관광지 댓글 삭제
	public void CommentDeleteMemberId(String member_id) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.delete("CommentDeleteMemberId", member_id);
		session.commit();
		session.close();
	}
}
