package com.test.test.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.test.domain.TestDTO;
import com.test.test.mapper.TestMapper;
import com.test.test.service.TestService;

@Service
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestMapper mapper;

	@Override
	public int join(TestDTO tDto) throws Exception {
		
		return mapper.join(tDto);
	}

	@Override
	public TestDTO login(TestDTO tDto) throws Exception {
		// TODO Auto-generated method stub
		
		return mapper.login(tDto);
	}

	@Override
	public int idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.idCheck(id);
	}

	@Override
	public int update(TestDTO tDto) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(tDto);
	}

	@Override
	public int pwdCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		return mapper.pwdCheck(map);
	}

	@Override
	public TestDTO idView(String id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.idView(id);
	}

	@Override
	public void deleteUser(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		mapper.deleteUser(map);
		
	}

	@Override
	public String findId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mapper.findId(map);
	}

	@Override
	public String findPwd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mapper.findPwd(map);
	}
}
