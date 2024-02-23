package com.eyevel.vo;

//CLS-002 관광지 테이블
public class Area {

	private int no;
	private String name;
	private String contents;
	private String link_url;
	private String continent;
	private int dir_X;
	private int dir_Y;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	public int getDir_X() {
		return dir_X;
	}

	public void setDir_X(int dir_X) {
		this.dir_X = dir_X;
	}

	public int getDir_Y() {
		return dir_Y;
	}

	public void setDir_Y(int dir_Y) {
		this.dir_Y = dir_Y;
	}

	@Override
	public String toString() {
		return "Area [no=" + no + ", name=" + name + ", contents=" + contents + ", link_url=" + link_url
				+ ", continent=" + continent + ", dir_X=" + dir_X + ", dir_Y=" + dir_Y + ", lon=" + lon + ", lat=" + lat
				+ ", id=" + id + "]";
	}

}
