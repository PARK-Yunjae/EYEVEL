package com.eyevel.vo;
//CLS-004 댓글 테이블
public class Comment {

	private int no;
	private String memberId;
	private int areaNo;
	private String contents;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	@Override
	public String toString() {
		return "Comment [no=" + no + ", memberId=" + memberId + ", areaNo=" + areaNo + ", contents=" + contents + "]";
	}
	
}
