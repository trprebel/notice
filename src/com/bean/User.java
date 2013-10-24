package com.bean;

public class User {

	private String username;
	private String password;
	private int roleid;
	private String role;
	private int edit;
	private int addimpro;
	private int notice;
	private int activity;
	private int showtype;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public int getEdit() {
		return edit;
	}
	public void setEdit(int edit) {
		this.edit = edit;
	}
	public int getAddimpro() {
		return addimpro;
	}
	public void setAddimpro(int addimpro) {
		this.addimpro = addimpro;
	}
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public int getActivity() {
		return activity;
	}
	public void setActivity(int activity) {
		this.activity = activity;
	}
	public int getShowtype() {
		return showtype;
	}
	public void setShowtype(int showtype) {
		this.showtype = showtype;
	}
}
