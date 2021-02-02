package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.mapper.ShopDAO;
import com.spring.model.CartListVO;
import com.spring.model.CartVO;
import com.spring.model.GoodsViewVO;
import com.spring.model.MemberVO;
import com.spring.model.OrderDetailVO;
import com.spring.model.OrderListVO;
import com.spring.model.OrderVO;
import com.spring.model.ReplyListVO;
import com.spring.model.ReplyVO;

@Service
public class ShopServiceImpl implements ShopService {
	@Inject
	private ShopDAO dao;

	// 카테고리별 상품 리스트
	@Override
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(cateCode, cateCodeRef);
	}

	// 전체상품 리스트
	@Override
	public List<GoodsViewVO> all_list() throws Exception {
		// TODO Auto-generated method stub
		return dao.all_list();
	}

	// 상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.goodsView(gdsNum);
	}

	// 리뷰 남기기
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.registReply(reply);

	}

	// 리뷰 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.replyList(gdsNum);
	}

	// 리뷰삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(reply);
	}

	// 아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(repNum);
	}

	// 리뷰 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.modifyReply(reply);
	}

	// 카트담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		// TODO Auto-generated method stub
		dao.addCart(cart);
	}

	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.cartList(userId);
	}

	// 카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteCart(cart);
	}

	// 주문정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		dao.orderInfo(order);
	}

	// 주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		// TODO Auto-generated method stub
		dao.orderInfo_Details(orderDetail);
	}

	// 카트 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		dao.cartAllDelete(userId);
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderList(order);
	}

	// 특정 주문 목록 (3개 테이블 join)
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderView(order);
	}

	// 사용자 정보 가져오기
	@Override
	public List<MemberVO> memberInfo(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.memberInfo(userId);
	}

}
