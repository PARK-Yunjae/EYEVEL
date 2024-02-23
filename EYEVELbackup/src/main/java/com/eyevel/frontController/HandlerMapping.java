package com.eyevel.frontController;

import java.util.HashMap;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;
	
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		
		mappings.put("/main.do", new MainController());
	}

	public Controller getController(String key) {
		return mappings.get(key);
	}
}
