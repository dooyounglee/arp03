package com.kh.arp.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("insertTBoard.do")
	public String insertTBoard(Board b,HttpServletRequest request) {

		b.setM_no(Integer.parseInt(request.getParameter("writer")));
	
		
		System.out.println(b);
		int result = tbService.insertTBoard(b);
		return "redirect:tblist.do";
	}
	

	
	
	@RequestMapping("tbdetail.do")
	public ModelAndView detailTBoard(int b_no,ModelAndView mv) {
		
		Board b = tbService.detailTBoard(b_no);
		

		if(b != null) {
			mv.addObject("b", b).setViewName("tboard/detailTBoard");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("tbupdateView.do")
	public ModelAndView updateView(int b_no,ModelAndView mv) {
		

		Board b = tbService.updateTBoardForm(b_no);
		

		if(b != null) {
			mv.addObject("b", b).setViewName("tboard/insertTBoard");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
		 
	}
	
	@RequestMapping("tbupdate.do")
	public ModelAndView updateTBoard(Board b,ModelAndView mv){
		
		int result = tbService.updateTBoard(b);
		
		if(result > 0) {
			mv.addObject("b_no", b.getB_no()).setViewName("redirect:tbdetail.do");
		}else {
			mv.addObject("msg", "게시판 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
		
		
	
	}
	
	@RequestMapping("tbdelete.do")
	public String deleteTBoard(int b_no) {
		int result = tbService.deleteTBoard(b_no);
		
		if(result > 0) {
			return "redirect:tblist.do";
		}else {
			return "common/errorPage";
		}
		
		
		
	}

}
