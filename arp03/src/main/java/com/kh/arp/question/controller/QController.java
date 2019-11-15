package com.kh.arp.question.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.common.PageInfo;
import com.kh.arp.member.model.vo.Lecture;
import com.kh.arp.question.model.service.QService;
import com.kh.arp.question.model.vo.QFile;
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
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
		// PageInfo pi = new PageInfo(currentPage, listCount, 5, 10); 이렇게 바로써도됨
		
		ArrayList<Question> qList = qService.selectQuestionList(pi, lec_no);
		
		// lecture 객체 가져오자~
		Lecture lec = qService.getLecture(lec_no);
		
		// 데이터값, 뷰 지정
		mv.addObject("pi", pi).addObject("qList", qList).addObject("lec", lec).setViewName("question/question");
		
		return mv;
	}

	
	@RequestMapping("qWriteForm.qu")
	public String questionInsertView(int lec_no, Model model) {
		// 게시글번호도 같이 넘겨야됨! 이따가 작성
		
		// lec_no 가져온걸 넘겨주기
		model.addAttribute("lec_no", lec_no);
		
		return "question/questionInsertForm";
	}
	
	
	
	//String title, String content
	@RequestMapping("qinsert.qu")
	public String qInsert(Question q, HttpServletRequest request, Model model, 
			@RequestParam(value="fileUp", required=false) MultipartFile file) {

		//System.out.println(q);
		//System.out.println(file.getOriginalFilename());
		//System.out.println(file);
		QFile qf = new QFile();
		
		if(!file.getOriginalFilename().equals("")) {
			String reName = saveFile(file, request);
			
			qf.setOriginalName(file.getOriginalFilename());
			qf.setReName(reName);
		}
		
		int result = qService.qInsert(q);
		
		if(result > 0) {
			//model.addAttribute("qf", qf);
			
			// 성공하면 리스트를 조회해오자
			ArrayList<Question> qList2 = qService.selectQuestionList2(q);
			
			int lec_no = q.getLec_no();
			
			return "redirect:question.qu?lec_no="+lec_no;
		}else {
			model.addAttribute("msg", "게시판 글 작성하기 실패");
			return "qcommon/errorPage";
		}
	}
	
	
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "/qFileUpload";
		
		File folder = new File(savePath);
	
		if(folder.exists()) {
			folder.mkdirs();
		}
		
		String originalName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String reName = sdf.format(new Date(System.currentTimeMillis())) + "."
						+ originalName.substring(originalName.lastIndexOf(".")+1);
	
		String reNamePath = savePath + "/" + reName;
		
		try {
			file.transferTo(new File(reNamePath));
			
		} catch (IllegalStateException | IOException e) {
			
			e.printStackTrace();
		}
		
		return reName;
		
	}
	
	
	@RequestMapping("qdetail.qu")
	public ModelAndView qdetail(ModelAndView mv, int q_no) {
		
		Question q = qService.selectDetailQuestion(q_no);
		
		if(q != null) {
			mv.addObject("q", q).setViewName("question/qdetailForm");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("qcommon/errorPage");
		}
		
		return mv;
	}
	
	
	@RequestMapping("qupdateForm.qu")
	public ModelAndView qUpdateForm(int q_no, ModelAndView mv) {
		Question q = qService.selectUpdateForm(q_no);
		
		mv.addObject("q", q).setViewName("question/qupdateForm");
		
		return mv;
	}
	
	/*
	 * @RequestMapping("qupdate.qu") public ModelAndView qUpdate(int q_no,
	 * ModelAndView mv) {
	 * 
	 * int result = qService.qUpdate(q_no);
	 * 
	 * if(result > 0) { mv.addObject("q").setViewName("question/qupdateForm"); }else
	 * { mv.addObject("msg", "게시판 수정 실패").setViewName("qcommon/errorPage"); }
	 * 
	 * return mv; }
	 */
	
	
	/*
	 * @RequestMapping("")
	 */
	
	/*
	 * @RequestMapping("fileaj.qu") public ModelAndView
	 * fileaj(@requestParam(value="")) {
	 * 
	 * }
	 */
	
	
}

