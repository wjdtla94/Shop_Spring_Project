package com.spring.service;



import com.spring.model.MemberVO;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.model.AddressVO;

public interface MemberService {
	//회원가입
	public void join(MemberVO vo) throws Exception;
	//우편검색
	public List<AddressVO> selectAd(String dong) throws Exception;
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	//로그아웃
	public void logout(HttpSession session) throws Exception;
	//중복체크
	public MemberVO idCheck(String userId) throws Exception;
	
	
}
