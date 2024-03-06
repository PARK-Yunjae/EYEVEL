package com.eyevel.dao;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eyevel.util.MybatisConfig;
import com.eyevel.vo.Board;

//CLS-011 게시판테이블 에서 값을 가져오는 클래스
public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

//	보드 리스트를 가져오는 메소드
	public List<Board> boardList() {
		SqlSession session = MybatisConfig.getInstance().openSession();
		List<Board> list = session.selectList("boardList");
		session.close();
		list = formatBoardDate(list);
		return list;
	}

//	보드 추가
	public int boardAdd(Board b) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		int cnt = session.insert("boardAdd", b);
		session.commit();
		session.close();
		return cnt;
	}

//	보드 하나 가져오는 메소드
	public Board boardDetail(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		Board b = session.selectOne("boardDetail", no);
		session.close();
		return b;
	}

//	보드 삭제
	public void boardDelete(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.selectOne("boardDelete", no);
		session.commit();
		session.close();
	}
	
// 유저 아이디로 보드 삭제
	public void boardDeleteMemberId(String member_id) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.selectOne("boardDeleteMemberId", member_id);
		session.commit();
		session.close();
	}

//	보드 수정
	public void boardUpdate(int no, String title, String contents) {
		Board b = new Board();
		b.setNo(no);
		b.setTitle(title);
		b.setContents(contents);
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.selectOne("boardUpdate", b);
		session.commit();
		session.close();
	}

//	조회수 증가
	public void boardCount(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.update("boardCount", no);
		session.commit();
		session.close();
	}

//	자주 묻는 질문 가져오기
	public List<Board> boardQnAList() {
		SqlSession session = MybatisConfig.getInstance().openSession();
		List<Board> list = session.selectList("boardQnAList");
		session.close();
		return list;
	}

//	검색 리스트 가져오기
	public List<Board> boardSearchList(HashMap<String, String> strs) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		List<Board> list = null;
		if (strs.get("category").equals("-1")) {
			String searchText = strs.get("searchText");
			list = session.selectList("boardSearchList", searchText);
		} else {
			list = session.selectList("boardSearchCategoryList", strs);
		}
		session.close();
		list = formatBoardDate(list);
		return list;
	}

// 게시판에서 좋아요를 누르면 추가
	public void addBoardLike(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.update("addBoardHeart", no);
		session.commit();
		session.close();
	}

// 	게시판에서 좋아요를 누르면 삭제
	public void deleteBoardLike(int no) {
		SqlSession session = MybatisConfig.getInstance().openSession();
		session.update("deleteBoardHeart", no);
		session.commit();
		session.close();
	}
	
//	게시판에서 보여지는 날짜 바꾸기
	public List<Board> formatBoardDate(List<Board> list){
		// 여기서 당일 이면 시간을 남기고 당일이 아니면 날짜를 남긴다
		for(Board b : list) {
			String date = b.getReg_date().substring(0, 10);
	        LocalDate today = LocalDate.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        String formattedDate = today.format(formatter);
	        
	        if(date.equals(formattedDate)) {
	        	b.setRegdate(b.getReg_date().substring(10, b.getReg_date().length()).trim());
	        }else {
	        	b.setRegdate(date.trim());
	        }
		}
		return list;
	}
}
