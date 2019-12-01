package com.kh.arp.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.common.PageInfo;
import com.kh.arp.notice.model.service.noticeService;
import com.kh.arp.notice.model.vo.Notice;



@Controller
public class noticeController {
	@Autowired
	private noticeService nService;
	
	
@RequestMapping("nlist.ad")
public ModelAndView noticeList(ModelAndView mv,
				@RequestParam(value="currentPage", defaultValue="1") int currentPage) {
	
	int listCount = nService.getListCount();
	PageInfo pi = new PageInfo(currentPage, listCount, 7, 10);
	
	ArrayList<Notice> list = nService.selectList(pi);
	
	mv.addObject("list" , list).addObject("pi" , pi).setViewName("notice/noticeListForm");
	return mv;
	
}



	
	
@RequestMapping("ninsert.ad")
public String insertNotice(Notice n , HttpServletRequest request , Model m) {
	
	int result = nService.insertNotice(n);
	
	
	if(result>0) {
		return "redirect:nlist.ad";

	}else {
		return null;
	}
}

@RequestMapping("ninsertForm.ad")
public String insertForm() {
	return "notice/insertNoticeForm";
}


@RequestMapping("nupdateForm.ad")
public ModelAndView updateForm(int n_no , ModelAndView mv) {
	
	Notice n = nService.updateNoticeForm(n_no);
	
	mv.addObject("n" , n).setViewName("notice/updateNoticeForm");
	
	return mv;
	
}


@RequestMapping("nupdate.ad")
public ModelAndView updateNotice(Notice n , ModelAndView mv) {
	
	int result = nService.updateNotice(n);
	
	
	if(result > 0) {
		
		mv.addObject("n" , n).setViewName("redirect:nlist.ad");
		
	}else {
		mv.addObject("msg" , "수정실패").setViewName("common/errorPage");
	}
	
	return mv;
}

@RequestMapping("ndetail.ad")
public ModelAndView detailNotice(int n_no ,ModelAndView mv) {
	
	Notice n = nService.selectNotice(n_no);
	
	if(n != null) {
	
		mv.addObject("n" ,n).setViewName("notice/detailNotice");
		
	}else {
		mv.addObject("msg" ,"게시글 조회 실패").setViewName("common/errorPage");
	}
	
	return mv;
	
	
}

@RequestMapping("ndelete.ad")
public String deleteNotice(int n_no ,ModelAndView mv) {
	
	int result = nService.deleteNotice(n_no);
	
	if(result>0) {
		return "redirect:nlist.ad";
	}else {
		return null;
	}
	
}

	@PostMapping("/upload")
	public void upload(MultipartHttpServletRequest req,HttpServletResponse res) {
		System.out.println("들어왔고");
		MultipartFile file=req.getFile("uploadFile");
		String savePath=req.getSession().getServletContext().getRealPath("resources");
		String filePath=savePath+"\\upload\\"+file.getOriginalFilename();
		try {
			file.transferTo(new File(filePath));
			res.getWriter().println(file.getOriginalFilename());
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


}
