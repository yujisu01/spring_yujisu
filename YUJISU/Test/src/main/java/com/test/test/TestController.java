package com.test.test;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.test.domain.TestDTO;
import com.test.test.service.TestService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class TestController {
	
	@Autowired
	private TestService tService;
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void join() throws Exception {
		
		
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public @ResponseBody String join(TestDTO tDto) throws Exception {
		
		log.info(tDto.toString());
		tService.join(tDto);
		return "success";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login1() {
		
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody String login(@RequestParam ("id") String id, @RequestParam("pwd") String pwd, HttpSession session) throws Exception{
		log.info(id);
		log.info(pwd);
		TestDTO tDto = new TestDTO();
		tDto.setId(id);
		tDto.setPwd(pwd);
		String result = null;
		
		TestDTO testDto = new TestDTO();
		testDto = tService.login(tDto);
		if(testDto != null) {
			session.setAttribute("loginUser", testDto);
			result = "success";
		}else {
			result = "fail";
		}
		
		log.info(tService.login(tDto));
		return result;
		
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public @ResponseBody int idcheck(@RequestParam("id") String id)throws Exception{
		log.info(id);
		
		return tService.idCheck(id);
	}
	@RequestMapping(value = "/pwdCheck", method = RequestMethod.POST)
	public @ResponseBody int pwdCheck(@RequestParam("id") String id, @RequestParam("pwd") String pwd)throws Exception{
		log.info("id: " +id + "pwd: " + pwd);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		return tService.pwdCheck(map);
	}
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		
		
		return "mypage";
	}
	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	public @ResponseBody String mypagePost(HttpSession session, TestDTO tDto) throws Exception{
		log.info(tDto.toString());
		tService.update(tDto);
		session.setAttribute("loginUser", tService.idView(tDto.getId()));
		return "mypage";
	}
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	public @ResponseBody String deleteUser(@RequestBody JSONObject json, HttpSession session) throws Exception {
		log.info(json);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", json.get("id").toString());
		map.put("pwd", json.get("pwd").toString());
		
		tService.deleteUser(map);
		
		session.invalidate();
		return "success";
	}
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public void findId() {
	}
	
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public @ResponseBody String findIdPost(@RequestParam("name") String name, @RequestParam("phone") String phone) throws Exception{
		log.info("name: "+name + "phone:" + phone);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("phone", phone);
		
		String result = tService.findId(map);
		return result;
		
	}
	@RequestMapping(value = "/findPwd", method = RequestMethod.GET)
	public void findPwd() {
		
	}
	@RequestMapping(value = "/findPwd", method = RequestMethod.POST)
	public @ResponseBody String findPwdPost(@RequestParam("id") String id, @RequestParam("phone") String phone) throws Exception{
		log.info("id : " + id + "phone :" + phone);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("phone", phone);
		
		String result = tService.findPwd(map);
		
		return result;
	}
	@RequestMapping(value = "/newPwd", method = RequestMethod.GET)
	public void newPwd() {
		
	}
	@RequestMapping(value = "/newPwd", method = RequestMethod.POST)
	public String newPwdPost(@RequestParam("newPwd") String pwd) throws Exception {
		tService.newPwd(pwd);
		return "index";
	}
	
	
}
