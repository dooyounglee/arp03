package com.kh.arp.qna.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.member.model.vo.Member;
import com.kh.arp.qna.model.service.QnaService;
import com.kh.arp.qna.model.vo.Qna;

@Controller
public class QnaController {

	@Autowired
	private QnaService qs;
	
	@RequestMapping("/mylist.qna")
	public ModelAndView getMyQnaList(HttpSession session, ModelAndView mv) {
		int m_no=((Member)session.getAttribute("mem")).getM_no();
		List<Qna> list=qs.getMyQnaList(m_no);
		mv.addObject("list", list);
		mv.setViewName("qna/list");
		return mv;
	}
	
	@RequestMapping("/get.qna")
	public ModelAndView getQna(int qna_no, ModelAndView mv) {
		Qna qna=qs.getQna(qna_no);
		mv.addObject("qna", qna);
		mv.setViewName("qna/get");
		return mv;
	}
	
	@GetMapping("/write.qna")
	public ModelAndView writeQnaGet(ModelAndView mv) {
		mv.setViewName("qna/write");
		return mv;
	}
	
	@PostMapping("/write.qna")
	public ModelAndView writeQnaPost(Qna qna, HttpSession session, ModelAndView mv) {
		Member m=(Member)session.getAttribute("mem");
		qna.setM_no(m.getM_no());
		int qna_no=qs.writeQna(qna);
		Qna newqna=qs.getQna(qna_no);
		mv.addObject("qna", newqna);
		mv.setViewName("redirect:/get.qna?qna_no="+qna_no);
		return mv;
	}
	
	@PostMapping("/del.qna")
	public ModelAndView delQnaGet(Qna qna, ModelAndView mv) {
		int result=qs.delQna(qna);
		mv.setViewName("redirect:/mylist.qna");
		return mv;
	}
}
