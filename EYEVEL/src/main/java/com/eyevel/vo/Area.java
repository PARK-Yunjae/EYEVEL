package com.eyevel.vo;
//CLS-002 관광지 테이블
public class Area {
	
	private int no;
	private String name;
	private String link_url;
	private int lon;
	private int lat;
	private int id;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLink_url() {
		return link_url;
	}
	public void setLink_url(String link_url) {
		this.link_url = link_url;
	}
	public int getLon() {
		return lon;
	}
	public void setLon(int lon) {
		this.lon = lon;
	}
	public int getLat() {
		return lat;
	}
	public void setLat(int lat) {
		this.lat = lat;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Area [no=" + no + ", name=" + name + ", link_url=" + link_url + ", lon=" + lon + ", lat=" + lat
				+ ", id=" + id + "]";
	}
	
	
	

}
