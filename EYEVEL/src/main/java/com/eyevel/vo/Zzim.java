package com.eyevel.vo;

//CLS-003 찜 테이블
public class Zzim {

	private int areaNo;
	private int memberId;

	public int getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Zzim [areaNo=" + areaNo + ", memberId=" + memberId + "]";
	}

}
