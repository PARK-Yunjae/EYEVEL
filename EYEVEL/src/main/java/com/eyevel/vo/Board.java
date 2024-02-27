package com.eyevel.vo;

//CLS-005 게시판 테이블
public class Board {

	private int no;
	private int category;
	private int is_private;
	private String member_id;
	private String title;
	private String contents;
	private String reg_date;
	private int hits;
	private int heart;
	private int admin_check;

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

	public int getIs_private() {
		return is_private;
	}

	public void setIs_private(int is_private) {
		this.is_private = is_private;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	public String getReg_date() {
		return reg_date;
	}

	public void setRegdate(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public int getAdmin_check() {
		return admin_check;
	}

	public void setAdmin_check(int admin_check) {
		this.admin_check = admin_check;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", category=" + category + ", is_private=" + is_private + ", member_id=" + member_id
				+ ", title=" + title + ", contents=" + contents + ", reg_date=" + reg_date + ", hits=" + hits
				+ ", heart=" + heart + ", admin_check=" + admin_check + "]";
	}

}
