package com.dao.impl;

import com.bean.User;

public class UserDao {

	//通过用户名查询信息
	public User findUserByName(String username) throws Exception {
		//System.out.println(username);
		return (User)SqlMap.getSqlMapClient().queryForObject("findUserByName",username);
	}
	/**创建用户*/
	public void createUser(User user) throws Exception
	{
		//System.out.println("name=="+user.getUsername());
		SqlMap.getSqlMapClient().insert("createUser",user);
	}
}
