package com.kh.arp.member.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.member.model.service.MemberService;
import com.kh.arp.member.model.vo.Auth;
import com.kh.arp.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;
	
	@GetMapping("/login.me")
	public ModelAndView loginGet(ModelAndView mv, HttpServletRequest req, HttpSession session) {
		
		Cookie[] cookies=req.getCookies();
		if(cookies!=null) {
			for(Cookie c:cookies) {
				if(c.getName().equals("idid")) {
					Member m=new Member();
					m.setId(c.getValue());
					session.setAttribute("mem", ms.getMember(m));
					mv.setViewName("redirect:/");
					return mv;
				}
			}
		}
		
		List<Member> list=ms.getMemberList();
		mv.addObject("list", list);
		mv.setViewName("member/login");
		return mv;
	}
	
	@PostMapping("/login.me")
	public String loginPost(Member m,HttpSession session,String remember,HttpServletResponse res) {
		Member mem=ms.login(m);
		if(mem!=null) {
			session.setAttribute("mem", mem);
			if(remember!=null) {
				Cookie cookie=new Cookie("idid", mem.getId());
				cookie.setMaxAge(60*60*24*7);
				cookie.setPath("/");
				res.addCookie(cookie);
			}
			return "redirect:/";
		}else {
			return "member/login";
		}
	}
	
	@RequestMapping("/logout.me")
	public String logoutPost(HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		session.invalidate();
		Cookie[] cookies=req.getCookies();
		if(cookies!=null) {
			for(Cookie c:cookies) {
				if(c.getName().equals("idid")) {
					c.setMaxAge(0);
					c.setPath("/");
					res.addCookie(c);
					break;
				}
			}
		}
		return "redirect:/";
	}
	
	@PostMapping("/join.me")
	public String joinPost(Member m,HttpSession session) {
		int result=ms.join(m);
		if(result>0) {
			int result1=ms.deleteAuth(m.getEmail());
			return "redirect:/login.me";
		}else {
			return "member/join";
		}
	}
	
	@GetMapping("/auth.me")
	public ModelAndView authGet(Auth auth, ModelAndView mv) {
		Auth getauth=ms.getAuth(auth);
		Member mem=new Member();
		mem.setEmail(getauth.getEmail());
		mem=ms.getMember(mem);
		mv.addObject("auth", mem);
		mv.setViewName("member/join");
		return mv;
	}
	
	@GetMapping("/myInfo.me")
	public ModelAndView myInfo(ModelAndView mv) {
		mv.setViewName("mypage/myInfo");
		return mv;
	}
}
