package com.eyevel.frontController;

import java.util.HashMap;

import com.eyevel.controller.member.MemberListController;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		
		mappings.put("/main.do", new MainController());
		mappings.put("/memberList.do", new MemberListController());
	}
	
	public Controller getController(String key) {
		return mappings.get(key);
	}
}
