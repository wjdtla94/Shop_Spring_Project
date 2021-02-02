package com.spring.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.model.AddressVO;
import com.spring.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession sqlSession;

	// 매퍼
	private static String namespace = "com.spring.mappers.memberMapper";

	// 회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub

		sqlSession.insert(namespace + ".join", vo);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".login", vo);
	}

	// 주소검색
	@Override
	public List<AddressVO> selectAd(String dong) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".adsearch", dong);
	}

	// 아이디체크
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".idCheck", userId);
	}

}
