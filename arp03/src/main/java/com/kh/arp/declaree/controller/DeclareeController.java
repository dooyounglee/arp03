package com.kh.arp.declaree.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.board.model.service.BoardService;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.declaree.model.service.DeclareeService;
import com.kh.arp.declaree.model.vo.Declaree;
import com.kh.arp.member.model.vo.Member;

@Controller
public class DeclareeController {

	@Autowired
	private DeclareeService ds;

	@PostMapping("insertForm.de")
	public ModelAndView declareGet(ModelAndView mv, String obj, int obj_no) {
		// System.out.println(obj_no);
		mv.addObject("obj", obj).addObject("obj_no", obj_no).setViewName("declare/declare");
		return mv;
	}

	
	 @PostMapping("insert.de") 
	 public ModelAndView declarePost(Declaree d,HttpSession session, ModelAndView mv) { 
		 Member m=(Member)session.getAttribute("mem"); 
		 d.setM_no(m.getM_no());
		 System.out.println(d); 
		 int result=ds.declare(d);
		 mv.setViewName("declare/declare"); 
		 return mv; 
	 }
	 
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("insert.de") public String declarePost(Declaree d, HttpSession
	 * session) { Member m=(Member)session.getAttribute("mem");
	 * d.setM_no(m.getM_no()); //System.out.println(d); int result=ds.declare(d);
	 * if(result > 0) { return "success"; } else { return "fail"; }
	 * 
	 * }
	 */

}
