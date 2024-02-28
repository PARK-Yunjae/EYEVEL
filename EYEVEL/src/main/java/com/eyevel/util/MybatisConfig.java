package com.eyevel.util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// CLS-057 : SqlSessionFactory를 싱글턴 패턴으로 관리하기 위한 클래스
public class MybatisConfig {

	private static SqlSessionFactory sqlSessionFactory; // [O O O O O ]

	// 초기화 블럭-프로그램실행시 딱 한번만 실되는 코드영역
	static {
		try {
			String resource = "com/eyevel/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);// 읽기
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getInstance() {
		return sqlSessionFactory;
	}
}
