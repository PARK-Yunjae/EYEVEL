package com.eyevel.controller.board;

import java.io.IOException;
import java.util.HashMap;

import com.eyevel.dao.BoardDAO;
import com.eyevel.dao.BoardLikeDAO;
import com.eyevel.dao.MemberDAO;
import com.eyevel.frontController.Controller;
import com.eyevel.vo.Board;
import com.eyevel.vo.BoardLike;
import com.eyevel.vo.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//CLS-049 : 게시글 확인
public class BoardInfoController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int no = -1;
		if (req.getParameter("no") == null) {
			return "eyevel/board/boardList";
		} else {
			no = Integer.parseInt(req.getParameter("no"));
		}
		BoardDAO.getInstance().boardCount(no);
		Board b = BoardDAO.getInstance().boardDetail(no);
		req.setAttribute("board", b);
		// 프로필 이미지도 가져오기 - 여기는 게시글을 남긴 유저
		String id = b.getMember_id();
		Member m = MemberDAO.getInstance().memberContent(id);
		req.setAttribute("member", m);
		// 좋아요 버튼 눌렀으면 같이 보내주자 - 여기는 로그인을 한 유저
		HashMap<String, String> myLike = new HashMap<String, String>();
		myLike.put("board_no", no + "");
		myLike.put("member_id", (String)req.getSession().getAttribute("loginId"));
		BoardLike bl = BoardLikeDAO.getInstance().getMyBoardLike(myLike);
		if(bl != null) req.setAttribute("boardlike", bl);
		
		return "eyevel/board/boardInfo";
	}

}
