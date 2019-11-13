package com.kh.arp.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.board.model.service.TBoardService;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.board.model.vo.BoardFile;

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
	public ModelAndView detailTBoard(int b_no,ModelAndView mv) {
		
		Board b = tbService.detailTBoard(b_no);
		BoardFile bf = tbService.detailTBoardFile(b_no);
		
	//	System.out.println("디테일에서"+bf);
		

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
			//	System.out.println("기존에 파일이있었음");
			
			}else{	// 기존의 파일이 없었다묭용
				
			//	System.out.println("기존에 파일이ㄴㄴ");
				String renameFileName = saveFile(file, request);
				
				bf.setRename_filename(renameFileName);
				bf.setOriginal_filename(file.getOriginalFilename());
				
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
	public String deleteTBoard(int b_no) {
		int result = tbService.deleteTBoard(b_no);
		
		if(result > 0) {
			return "redirect:tblist.do";
		}else {
			return "common/errorPage";
		}
		
		
		
	}
	
	// 업로드 되어있는 파일 삭제용 메소드
	public void deleteFile(String renameFileName, HttpServletRequest request) {
	String root = request.getSession().getServletContext().getRealPath("resources");
	String savePath = root + "/buploadFiles";
		
		
	File f = new File(savePath + "/" + renameFileName);
		
	if(f.exists()) {
	f.delete();
}
	
}

}
