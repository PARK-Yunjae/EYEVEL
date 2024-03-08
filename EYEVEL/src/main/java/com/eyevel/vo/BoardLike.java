package com.eyevel.vo;

// 게시판 좋아요 테이블
public class BoardLike {
	private int board_no;
	private String member_id;

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "BoardLike [board_no=" + board_no + ", member_id=" + member_id + "]";
	}
}