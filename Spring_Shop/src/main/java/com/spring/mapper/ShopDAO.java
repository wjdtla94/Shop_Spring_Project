package com.spring.mapper;

import java.util.List;

import com.spring.model.CartListVO;
import com.spring.model.CartVO;
import com.spring.model.GoodsViewVO;
import com.spring.model.MemberVO;
import com.spring.model.OrderDetailVO;
import com.spring.model.OrderListVO;
import com.spring.model.OrderVO;
import com.spring.model.ReplyListVO;
import com.spring.model.ReplyVO;

public interface ShopDAO {
	//카테고리별 상품 리스트
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception;
	//전체상품 리스트
	public List<GoodsViewVO> all_list() throws Exception;
	//상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	//리뷰 남기기
	public void registReply(ReplyVO reply) throws Exception;
	//리뷰 리스트
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	//리뷰 삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	//아이디 체크
	public String idCheck(int repNum) throws Exception;
	//리뷰 수정
	public void modifyReply(ReplyVO reply) throws Exception;
	//카트담기
	public void addCart(CartVO cart) throws Exception;
	//카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;
	//카트 삭제
	public void deleteCart(CartVO cart) throws Exception;
	//주문 정보
	public void orderInfo(OrderVO order) throws Exception;
	//주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
	//카트 비우기
	public void cartAllDelete(String userId) throws Exception;
	//주문 목록
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	//특정 주문 목록 (3개 테이블 join)
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	//사용자정보가져오기
	public List<MemberVO> memberInfo(String userId) throws Exception;
}
