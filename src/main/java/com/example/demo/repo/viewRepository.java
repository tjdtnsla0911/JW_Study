package com.example.demo.repo;

import java.util.List;

import com.example.demo.vo.Members;
//여기가 dao의 역할을 한다 여기서 바로 xml로 직행한다!
public interface viewRepository {
	
	public List<Members> allMembers();
	
	public Integer checkMemberid(String memberAcount);
}
