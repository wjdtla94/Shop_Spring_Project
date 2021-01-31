package com.spring.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.model.AddressVO;
import com.spring.model.MemberVO;
import com.spring.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Inject
	MemberService memberService;
	
	// 로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception {
	}

	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void getMypage() throws Exception {
	}

	// 로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		MemberVO login = memberService.login(vo);
		HttpSession session = req.getSession();
		

		if (login != null) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/login";
		}

		return "redirect:/index";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		memberService.logout(session);

		return "redirect:/index";
	}

	// 우편검색 get
	@RequestMapping(value = "/member/address", method = RequestMethod.GET)
	public String address() {
		return "/member/address";
	}

	// 우편검색 post
	@RequestMapping(value = "/member/adsearch", method = RequestMethod.POST)
	public String adsearch(Model model, HttpServletRequest req) {
		List<AddressVO> address = null;
		String dong = req.getParameter("address");
		try {
			address = memberService.selectAd(dong);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("address", address);
		return "/member/adlist";
	}

	// 회원 가입 get
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void getJoin() throws Exception {
	}

	// 회원 가입 post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberVO vo, Model model) throws Exception {
		memberService.join(vo);
		model.addAttribute("msg", true);

		return "/member/login";
	}
	//중복체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(@RequestParam("userId") String userId) {
		int result = 0;
		try {
			MemberVO member = memberService.idCheck(userId);
			if(member != null) {
				result = 1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
