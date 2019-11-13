package com.kh.arp.board.controller;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.board.model.service.BoardService;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.common.PageInfo;
import com.kh.arp.common.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("blist.do")
	public ModelAndView boardList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		// System.out.println(currentPage);
		int listCount = bService.listCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Board> list = bService.selectList(pi);
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/boardListView");
		return mv;
	}
	
	@RequestMapping("binsertForm.do")
	public String boardInserView() {
		return "board/boardWriteForm";
	}
	
	@RequestMapping("binsert.do")
	public String insertBoard(Board b, HttpServletRequest request, Model model,
			@RequestParam(value = "uploadFile", required = false) MultipartFile file) {
		int result = bService.insertBoard(b);
		if (result > 0) {
			return "redirect:blist.do";
		} else {
			model.addAttribute("msg", "글 작성에 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("image.do")
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String root = request.getSession().getServletContext().getRealPath("resources");
		String realFolder = root + "/buploadImages";
		//String realFolder = request.getSession().getServletContext().getRealPath("buploadFiles");
		
		UUID uuid = UUID.randomUUID();
		
		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + uuid + "."
				+ org_filename.substring(org_filename.lastIndexOf(".") + 1);
		
		//System.out.println("원본 파일명 : " + org_filename);
		//System.out.println("저장할 파일명 : " + renameFileName);

		String filepath = realFolder + "\\" + renameFileName;
		//System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("resources/buploadImages/"+renameFileName);
		out.close();
	}

}