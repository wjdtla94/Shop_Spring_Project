package com.spring.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.model.CartListVO;
import com.spring.model.CartVO;
import com.spring.model.GoodsViewVO;
import com.spring.model.MemberVO;
import com.spring.model.OrderDetailVO;
import com.spring.model.OrderListVO;
import com.spring.model.OrderVO;
import com.spring.model.ReplyListVO;
import com.spring.model.ReplyVO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	@Inject
	private SqlSession sqlSession;

	// 매퍼
	private static String namespace = "com.spring.mappers.shopMapper";

	// 카테고리별 상품 리스트
	@Override
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
		// TODO Auto-generated method stub
		if (cateCodeRef == 1) {
			return sqlSession.selectList(namespace + ".level_list", cateCode);
		} else {
			return sqlSession.selectList(namespace + ".list", cateCode);
		}
	}

	// 전체상품 리스트
	@Override
	public List<GoodsViewVO> all_list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".all_list");
	}

	// 상품상세
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".goodsView", gdsNum);
	}

	// 리뷰남기기
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".registReply", reply);
	}

	// 리뷰 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".replyList", gdsNum);
	}
	//리뷰 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".deleteReply", reply);
	}
	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".replyUserIdCheck", repNum);
	}
	//리뷰 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".modifyReply", reply);
	}
	//카트담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".addCart", cart);
	}
	//카트리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".cartList", userId);
	}
	//카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".deleteCart", cart);
	}
	//주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".orderInfo", order);
	}
	//주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace + ".orderInfo_Details", orderDetail);
	}
	//카트 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.delete(namespace + ".cartAllDelete", userId);
	}
	//주문목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".orderList", order);
	}
	//특정 주문 목록 (3개 테이블 join)
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".orderView", order);
	}

	@Override
	public List<MemberVO> memberInfo(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".memberInfo", userId);
	}

}
