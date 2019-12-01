package com.kh.arp.question.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.google.gson.JsonIOException;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.common.PageInfo;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.question.model.service.QService;
import com.kh.arp.question.model.vo.QFile;
import com.kh.arp.question.model.vo.QReply;
import com.kh.arp.question.model.vo.Question;

@Controller
public class QController {

	@Autowired
	private QService qService;

	@RequestMapping("question.qu")
	public ModelAndView questionList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, HttpSession session) {
		// 세션에 담아둔 Lecture에 lec_no가지고오자
		int lec_no = ((Lecture)session.getAttribute("lec")).getLec_no();
		
		int listCount = qService.getListCount(lec_no);

		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit);
		// PageInfo pi = new PageInfo(currentPage, listCount, 5, 10); 이렇게 바로써도됨
		
		
		ArrayList<Question> qList = qService.selectQuestionList(pi, lec_no);
		// lecture 객체 가져오자~
		Lecture lec = qService.getLecture(lec_no);
		
		// 데이터값, 뷰 지정
		mv.addObject("pi", pi).addObject("qList", qList).setViewName("question/question");

		return mv;
	}

	@RequestMapping("qWriteForm.qu")
	public String questionInsertView(Model model) {
		
		return "question/questionInsertForm";
	}

	// String title, String content
	@RequestMapping("qinsert.qu")
	public String qInsert(Question q, HttpServletRequest request, HttpSession session,
			@RequestParam(value = "fileUp", required = false) MultipartFile file) {
		
		// System.out.println(q);
		// System.out.println(file.getOriginalFilename());
		// System.out.println(file);
		int lec_no = ((Lecture)session.getAttribute("lec")).getLec_no();
		q.setLec_no(lec_no);
		QFile qf = new QFile();
		//System.out.println(q);
		int resultqf = 0;

		if (!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);

			qf.setOriginalName(file.getOriginalFilename());
			qf.setChangeName(changeName);
			q.setFileox("Y");
			// System.out.println(q.getFileox());
			int result = qService.qInsert(q);
			resultqf = qService.qFileInsert(qf);
		} else {
			q.setFileox("N");
			int result = qService.qInsert(q);
		}
		
		//request.setAttribute("q", q);
		return "redirect:question.qu";
		//return "question/qdetailForm";
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "/qFileUpload";

		File folder = new File(savePath);

		if (folder.exists()) {
			folder.mkdirs();
		}

		String originalName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String changeName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originalName.substring(originalName.lastIndexOf(".") + 1);

		String changeNamePath = savePath + "/" + changeName;

		try {
			file.transferTo(new File(changeNamePath));

		} catch (IllegalStateException | IOException e) {

			e.printStackTrace();
		}

		return changeName;

	}

	@RequestMapping("qdetail.qu")
	public ModelAndView qdetail(ModelAndView mv, int q_no, HttpSession session) {
		
		Question q = qService.selectDetailQuestion(q_no);
		// System.out.println(q);
		
		// QReply 조회해오기
		ArrayList<QReply> qRList = qService.selectQReply(q_no);
		
		// QReply 총 댓글수 조회해보자
		int qReplyListCount = qService.qReplyListCount(q_no);
		
		// 선생님 이름 조회해오기
		int lec_no = ((Lecture)session.getAttribute("lec")).getLec_no();
		Question qt = qService.selectTeacherName(lec_no);
		// 조회해온 name을 question객체에다가 담아놓자
		
		if (q != null) {
			mv.addObject("q", q).addObject("qRList", qRList).addObject("qt", qt).addObject("qRListCount", qReplyListCount).setViewName("question/qdetailForm");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/error");
		}

		return mv;
	}

	@RequestMapping("qupdateForm.qu")
	public ModelAndView qUpdateForm(int q_no, ModelAndView mv) {
		Question q = qService.selectDetailQuestion(q_no);

		mv.addObject("q", q).setViewName("question/qUpdateForm");

		return mv;

	}

	@RequestMapping("qupdate.qu")
	public ModelAndView qUpdate(Question q, QFile qf, ModelAndView mv, HttpServletRequest request, HttpSession session,
			@RequestParam(value = "fileReload", required = false) MultipartFile file) {
		int result = 0;
		int lec_no = ((Lecture)session.getAttribute("lec")).getLec_no();
		
		//System.out.println("한번보자" + q.getOriginalname());
		//System.out.println("한번보자2" + file.getOriginalFilename());
		// 새 첨부파일 넘어올때
		if (!file.getOriginalFilename().equals("")) {
			//System.out.println("새 첨부파일 : " + file);
			//System.out.println("qf에 기존 첨부파일 : " + qf.getOriginalName());
			//System.out.println("q에 기존 첨부파일 : " + q.getOriginalname());
			int fileo1 = qService.fileoxChange(q.getQ_no());
			// 첨부파일이 이미 있을경우
			if (!q.getOriginalname().equals("")) {
				
				// 기존파일 삭제
				deleteFile(qf.getChangeName(), request);
				
				String changename = saveFile(file, request);
				qf.setChangeName(changename);
				qf.setOriginalName(file.getOriginalFilename());
				qf.setQ_no(qf.getQ_no());
				
				// 내용 업데이트
				result = qService.qUpdate(q);
				// 파일 업데이트
				int result2 = qService.qUpdateFile(qf);
				// fileox컬럼값을 Y로 바꾸는 업데이트
				int fileo = qService.fileoxChange(q.getQ_no());
				//int filex = qService.DeleteAfterFileox(qf.getQ_no());
				
			}else {
				String changename = saveFile(file, request);
				qf.setChangeName(changename);
				qf.setOriginalName(file.getOriginalFilename());
				qf.setQ_no(q.getQ_no());
				
				// 내용 업데이트
				result = qService.qUpdate(q);
				// 파일 업데이트
				int result2 = qService.qNewInsertFile(qf);
				// fileox컬럼값을 Y로 바꾸는 업데이트
				int fileo = qService.fileoxChange(q.getQ_no());
				//int filex = qService.DeleteAfterFileox(qf.getQ_no());
			}

		}else {
			result = qService.qUpdate(q);
			int filex = qService.DeleteAfterFileox(qf.getQ_no());
		}
		
		if(!q.getOriginalname().equals("")) {
			int fileo = qService.fileoxChange(q.getQ_no());
		}
		
		if(result > 0) {
			mv.addObject("q_no", q.getQ_no()).setViewName("redirect:qdetail.qu");
		}else {
			mv.addObject("msg", "게시판 수정 실패").setViewName("common/error");
		}
		
		return mv;

	}

	@RequestMapping("qdelete.qu")
	public String qDelete(int q_no, HttpServletRequest request) {

		Question q = qService.qSelectDelete(q_no);

		if (q.getOriginalname() != null) {
			deleteFile(q.getChangename(), request);
		}

		int result = qService.qDelete(q_no);

		if (result > 0) {
			return "redirect:question.qu";
		} else {
			return "common/error";
		}
	}

	public void deleteFile(String changename, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/qFileUpload";

		File f = new File(savePath + "/" + changename);

		if (f.exists()) { // 존재할경우
			f.delete(); // 삭제
		}
	}
	
	
	@ResponseBody
	@RequestMapping("fileDelete.aj")
	public String fileDelete(QFile qf, String changename, HttpServletRequest request) {
		//System.out.println(changename);
		
		deleteFile(changename, request); // 재사용~
		
		//System.out.println("값:" + changename);
		
		int result = qService.fileDelete(changename);
		
		if(result > 0) {
			int result2 = qService.DeleteAfterFileox(qf.getQ_no());
		}
		
		return "success";
	}
	

	 @RequestMapping("qImgUpload.aj")
	 public void qImgUpload(MultipartFile file, HttpServletRequest request, 
			 HttpServletResponse response) throws IOException {
		 
		 response.setContentType("text/html;charset=utf-8");
		 PrintWriter out = response.getWriter();
		 
		 String root = request.getSession().getServletContext().getRealPath("resources");
		 String savePath = root + "/qImageUpload";
		 
		 UUID uuid = UUID.randomUUID();
		 
		 String originalName = file.getOriginalFilename();

		 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		 String changeName = sdf.format(new Date(System.currentTimeMillis())) + "."
					+ originalName.substring(originalName.lastIndexOf(".") + 1);

		String changeNamePath = savePath + "\\" + changeName;
		 
		//System.out.println("첸지패뜨:"+changeNamePath);
		//System.out.println("아웃프린트엘엔:"+savePath + "/" + changeName);
		File f = new File(changeNamePath);
		if(!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("resources/qImageUpload/"+changeName);
		out.close();
	 }
	 
	 @RequestMapping("qTCInsertReply")
	 public ModelAndView qTCInsertReplyUpdate(ModelAndView mv, Question q, HttpSession session) {
		 String name = ((Member)session.getAttribute("mem")).getName();
		 int q_no = q.getQ_no();
		// String name = q.getName();
		 //int lec_no = q.getLec_no();
		 
		 q.setQ_no(q.getQ_no()); 
		 q.setReplycontent(q.getReplycontent());
		 q.setName(name);
		 //System.out.println(q);
		 
		 int result = qService.qTCInsertReply(q);
		 
		 if(result > 0) {
			 Question q1 = qService.selectDetailQuestion(q_no);
			 System.out.println(q1);
			 mv.addObject("q1", q1).setViewName("redirect:qdetail.qu?q_no="+ q_no);
		 }else {
			 mv.addObject("msg", "게시판 수정 실패").setViewName("common/error");
		 }
		 
		 return mv;
		 
	 }
	 
	 
	/*
	 * @RequestMapping("qReplyInsert.re") public ModelAndView qReplyInsert(QReply q,
	 * int q_no, ModelAndView mv, HttpSession session) { int lec_no =
	 * ((Lecture)session.getAttribute("lec")).getLec_no(); int m_no =
	 * ((Member)session.getAttribute("mem")).getM_no();
	 * 
	 * q.setLec_no(lec_no); q.setM_no(m_no); //System.out.println(q);
	 * 
	 * int result = qService.qReplyInsert(q);
	 * 
	 * 
	 * if(result > 0) { mv.setViewName("redirect:qdetail.qu?q_no="+q_no); }else {
	 * mv.addObject("msg", "댓글 작성 실패").setViewName("qcommon/errorPage"); }
	 * 
	 * return mv;
	 * 
	 * }
	 */
	 
	 
	 @ResponseBody
	 @RequestMapping("qReplyInsert.re")
	 public String qReplyInsert(QReply q, int q_no, HttpSession session) {
		 int lec_no = ((Lecture)session.getAttribute("lec")).getLec_no();
		 int m_no = ((Member)session.getAttribute("mem")).getM_no();
		 
		 q.setLec_no(lec_no);
		 q.setM_no(m_no);
		 //System.out.println(q);
		 
		 int result = qService.qReplyInsert(q);
		 
		 
		 if(result > 0) { 
			return "success";
		 }else { 
			return "fail";
		 }
		  
	 }
	 
	 
	 @ResponseBody
	 @RequestMapping("deleteDatReply.re")
	 public String deleteDatReply(QReply qr) {
		 
		 int result = qService.deleteDatReply(qr);
		 
		 //System.out.println(qr);
		// System.out.println(result);
		 if(result > 0) {
			 return "success";
		 }else {
			 return "fail";
		 }
	 }
	 
	 @RequestMapping("realTimeSelect.al")
	 public void realTimeSelect(HttpServletResponse response, HttpSession session) throws IOException {
		 int lec_no = ((Lecture)session.getAttribute("lec")).getLec_no();
		 ArrayList<Question> realList = qService.realTimeSelect(lec_no);
		 response.setContentType("application/json; charset=UTF-8");
		 
		 
		/* mv.addObject("realList", realList).setViewName("question/question"); */
		Gson gson = new Gson();
		gson.toJson(realList, response.getWriter());
	 }
	 
	 @RequestMapping("realTimeFreeSelect.al")
	 public void realTimeFreeSelect(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {
		 ArrayList<Board> realList = qService.realTimeFreeSelect();
		 
		 response.setContentType("application/json; charset=UTF-8");
		 
		 Gson gson = new Gson();
		 gson.toJson(realList, response.getWriter());
		 
	 }
	 

}
