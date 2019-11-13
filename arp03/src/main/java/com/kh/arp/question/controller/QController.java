package com.kh.arp.question.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.common.PageInfo;
import com.kh.arp.common.Pagination;
import com.kh.arp.question.model.service.QService;
import com.kh.arp.question.model.vo.Question;

@Controller
public class QController {
	
	@Autowired
	private QService qService;
	
	@RequestMapping("question.qu")
	public ModelAndView questionList(ModelAndView mv, 
									@RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = qService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Question> qList = qService.selectQuestionList(pi);
		
		
		// 데이터값, 뷰 지정
		mv.addObject("pi", pi).addObject("qList", qList).setViewName("question/question");
		
		return mv;
	}

	
	
}
