package com.spring.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.model.AddressVO;
import com.spring.model.MemberVO;

public interface MemberDAO {
	// 회원가입
	public void join(MemberVO vo) throws Exception;

	// 우편검색
	public List<AddressVO> selectAd(String dong) throws Exception;

	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;

	// 아이디체크
	public MemberVO idCheck(String userId) throws Exception;

}
