package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.mapper.AdminDAO;
import com.spring.model.CategoryVO;
import com.spring.model.Criteria;
import com.spring.model.GoodsVO;
import com.spring.model.GoodsViewVO;
import com.spring.model.OrderDetailVO;
import com.spring.model.OrderListVO;
import com.spring.model.OrderVO;
import com.spring.model.ReplyListVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	private AdminDAO dao;

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		// TODO Auto-generated method stub
		return dao.category();
	}

	// 상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.register(vo);
	}

	// 상품목록
	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		// TODO Auto-generated method stub
		return dao.goodslist();
	}

	// 상품조회 + 카테고리 조인
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.goosView(gdsNum);
	}

	// 상품등록
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.goodsModify(vo);
	}

	// 상품삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		dao.goodsDelete(gdsNum);
	}

	// 목록 + 페이징
	@Override
	public List<GoodsViewVO> listPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(cri);
	}

	// 상품 갯수
	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount();
	}

	// 주문목록
	@Override
	public List<OrderVO> orderList(String delivery) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderList(delivery);
	}

	// 주문상세
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderView(order);
	}

	// 배송현황바꾸기
	@Override
	public void delivery(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		dao.delivery(order);
	}

	// 주문 시 수량 감소
	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		// TODO Auto-generated method stub
		dao.changeStock(goods);
	}

	// 리뷰목록
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		// TODO Auto-generated method stub
		return dao.allReply();
	}

	// 리뷰삭제
	@Override
	public void deleteReply(int repNum) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(repNum);
	}

	// 최근 1주일 매출
	@Override
	public List<OrderVO> sales() throws Exception {
		// TODO Auto-generated method stub
		return dao.sales();
	}

	// 상품별 매출 현황
	@Override
	public List<OrderDetailVO> goods() throws Exception {
		// TODO Auto-generated method stub
		return dao.goods();
	}

}
