package com.kh.arp.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.board.model.service.TBoardService;
import com.kh.arp.board.model.vo.Board;

@Controller
public class TBoardController {
	
	@Autowired
	private TBoardService tbService;
	
	@RequestMapping("tblist.do")
	public ModelAndView selectTBoardList(ModelAndView mv) {
		
		ArrayList<Board> list = tbService.selectTBoardList();
		
		mv.addObject("list",list).setViewName("tboard/tboardListView");
		
		return mv;
	}
	
	@RequestMapping("insertTBoardFrom.do")
	public String insertTBoardForm() {
		
		return "tboard/insertTBoard"; 
				
	}
}
