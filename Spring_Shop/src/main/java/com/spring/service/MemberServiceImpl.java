package com.spring.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.spring.mapper.MemberDAO;
import com.spring.model.AddressVO;
import com.spring.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	// 회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		dao.join(vo);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

	// 주소검색
	@Override
	public List<AddressVO> selectAd(String dong) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectAd(dong);
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		session.invalidate();
	}

	// 아이디체크
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(userId);
	}

}
