package com.dao.impl;

import com.bean.User;

public class UserDao {

	//ͨ���û�����ѯ��Ϣ
	public User findUserByName(String username) throws Exception {
		//System.out.println(username);
		return (User)SqlMap.getSqlMapClient().queryForObject("findUserByName",username);
	}
	/**�����û�*/
	public void createUser(User user) throws Exception
	{
		//System.out.println("name=="+user.getUsername());
		SqlMap.getSqlMapClient().insert("createUser",user);
	}
}
