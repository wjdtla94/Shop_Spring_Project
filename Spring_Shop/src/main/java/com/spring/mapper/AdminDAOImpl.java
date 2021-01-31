package com.spring.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.model.CategoryVO;
import com.spring.model.Criteria;
import com.spring.model.GoodsVO;
import com.spring.model.GoodsViewVO;
import com.spring.model.OrderListVO;
import com.spring.model.OrderVO;
import com.spring.model.ReplyListVO;

import oracle.net.aso.r;
@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	private static String namespace = "com.spring.mappers.adminMapper";
	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".category");
	}
	//상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace + ".register", vo);
	}
	//상품목록
	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".goodslist");
	}
	//상품조회 + 카테고리 조인
	@Override
	public GoodsViewVO goosView(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".goodsView", gdsNum);
	}
	//상품수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace + ".goodsModify", vo);
	}
	//상품삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete(namespace + ".goodsDelete", gdsNum);
		
	}
	//상품목록 + 페이징
	@Override
	public List<GoodsViewVO> listPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".listpage", cri);
	}
	//상품 갯수
	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".listCount");
	}
	@Override
	public List<OrderVO> orderList(String delivery) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".orderList",delivery);
	}
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".orderView", order);
	}
	@Override
	public void delivery(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace + ".delivery", order);
	}
	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace+".changeStock",goods);
	}
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".allReply");
	}
	@Override
	public void deleteReply(int repNum) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete(namespace + ".deleteReply", repNum);
	}

}
