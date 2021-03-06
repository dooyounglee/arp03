package com.kh.arp.board.controller;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.arp.board.model.service.BoardService;
import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.common.PageInfo;
import com.kh.arp.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("blist.do")
	public ModelAndView boardList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		// System.out.println(currentPage);
		int listCount = bService.listCount();
		PageInfo pi = new PageInfo(currentPage, listCount, 10, 10);
		ArrayList<Board> list = bService.selectList(pi);
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/boardListView");
		return mv;
	}
	
	@RequestMapping("binsertForm.do")
	public String boardInserView(HttpSession session) {
		Member mem=(Member)session.getAttribute("mem");
		if(mem==null) {
			session.setAttribute("myreferer", "binsertForm.do");
			return "redirect:login.me";
		}
		return "board/boardWriteForm";
	}
	
	@RequestMapping("binsert.do")
	public String insertBoard(Board b, HttpServletRequest request, Model model,
			@RequestParam(value = "uploadFile", required = false) MultipartFile file) {
		//System.out.println(b);
		int result = bService.insertBoard(b);
		if (result > 0) {
			return "redirect:blist.do";
		} else {
			model.addAttribute("msg", "글 작성에 실패했습니다.");
			return "common/error";
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
	
	@RequestMapping("bdetail.do")
	public ModelAndView boardDetail(int b_no, HttpSession session, ModelAndView mv) {
		Member mem=(Member)session.getAttribute("mem");
		if(mem==null) {
			session.setAttribute("myreferer", "bdetail.do?b_no="+b_no);
			mv.setViewName("redirect:login.me");
			return mv;
		}
		
		Board b = bService.selectBoard(b_no);
		bService.updateVcount(b_no);
		//System.out.println(a);
		if (b != null) {
			mv.addObject("b", b);
			mv.setViewName("board/boardDetailView");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="replyList.do", produces="application/json; charset=UTF-8")
	public String replyList(int b_no,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage)  {
		//System.out.println("댓글테스트");
		int listCount = bService.replyListCount(b_no);
		PageInfo pi = new PageInfo(currentPage, listCount, 10, 10);
		ArrayList<BReply> list = bService.selectReplyList(b_no, pi);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		HashMap map = new HashMap();
		map.put("pi", pi);
		map.put("list", list);
		return gson.toJson(map);
	}
	
	@ResponseBody
	@RequestMapping("rinsert.do")
	public String insertReply(BReply r) {
		int result =  bService.insertReply(r);
		//System.out.println(r);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("deleteReply.do")
	public String deleteReply(BReply r) {
		//System.out.println(depth);
		int rst = bService.deleteReply(r);
		if(rst > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("updateReply.do")
	public String updateReply(BReply r) {
		//System.out.println(r);
		int rst = bService.updateReply(r);
		if(rst > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("reinsert.do")
	public String insertReReply(BReply r) {
		//System.out.println(r);
		int rst = bService.insertReReply(r);
		if(rst > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping("bupdateView.do")
	public ModelAndView updateSelectBoard(int b_no, ModelAndView mv) {
		Board b = bService.selectBoard(b_no);
		mv.addObject("b", b);
		mv.setViewName("board/boardWriteForm");
		return mv;
	}
	
	@RequestMapping("bupdate.do")
	public String updateBoard(Board b, HttpServletRequest request, Model model,
			@RequestParam(value = "uploadFile", required = false) MultipartFile file) {
		int rst = bService.updateBoard(b);
		if(rst > 0) {
			return "redirect:blist.do";
		} else {
			model.addAttribute("msg", "글 작성에 실패했습니다.");
			return "common/error";
		}
	}
	
	@RequestMapping("bdelete.do")
	public String deleteBoard(int b_no) {
		int rst = bService.deleteBoard(b_no);
		if(rst > 0) {
			return "redirect:blist.do";
		} else {
			return "common/error";
		}
	}
	
	@RequestMapping("search.do")
	public ModelAndView searchBoard(ModelAndView mv, int condition, String search,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		HashMap map = new HashMap();
		map.put("condition", condition);
		map.put("search", search);
		int listCount = bService.searchListCount(map);
		//System.out.println(listCount);
		PageInfo pi = new PageInfo(currentPage, listCount, 10, 10);
		ArrayList<Board> list = bService.searchList(map, pi);
		//System.out.println(list);
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/boardListView");
		return mv;
	}
	
	
}