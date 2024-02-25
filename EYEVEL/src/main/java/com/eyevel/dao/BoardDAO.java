package com.eyevel.dao;

//CLS-011 게시판테이블 에서 값을 가져오는 클래스
public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}
	
}
