package com.kh.arp.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.notice.model.service.noticeService;
import com.kh.arp.notice.model.vo.Notice;



@Controller
public class noticeController {
	@Autowired
	private noticeService nService;
	
	
@RequestMapping("nlist.ad")
public ModelAndView noticeList(ModelAndView mv) {
	
	int listCount = nService.getListCount();
	
	ArrayList<Notice> list = nService.selectList();
	
	mv.addObject("list" , list).setViewName("notice/noticeListForm");
	return mv;
	
}

@RequestMapping("ninsertForm.ad")
public String insertNoticeForm() {
	
	return "notice/insertNoticeForm";
	
}
	
	
@RequestMapping("ninsert.ad")
public String insertNotice(Notice n , HttpServletRequest request) {
	
	int result = nService.insertNotice(n);
	
	if(result>0) {
		return "redirect:nlist.ad";
	}else {
		return null;
	}
}

@RequestMapping("ndetail.ad")
public int detailNotice(int n_no) {
	Notice n = nService.selectNotice(n_no);
	return n_no;
	
}





}
