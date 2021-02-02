package com.spring.mapper;

import java.util.List;

import com.spring.model.CategoryVO;
import com.spring.model.Criteria;
import com.spring.model.GoodsVO;
import com.spring.model.GoodsViewVO;
import com.spring.model.OrderDetailVO;
import com.spring.model.OrderListVO;
import com.spring.model.OrderVO;
import com.spring.model.ReplyListVO;

public interface AdminDAO {
	// 카테고리
	public List<CategoryVO> category() throws Exception;

	// 상품등록
	public void register(GoodsVO vo) throws Exception;

	// 상품목록
	public List<GoodsViewVO> goodslist() throws Exception;

	// 상품목록 + 페이징
	public List<GoodsViewVO> listPage(Criteria cri) throws Exception;

	// 상품 갯수
	public int listCount() throws Exception;

	// 상품조회 + 카테고리 조인
	public GoodsViewVO goosView(int gdsNum) throws Exception;

	// 상품등록
	public void goodsModify(GoodsVO vo) throws Exception;

	// 상품삭제
	public void goodsDelete(int gdsNum) throws Exception;

	// 주문 목록
	public List<OrderVO> orderList(String delivery) throws Exception;

	// 특정 주문 목록 (3개 테이블 join)
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	// 배송상태
	public void delivery(OrderVO order) throws Exception;

	// 상품 수량 조정
	public void changeStock(GoodsVO goods) throws Exception;

	// 리뷰 목록
	public List<ReplyListVO> allReply() throws Exception;

	// 리뷰 삭제
	public void deleteReply(int repNum) throws Exception;

	// 매출현황
	public List<OrderVO> sales() throws Exception;

	// 상품별 매출 현황
	public List<OrderDetailVO> goods() throws Exception;

}
