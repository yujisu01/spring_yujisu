package com.test.test.mapper;

import java.util.Map;

import com.test.test.domain.TestDTO;

public interface TestMapper {
	
	public int join(TestDTO tDto) throws Exception;
	public TestDTO login(TestDTO tDto) throws Exception;
	public int idCheck(String id) throws Exception;
	public int update(TestDTO tDto) throws Exception;
	public int pwdCheck(Map<String,Object> map) throws Exception;
	public TestDTO idView(String id) throws Exception;
	public void deleteUser(Map<String, Object> map) throws Exception;
	public String findId(Map<String, Object> map) throws Exception;
	public String findPwd(Map<String, Object> map) throws Exception;
}
