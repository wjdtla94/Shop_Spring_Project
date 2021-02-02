package com.spring.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.CartListVO;
import com.spring.model.CartVO;
import com.spring.model.GoodsViewVO;
import com.spring.model.MemberVO;
import com.spring.model.OrderDetailVO;
import com.spring.model.OrderListVO;
import com.spring.model.OrderVO;
import com.spring.model.ReplyListVO;
import com.spring.model.ReplyVO;
import com.spring.service.MemberService;
import com.spring.service.ShopService;

import oracle.net.aso.n;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	@Inject
	ShopService shopService;

	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public void getShop(Model model) {
		List<GoodsViewVO> all_list = null;
		try {
			all_list = shopService.all_list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("all_list", all_list);

	}

	// 카테고리별 상품 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode, @RequestParam("l") int cateCodeRef, Model model)
			throws Exception {
		List<GoodsViewVO> list = null;
		System.out.print(cateCodeRef);
		list = shopService.list(cateCode, cateCodeRef);

		model.addAttribute("list", list);

	}

	// 상품 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception {
		GoodsViewVO view = shopService.goodsView(gdsNum);

		model.addAttribute("view", view);
	}

	// 상품 소감(댓글) 작성
	@ResponseBody
	@RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
	public void registReply(ReplyVO reply, HttpSession session) throws Exception {
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 reply.setUserId(member.getUserId());
	 
	 shopService.registReply(reply);
	} 
	// 상품 소감(댓글) 목록
	@ResponseBody
	@RequestMapping(value = "/view/replyList", method = RequestMethod.GET)
	public List<ReplyListVO> getReplyList(@RequestParam("n") int gdsNum) throws Exception {
	   
	 List<ReplyListVO> reply = shopService.replyList(gdsNum);
	 
	 return reply;
	}
	// 상품 소감(댓글) 삭제
	@ResponseBody
	@RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
	public int getReplyList(ReplyVO reply, HttpSession session) throws Exception {
	 int result = 0;
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 String userId = shopService.idCheck(reply.getRepNum());
	   
	 if(member.getUserId().equals(userId)) {
	  reply.setUserId(member.getUserId());
	  shopService.deleteReply(reply);
	  result = 1;
	 }
	 
	 return result; 
	}
	// 상품 소감(댓글) 수정
	@ResponseBody
	@RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
	public int modifyReply(ReplyVO reply, HttpSession session) throws Exception {
	 int result = 0;
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 String userId = shopService.idCheck(reply.getRepNum());
	 
	 if(member.getUserId().equals(userId)) {
	  reply.setUserId(member.getUserId());
	  shopService.modifyReply(reply);
	  result = 1;
	 }
	 
	 return result;
	}
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) throws Exception {
	 int result = 0;
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 if(member != null) {
	  cart.setUserId(member.getUserId());
	  shopService.addCart(cart);
	   cart = null;
	  result = 1;
	 }
	 
	 return result;
	}
	// 카트 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
	 
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 String userId = member.getUserId();
	 
	 List<CartListVO> cartList = shopService.cartList(userId);
	 
	 model.addAttribute("cartList", cartList);
	 
	}
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
	 
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 String userId = member.getUserId();
	 
	 int result = 0;
	 int cartNum = 0;
	 
	 if(member != null) {
	  cart.setUserId(userId);
	  for(String i : chArr) {   
	   cartNum = Integer.parseInt(i);
	   cart.setCartNum(cartNum);
	   shopService.deleteCart(cart);
	  }   
	  result = 1;
	 }  
	 return result;  
	}
	// 주문
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
	 
	 MemberVO member = (MemberVO)session.getAttribute("member");  
	 String userId = member.getUserId();
	 Calendar cal = Calendar.getInstance();
	 int year = cal.get(Calendar.YEAR);
	 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	 String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	 String subNum = "";
	 
	 for(int i = 1; i <= 6; i ++) {
	  subNum += (int)(Math.random() * 10);
	 }
	 
	 String orderId = ymd + "_" + subNum;
	 
	 order.setOrderId(orderId);
	 order.setUserId(userId);
	  
	 shopService.orderInfo(order);
	 
	 orderDetail.setOrderId(orderId);   
	 shopService.orderInfo_Details(orderDetail);
	 
	 shopService.cartAllDelete(userId);
	 order = null;
	 return "redirect:/shop/orderList";  
	}
	// 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
	 
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 String userId = member.getUserId();
	 
	 order.setUserId(userId);
	 List<OrderVO> orderList = shopService.orderList(order);
	 
	 model.addAttribute("orderList", orderList);
	}
	// 주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model)
			throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);
		order.setOrderId(orderId);

		List<OrderListVO> orderView = shopService.orderView(order);

		model.addAttribute("orderView", orderView);
	}
	//주소 가져오기
	@ResponseBody
	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public List<MemberVO> address(HttpSession session, Model model) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
	 List<MemberVO> user = shopService.memberInfo(userId);
	 
	 return user;  
	}
	
}