package kr.basic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.model.MemberDAO;

public class VaildIdAjaxController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// $.ajax();
		String id=request.getParameter("id"); // { "id" : id  }
		String passData = MemberDAO.getInstance().isValidId(id)? "valid" : "notValid";
	
		// ajax() 함수에 만들어놓은 callback함수 응답
		response.getWriter().print(passData);
		
		return null;
	}

}
