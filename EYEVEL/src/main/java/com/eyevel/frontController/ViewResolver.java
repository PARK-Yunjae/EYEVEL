package com.eyevel.frontController;

// CLS-026 : 페이지 이동시에 url을 바꿔주는 클래스
public class ViewResolver {
	public static String makeView(String nextPage) {
		return "/WEB-INF/" + nextPage + ".jsp";
	}
}
