package com.kh.arp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.board.model.vo.Board;
import com.kh.arp.member.model.service.MemberService;
import com.kh.arp.notice.model.vo.Notice;

@Controller
public class MainController {

	@Autowired
	private MemberService ms;
	
	@RequestMapping("/")
	public ModelAndView main(ModelAndView mv) {
		List<Board> blist=ms.getBoardListForMain();
		List<Notice> nlist=ms.getNoticeListForMain();
		mv.addObject("blist", blist);
		mv.addObject("nlist", nlist);
		mv.setViewName("index");
		return mv;
	}
	
	
}
