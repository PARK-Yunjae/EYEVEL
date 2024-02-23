package com.eyevel.vo;

//CLS-005 게시판 테이블
public class Board {

	private int no;
	private int category;
	private int isPrivate;
	private String memeberId;
	private String title;
	private String contents;
	private String regDate;
	private String hits;
	private int heart;
	private int adminCheck;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getIsPrivate() {
		return isPrivate;
	}

	public void setIsPrivate(int isPrivate) {
		this.isPrivate = isPrivate;
	}

	public String getMemeberId() {
		return memeberId;
	}

	public void setMemeberId(String memeberId) {
		this.memeberId = memeberId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegdate() {
		return regDate;
	}

	public void setRegdate(String regdate) {
		this.regDate = regdate;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public int getAdminCheck() {
		return adminCheck;
	}

	public void setAdminCheck(int adminCheck) {
		this.adminCheck = adminCheck;
	}

	public String getHits() {
		return hits;
	}

	public void setHits(String hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", category=" + category + ", isPrivate=" + isPrivate + ", memeberId=" + memeberId
				+ ", title=" + title + ", contents=" + contents + ", regDate=" + regDate + ", hits=" + hits + ", heart="
				+ heart + ", adminCheck=" + adminCheck + "]";
	}

}
