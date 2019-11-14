package com.kh.arp.question.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.common.PageInfo;
import com.kh.arp.common.Pagination;
import com.kh.arp.member.model.vo.Lecture;
import com.kh.arp.question.model.service.QService;
import com.kh.arp.question.model.vo.Question;

@Controller
public class QController {
	
	@Autowired
	private QService qService;
	
	
	/*
	 * @RequestMapping("questionAllList.qu") public ModelAndView
	 * questionAllList(ModelAndView mv) {
	 * 
	 * List<Lecture> lecList = qService.getClassList();
	 * 
	 * mv.addObject("lecList",lecList);
	 * mv.setViewName("question/questionAllListPage");
	 * 
	 * return mv;
	 * 
	 * }
	 */
	
	
	@RequestMapping("question.qu")
	public ModelAndView questionList(ModelAndView mv,
									@RequestParam(value="currentPage", defaultValue="1") int currentPage, int lec_no) {
		
		
		int listCount = qService.getListCount(lec_no);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Question> qList = qService.selectQuestionList(pi, lec_no);
		
		// lecture 객체 가져오자~
		Lecture lec = qService.getLecture(lec_no);
		
		System.out.println(qList);
		// 데이터값, 뷰 지정
		mv.addObject("pi", pi).addObject("qList", qList).addObject("lec", lec).setViewName("question/question");
		
		return mv;
	}

	
	@RequestMapping("qWriteForm.qu")
	public String questionInsertView() {
		return "question/questionInsertForm";
	}
	
	
	
}

