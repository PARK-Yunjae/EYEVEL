package com.eyevel.dao;

//CLS-008 관광지테이블 에서 값을 가져오는 클래스
public class AreaDAO {
	private static AreaDAO instance = new AreaDAO();

	public static AreaDAO getInstance() {
		return instance;
	}
	
}
