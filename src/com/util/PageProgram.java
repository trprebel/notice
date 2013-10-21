package com.util;

public class PageProgram {

	public int start;
	public int length;
	private String sproname;
	private String schargeperson;

	public PageProgram()
	{
		sproname=".";
		schargeperson=".";
	}
	public String getSproname() {
		return sproname;
	}
	public void setSproname(String sproname) {
		this.sproname = sproname;
	}
	public String getSchargeperson() {
		return schargeperson;
	}
	public void setSchargeperson(String schargeperson) {
		this.schargeperson = schargeperson;
	}
	public Integer sort;
	public String date;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
}
