package com.dao.impl;

import com.bean.User;

public class UserDao {

	//通过用户名查询信息
	public User findUserByName(String username) throws Exception {
		//System.out.println(username);
		return (User)SqlMap.getSqlMapClient().queryForObject("findUserByName",username);
	}
}
