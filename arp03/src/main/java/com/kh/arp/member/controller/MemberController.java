package com.kh.arp.member.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.arp.lecture.model.service.LectureService;
import com.kh.arp.member.model.service.MemberService;
import com.kh.arp.member.model.vo.Auth;
import com.kh.arp.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;
	
	@Autowired
	private LectureService ls;
	
	@GetMapping("/login.me")
	public ModelAndView loginGet(ModelAndView mv, HttpServletRequest req, HttpSession session) {
		
		Cookie[] cookies=req.getCookies();
		if(cookies!=null) {
			for(Cookie c:cookies) {
				if(c.getName().equals("idid")) {
					Member m=new Member();
					m.setId(c.getValue());
					Member newm=ms.getMember(m);
					session.setAttribute("mem", newm);
					session.setAttribute("myLec", ms.getLectureList(newm));
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
	public String loginPost(Member m,HttpSession session,String remember,HttpServletResponse res, Model model) {
		
		//status=y일떄만 되도록 해야겠는데?
		
		Member mem=ms.login(m);
		if(mem!=null) {
			if(mem.getStatus().equals("A")) {
				model.addAttribute("msg", "인증 후 이용해 주세요.");
				return "common/error";
			}
			session.setAttribute("mem", mem);
			session.setAttribute("myLec", ms.getLectureList(mem));
			if(remember!=null) {
				Cookie cookie=new Cookie("idid", mem.getId());
				cookie.setMaxAge(60*60*24*7);
				cookie.setPath("/");
				res.addCookie(cookie);
			}
			String referer=(String)session.getAttribute("referer");
			String myreferer=(String)session.getAttribute("myreferer");
			if(myreferer==null){
				return "redirect:"+referer;
			}else {
				session.removeAttribute("myreferer");
				return "redirect:"+myreferer;
			}
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
		System.out.println(mem);
		mv.addObject("auth", mem);
		mv.setViewName("member/join");
		return mv;
	}
	
	@GetMapping("/myInfo.me")
	public ModelAndView myInfo(ModelAndView mv) {
		mv.setViewName("mypage/myInfo");
		return mv;
	}
	
	@PostMapping("/update.me")
	public ModelAndView updatePost(Member m, HttpSession session, ModelAndView mv) {
		int result=ms.update(m);
		if(result>0) {
			Member newm=ms.getMember(m);
			session.setAttribute("mem", newm);
		}
		mv.setViewName("redirect:myInfo.me");
		return mv;
	}
	
	@PostMapping("/changePw.me")
	public ModelAndView updatePost(Member m, String newPw, HttpSession session, ModelAndView mv) {
		Member newm=(Member)session.getAttribute("mem");
		if(newm.getPw().contentEquals(m.getPw())) {
			newm.setPw(newPw);
			int result=ms.update(newm);
			if(result>0) {
				session.setAttribute("mem", newm);
			}
		}
		mv.setViewName("redirect:myInfo.me");
		return mv;
	}
	
	@PostMapping("/leave.me")
	public ModelAndView leavePost(HttpSession session, ModelAndView mv) {
		Member m=(Member)session.getAttribute("mem");
		int result=ms.banish(m);
		if(result>0) {
			mv.setViewName("redirect:/logout.me");
		}
		return mv;
	}
	
	@GetMapping("/find.me")
	public ModelAndView findGet(ModelAndView mv) {
		mv.setViewName("member/find");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/findId.me")
	public String findIdPost(Member m) {
		System.out.println(m);
		
		Member newm=ms.find(m);
		if(newm!=null) {
			return newm.getId();
		}
		return "fail";
	}
	
	@PostMapping("/findPw.me")
	public ModelAndView findPwPost(Member m, ModelAndView mv) {
		System.out.println(m);
		Member newm=ms.find(m);
		System.out.println(newm);
		if(newm!=null) {
			//임시비번 컬럼을 만들어서, 임시비번
			//안전하게 임시비번도 확인해도 좋고..
			
			//url랜덤코드 테이블이 있어야 해 Auth처럼
			//이메일 전송-url누르게 할까?-비번변경페이지-새비번으로 수정
		}else {
			//등록된 이메일이 없습니다.
		}
		mv.setViewName("redirect:/find.me");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/existEmail.me")
	public String existEmailPost(Member m) {
		Member newm=ms.find(m);
		if(newm!=null) {
			return "exist";
		}else {
			return "not";
		}
	}
	
	@ResponseBody
	@PostMapping("/existPhone.me")
	public String existPhonePost(Member m) {
		Member newm=ms.find(m);
		if(newm!=null) {
			return "exist";
		}else {
			return "not";
		}
	}
	
	@ResponseBody
	@PostMapping(value="myLecLastest.me", produces="application/json; charset=UTF-8")
	public String myLecLastestPost(HttpSession session) {
		System.out.println("잭스가?");
		Member mem=(Member)session.getAttribute("mem");
		session.setAttribute("myLec", ms.getLectureList(mem));
		Gson gson=new GsonBuilder().create();
		return gson.toJson(ms.getLectureList(mem));
	}
}
