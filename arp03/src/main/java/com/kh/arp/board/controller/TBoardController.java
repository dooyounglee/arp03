package com.kh.arp.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.board.model.service.TBoardService;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.board.model.vo.BoardFile;
import com.kh.arp.common.PageInfo;
import com.kh.arp.common.Pagination;
import com.kh.arp.member.model.vo.Member;

@Controller
public class TBoardController {
	
	@Autowired
	private TBoardService tbService;
	
	@RequestMapping("tblist.do")
	public ModelAndView selectTBoardList(ModelAndView mv,
										@RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		
		int listCount = tbService.getListCount();
		PageInfo pi = new PageInfo(currentPage, listCount, 7, 10);
		// System.out.println("pi"+pi);
		ArrayList<Board> list = tbService.selectTBoardList(pi);
		
		for(Board b : list) {
			
			if(b.getContent().contains("img")) {
				b.setImageStatus("Y");
			}else {
				b.setImageStatus("N");
			}
			
		}
		
		
		mv.addObject("list",list).addObject("pi",pi).setViewName("tboard/tboardListView");
		
		return mv;
	}
	
	@RequestMapping("insertTBoardFrom.do")
	public String insertTBoardForm() {
		
		return "tboard/insertTBoard"; 
				
	}
	
	@RequestMapping("insertTBoard.do")
	public String insertTBoard(Board b,HttpServletRequest request,BoardFile bf,
								@RequestParam(value="uploadFile", required=false) MultipartFile file) {

		
		if(!file.getOriginalFilename().equals("")) { // 첨부파일이 있을때
			
			String renameFileName = saveFile(file, request);
			
			bf.setOriginal_filename(file.getOriginalFilename());
			bf.setRename_filename(renameFileName);
			b.setFileStatus("Y");
			int result = tbService.insertTBoard(b);
			int resultFile = tbService.insertTBoardFile(bf);
			System.out.println(bf);
			
		}else {
			b.setFileStatus("N");
			int result = tbService.insertTBoard(b);
			
		}
		
		return "redirect:tblist.do";
	}
	
	// 파일 업로드 하고 업로드한 파일명(수정명) 반환하는 메소드 --> 재사용하기 위해 따로 빼둠
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/tbuploadFiles";
		
		File folder = new File(savePath);
		
	//	System.out.println(savePath);
	//	System.out.println(folder.exists());
		
		if(!folder.exists()) {
			folder.mkdirs(); // savePath까지의 경로가 존재하지 않다면 폴더 생성
		}
		
		String originFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		// 201911051717.PNG
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." 
								+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		// ~~~/resources/buploadFiles/201911051717.PNG
		String renamePath = savePath + "/" + renameFileName;
		
		
		try {
			file.transferTo(new File(renamePath)); // 수정명으로 파일 업로드

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} 
		
		
		return renameFileName;
	}
	
	
	@RequestMapping("tbdetail.do")
	public ModelAndView detailTBoard(int b_no,ModelAndView mv,Member mem) {
		
		Board b = tbService.detailTBoard(b_no);
		BoardFile bf = tbService.detailTBoardFile(b_no);
		
		int count = tbService.selectRcount(b_no);

		if(b != null) {
			mv.addObject("b", b).addObject("bf",bf).setViewName("tboard/detailTBoard");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("tbupdateView.do")
	public ModelAndView updateView(int b_no,ModelAndView mv) {
		

		Board b = tbService.updateTBoardForm(b_no);
		BoardFile bf = tbService.updateTBoardFile(b_no);

		if(b != null) {
			mv.addObject("b", b).addObject("bf",bf).setViewName("tboard/insertTBoard");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
		 
	}
	
	@RequestMapping("tbupdate.do")
	public ModelAndView updateTBoard(Board b,BoardFile bf,ModelAndView mv,HttpServletRequest request,
			 							@RequestParam(value="reloadFile", required=false) MultipartFile file){
		
		int result =0;
	//	System.out.println("넘어오는"+bf.getOriginal_filename());
	
		// 새로운 첨부파일이 넘어왔을 경우
		if(!file.getOriginalFilename().equals("")) {
					
			// 기존에 첨부파일이 있을 경우 
			if(!bf.getOriginal_filename().equals("")) {
				
				// 기존의 첨부파일 삭제
				deleteFile(bf.getRename_filename(), request);
				
							
				// 새로운 첨부파일이 넘어왔을 때
				// 기존에 첨부파일이 있던 없던 간에 서버에 업로드
				String renameFileName = saveFile(file, request);
				
				bf.setRename_filename(renameFileName);
				bf.setOriginal_filename(file.getOriginalFilename());
				
				result = tbService.updateTBoard(b);
				int resultFile = tbService.updateFile(bf);

			
			}else{	// 기존의 파일이 없었다묭용
		
				String renameFileName = saveFile(file, request);
				
				bf.setRename_filename(renameFileName);
				bf.setOriginal_filename(file.getOriginalFilename());
				
				int updateStatus = tbService.updateStatus(b.getB_no());
				result = tbService.updateTBoard(b);
				int resultFile = tbService.updateInsertFile(bf);
	}
	
}
		
			result = tbService.updateTBoard(b);
			
			if(result > 0) {
				mv.addObject("b_no", b.getB_no()).setViewName("redirect:tbdetail.do");
			}else {
				mv.addObject("msg", "게시판 수정 실패").setViewName("common/errorPage");
		}
			
			return mv;
		
		
	
	}
	
	@RequestMapping("tbdelete.do")
	public String deleteTBoard(int b_no,HttpServletRequest request) {
		int result = tbService.deleteTBoard(b_no);
		String rename = tbService.deleteBoardFile(b_no);
		
		if(result > 0) {
	
			new TBoardController().deleteFile(rename,request);
			return "redirect:tblist.do";
		}else {
			return "common/errorPage";
		}
		
		
		
	}
	
	// 업로드 되어있는 파일 삭제용 메소드
	public void deleteFile(String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/tbuploadFiles";
			
			
		File f = new File(savePath + "/" + renameFileName);
			
		if(f.exists()) {
		f.delete();
		}	
		
	}
	
	
	// 썸머노트 이미지 업로드용 메소드
	@RequestMapping("imageUpload.do")
	public void imageUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 업로드할 폴더 경로
		String root = request.getSession().getServletContext().getRealPath("resources");
		String realFolder = root + "/tbuploadImages";
		//String realFolder = request.getSession().getServletContext().getRealPath("buploadFiles");
		
		UUID uuid = UUID.randomUUID();
		
		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + uuid + "."
				+ org_filename.substring(org_filename.lastIndexOf(".") + 1);
		
	//	System.out.println("원본 파일명 : " + org_filename);
	//	System.out.println("저장할 파일명 : " + renameFileName);

		String filepath = realFolder + "\\" + renameFileName;
	//	System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("resources/tbuploadImages/"+renameFileName);
		out.close();
	}

}
