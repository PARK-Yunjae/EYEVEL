package com.eyevel.vo;

//CLS-003 찜 테이블
public class Zzim {

	private int area_no;
	private String member_id;

	public int getArea_no() {
		return area_no;
	}

	public void setArea_no(int area_no) {
		this.area_no = area_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "Zzim [areaNo=" + area_no + ", memberId=" + member_id + "]";
	}

}
