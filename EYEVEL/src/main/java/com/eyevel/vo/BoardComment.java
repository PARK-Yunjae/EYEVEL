package com.eyevel.vo;

// 게시글 댓글 테이블
public class BoardComment {

	private int no;
	private int board_no;
	private String comment;
	private String member_id;
	private String reg_datetime;
	private String img;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getReg_datetime() {
		return reg_datetime;
	}

	public void setReg_datetime(String reg_datetime) {
		this.reg_datetime = reg_datetime;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "BoardComment [no=" + no + ", board_no=" + board_no + ", comment=" + comment + ", member_id=" + member_id
				+ ", regDatetime=" + reg_datetime + "]";
	}

}