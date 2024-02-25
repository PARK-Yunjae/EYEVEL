package com.eyevel.dao;

//CLS-010 댓글테이블 에서 값을 가져오는 클래스
public class CommentDAO {
	
	private static CommentDAO instance = new CommentDAO();

	public static CommentDAO getInstance() {
		return instance;
	}
	
}
