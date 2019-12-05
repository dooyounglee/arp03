package com.kh.arp.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
	
	@Autowired
	private JavaMailSenderImpl javaMailSenderImple;
	
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
		
		if(mem.getId()==null) {//회원가입이면
			System.out.println("회원가입이니?");
			mv.addObject("auth", mem);
			mv.setViewName("member/join");
			return mv;
		}else {//비번찾기
			System.out.println("비번찾기니?");
			mv.addObject("m", mem);
			mv.setViewName("member/findPw");
			return mv;
		}
	}
	
	@GetMapping("/myInfo.me")
	public ModelAndView myInfo(ModelAndView mv) {
		mv.setViewName("mypage/myInfo");
		return mv;
	}
	
	@PostMapping("/update.me")
	public ModelAndView updatePost(Member m, HttpSession session, ModelAndView mv) {
		Member newm=ms.getMember(m);
		newm.setName(m.getName());
		newm.setEmail(m.getEmail());
		newm.setPhone(m.getPhone());
		int result=ms.update(m);
		if(result>0) {
			Member newmem=ms.getMember(m);
			session.setAttribute("mem", newmem);
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
	
	@PostMapping("/findChangePw.me")
	public ModelAndView findPwPost(Member m, ModelAndView mv) {
		Member newm=ms.getMember(m);
		newm.setPw(m.getPw());
		
		int result=ms.update(newm);
		int result1=ms.deleteAuth(newm.getEmail());
		mv.setViewName("redirect:login.me");
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
	public ModelAndView findPwPost(Member m, HttpServletRequest req, HttpServletResponse res, ModelAndView mv) {
		System.out.println(m);
		Member newm=ms.find(m);
		System.out.println(newm);
		if(newm!=null) {
			//임시비번 컬럼을 만들어서, 임시비번
			//안전하게 임시비번도 확인해도 좋고..
			Auth auth=new Auth();
			auth.setEmail(m.getEmail());
			
			Auth newauth=ms.getAuth(auth);
			if(newauth==null) {//없으면 insert. 
				auth.setCode(randomCode(50));
				int result1=ms.insertAuth(auth);
			}else {//있으면 그거.
				auth=newauth;
			}
			
			//url랜덤코드 테이블이 있어야 해 Auth처럼
			//이메일 전송-url누르게 할까?-비번변경페이지-새비번으로 수정
			MimeMessage message = javaMailSenderImple.createMimeMessage();
			try {
				message.setFrom(new InternetAddress("gostbaducking2@gmail.com","KH수학교육원","utf-8"));
				message.addRecipient(RecipientType.TO, new InternetAddress(auth.getEmail()));
				message.setSubject("[KH수학교육원]비번분실 인증메일 입니다.");
				message.setText("<a href=\"http://"+req.getServerName()+":"+req.getServerPort()+"/arp/auth.me?code="+auth.getCode()+"\">여기를 누르면 비번 수정 페이지로 이동합니다.</a>","utf-8", "html");
				javaMailSenderImple.send(message);
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
		}else {
			//등록된 이메일이 없습니다.
			mv.addObject("msg", "등록된 이메일이 없습니다.");
			mv.setViewName("common/error");
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
	@PostMapping(value="myLecLastest.mem", produces="application/json; charset=UTF-8")
	public String myLecLastestPost(HttpSession session) {
		Member mem=(Member)session.getAttribute("mem");
		session.setAttribute("myLec", ms.getLectureList(mem));
		Gson gson=new GsonBuilder().create();
		return gson.toJson((ArrayList)ms.getLectureList(mem));
	}
	
	
	
	
	
	
	
	
	//랜덤코드 생성
	public String randomCode(int len) {
		String code="";
		int num = 0;
		while (true) {
			num = (int)Math.floor(Math.random()*75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				code+=(char)num;
			}
			if(code.length()>len)break;
		}
		return code;
	}
}
