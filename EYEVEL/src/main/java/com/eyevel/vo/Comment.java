package com.eyevel.vo;

//CLS-004 댓글 테이블
public class Comment {

	private int no;
	private String member_id;
	private int area_no;
	private String reg_datetime;
	private String contents;
	
	
	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public int getArea_no() {
		return area_no;
	}


	public void setArea_no(int area_no) {
		this.area_no = area_no;
	}


	public String getReg_datetime() {
		return reg_datetime;
	}


	public void setReg_datetime(String reg_datetime) {
		this.reg_datetime = reg_datetime;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	@Override
	public String toString() {
		return "Comment [no=" + no + ", member_id=" + member_id + ", area_no=" + area_no + ", reg_datetime="
				+ reg_datetime + ", contents=" + contents + "]";
	}


	
}
