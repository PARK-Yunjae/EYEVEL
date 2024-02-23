package com.eyevel.frontController;

import java.util.HashMap;

import com.eyevel.controller.area.*;
import com.eyevel.controller.member.*;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		
		// member
		mappings.put("/main.do", new MainController());
		mappings.put("/memberList.do", new MemberListController()); //회원목록
		mappings.put("/memberJoin.do", new JoinMemberController()); //회원가입
		mappings.put("/memberLogin.do", new LoginCheckController()); //로그인
		mappings.put("/memberLogout.do", new LogoutController()); //로그아웃
		mappings.put("/memberInfo.do", new MemberInfoController()); //회원정보

		// area
		mappings.put("/earth.do", new AreaEarthController()); //회원정보
		mappings.put("/areaContinent.do", new AreaContinentController()); //회원정보
		
		
	}
	
	public Controller getController(String key) {
		return mappings.get(key);
	}
}
