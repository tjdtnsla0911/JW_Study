package com.example.demo.controller;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.repo.viewRepository;
import com.example.demo.vo.Members;

@Controller
public class viewController {
	
	@Autowired
	viewRepository viewRepo;
	
	@GetMapping("/")
	public String indexGo() {
		System.out.println("인덱스로 슝!");
		return "index";
	}
	
	@PostConstruct
	public void testMyBatis() {
		List<Members> members = viewRepo.allMembers();
		
		System.out.println("결과는  ? = "+members);
	}
	
	@GetMapping("signup")
	public String signUp() {
		System.err.println("회원가입하러감");
		return "signup";
	}
	
	@GetMapping("/checkId/{memberAcount}") //내가적은 url에 파라미터는 { }안에넣으면된다
	@ResponseBody //얘는 쉽게말하면 ajax쓰면 응답할땐 얘 or @RestController or ReponseEntity<> 중에서 택1인데처음인 얘를하겟습니다
	public Integer checkId(@PathVariable String memberAcount) {  //url 파라미터에 받은놈을 @PathVariable 를써서 받는다 이때 변수명은 같아야함
		///checkId/'+memberId
		System.err.println("checkId = "+memberAcount);
		//repository가 dao의 역할을하기때문에 
		var  result = viewRepo.checkMemberid(memberAcount);
		System.out.println("result 결과  ="+result);
		return result;
	}
	
	@GetMapping("/board")
	public Object board() {
		System.err.println("boardList로 슝!");
		return "boardList";
	}
}
