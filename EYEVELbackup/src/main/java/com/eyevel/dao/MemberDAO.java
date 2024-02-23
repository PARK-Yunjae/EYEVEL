package com.eyevel.dao;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {

	private MemberDAO() {}
	
	static private MemberDAO instance = new MemberDAO();
	static public MemberDAO getInstance() {
		return instance;
	}
	private static SqlSessionFactory sqlsessionFactory;
	//맨 처음에 무조건 딱 한번 실행되는 블럭 : static{}
	static {
		try {
			String resource = "com/eyevel/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlsessionFactory =
			  new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
