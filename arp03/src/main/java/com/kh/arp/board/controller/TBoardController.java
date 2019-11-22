package com.kh.arp.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.arp.board.model.service.TBoardService;
import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.board.model.vo.BoardFile;
import com.kh.arp.common.PageInfo;
import com.kh.arp.member.model.vo.Member;

@Controller
public class TBoardController {

	@Autowired
	private TBoardService tbService;


	@RequestMapping("tblist.do")
	public ModelAndView selectTBoardList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

		int listCount = tbService.getListCount();
		PageInfo pi = new PageInfo(currentPage, listCount, 7, 10);
		// System.out.println("pi"+pi);
		ArrayList<Board> list = tbService.selectTBoardList(pi);

		for (Board b : list) {

			if (b.getContent().contains("img")) {
				b.setImageStatus("Y");
			} else {
				b.setImageStatus("N");
			}

		}

		mv.addObject("list", list).addObject("pi", pi).setViewName("tboard/tboardListView");

		return mv;
	}

	@RequestMapping("insertTBoardFrom.do")
	public String insertTBoardForm() {

		return "tboard/insertTBoard";

	}


	@RequestMapping("tbdetail.do")
	public ModelAndView detailTBoard(int b_no, ModelAndView mv, Member mem) {

		Board b = tbService.detailTBoard(b_no);
		ArrayList<BoardFile> bfList = tbService.detailTBoardFile(b_no);

		int count = tbService.selectRcount(b_no);

		if (b != null) {
			mv.addObject("b", b).addObject("bfList", bfList).setViewName("tboard/detailTBoard");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}

		return mv;

	}

	//
	@RequestMapping("tbupdateView.do")
	public ModelAndView updateView(int b_no, ModelAndView mv) {

		Board b = tbService.updateTBoardForm(b_no);
		ArrayList<BoardFile> bfList = tbService.updateTBoardFile(b_no);
		System.out.println("list"+bfList);

		if (b != null) {
			mv.addObject("b", b).addObject("bfList", bfList).setViewName("tboard/updateTBoard");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}

		return mv;

	}

	// 게시글 수정
	@RequestMapping("tbupdate.do")
	public String updateTBoard(String[] list,Board b,BoardFile bf, ModelAndView mv, MultipartHttpServletRequest reloadFile) {
		
			
		
			System.out.println("b파일"+b.getFileStatus());
		
			Iterator<String> files = reloadFile.getFileNames();
			
			MultipartFile mpf = reloadFile.getFile(files.next());
			
			List<MultipartFile> fileList = reloadFile.getFiles("reloadFile");
			
			if(!mpf.getOriginalFilename().equals("")) {	// 새로운 첨부파일이 넘어왔을때
				System.out.println("새로운파일이 들어왔나봅세당"+fileList);
				
				
			/*
			 * tbService.updateStatus(b.getB_no()); // 파일상태값을 Y로 변경 */
				b.setFileStatus("Y");
				int result = tbService.updateTBoard(b);
				
				
			
			System.out.println(fileList);
			
			for (MultipartFile filePart : fileList) {
				 
				
				 String originalFileName = filePart.getOriginalFilename(); // 원본파일명
				 System.out.println("원본명"+originalFileName);
				 String renameFileName = saveFileUpload(mpf,reloadFile,originalFileName);
				 
				 bf.setOriginal_filename(originalFileName);
				 bf.setRename_filename(renameFileName);
				 
				 bf.setB_no(b.getB_no());
				 int resultFile = tbService.upInsertTBoardFile(bf);
			}
		}else {		// 새로운 첨부파일이 없다면
			
			
			if( b.getFileStatus() != null ) {	/// 원래 첨부파일이 있었다면
				
			b.setFileStatus("Y");
			
		}else {
				
				b.setFileStatus("N");
				/*
				 * tbService.updateFileStatus(b.getB_no()); // 첨부파일 여부 상태값을 N으로 변경
				 */			
			 } 
			
	
			int result = tbService.updateTBoard(b);
			
		}
		return "redirect:tbdetail.do?b_no="+b.getB_no();
			
		/*
		 * if(!multi.equals("")) { // 새로운 파일이 넘어왔을때
		 * 
		 * 
		 * b.setFileStatus("Y"); int result = tbService.updateTBoard(b);
		 * 
		 * for (MultipartFile filePart : fileList) {
		 * 
		 * System.out.println("filePart"+filePart);
		 * 
		 * String originalFileName = filePart.getOriginalFilename(); // 원본파일명
		 * System.out.println("원본 파일 명 :" + originalFileName); long fileSize =
		 * filePart.getSize(); // 파일 사이즈
		 * 
		 * String renameFileName = saveFileUpload(mpf,multi,originalFileName);
		 * 
		 * 
		 * bf.setOriginal_filename(originalFileName);
		 * bf.setRename_filename(renameFileName);
		 * 
		 * 
		 * 
		 * 
		 * int resultFile = tbService.updateTBoardFile(bf); }
		 * 
		 * 
		 * 
		 * }else { // 파일이 넘어오지않았을때
		 * 
		 * b.setFileStatus("N"); int result = tbService.insertTBoard(b);
		 * 
		 * } return "redirect:tblist.do";
		 */
				
			}
		/*
		 * // 새로운 첨부파일이 넘어왔을 경우 if (!file.getOriginalFilename().equals("")) {
		 * 
		 * // 기존에 첨부파일이 있을 경우 if (!bf.getOriginal_filename().equals("")) {
		 * 
		 * // 기존의 첨부파일 삭제 deleteFile(bf.getRename_filename(), request);
		 * 
		 * // 새로운 첨부파일이 넘어왔을 때 // 기존에 첨부파일이 있던 없던 간에 서버에 업로드 String renameFileName =
		 * saveFile(file, request);
		 * 
		 * bf.setRename_filename(renameFileName);
		 * bf.setOriginal_filename(file.getOriginalFilename());
		 * 
		 * result = tbService.updateTBoard(b); int resultFile =
		 * tbService.updateFile(bf);
		 * 
		 * } else { // 기존의 파일이 없었다묭용
		 * 
		 * String renameFileName = saveFile(file, request);
		 * 
		 * bf.setRename_filename(renameFileName);
		 * bf.setOriginal_filename(file.getOriginalFilename());
		 * 
		 * int updateStatus = tbService.updateStatus(b.getB_no()); result =
		 * tbService.updateTBoard(b); int resultFile = tbService.updateInsertFile(bf); }
		 * 
		 * }
		 * 
		 * result = tbService.updateTBoard(b); int updateN =
		 * tbService.updateFileStatus(b.getB_no());
		 * 
		 * if (result > 0) { mv.addObject("b_no",
		 * b.getB_no()).setViewName("redirect:tbdetail.do"); } else {
		 * mv.addObject("msg", "게시판 수정 실패").setViewName("common/errorPage"); }
		 */


	// 게시글 삭제
	@RequestMapping("tbdelete.do")
	public String deleteTBoard(int b_no, HttpServletRequest request) {
		int result = tbService.deleteTBoard(b_no);
		ArrayList<BoardFile> list = tbService.deleteBoardFile(b_no);
		if (result > 0) {
			
			for(BoardFile bf : list ) {
				
				new TBoardController().deleteFile(bf.getRename_filename() , request);
			}
	
			return "redirect:tblist.do";
		} else {
			return "common/errorPage";
		}

	}

	// 게시판수정할때 첨부파일 삭제용
	@ResponseBody
	@RequestMapping("tbdeleteFile.do")
	public String deleteFileA(HttpServletRequest request) {

		String rename = request.getParameter("rename_filename");
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/tbuploadFiles";

		File f = new File(savePath + "/" + rename);

		if (f.exists()) {
			System.out.println(f);
			f.delete();
		}

		int result = tbService.updateFileDelete(rename);	// 폴더에서 삭제후 디비에서도 삭제 
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}

	// 업로드 되어있는 파일 삭제용 메소드
	public void deleteFile(String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/tbuploadFiles";
		System.out.println("컨트롤");

		File f = new File(savePath + "/" + renameFileName);

		if (f.exists()) {
			f.delete();
		}

	}

	// 썸머노트 이미지 업로드용 메소드
	@RequestMapping("imageUpload.do")
	public void imageUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		// 업로드할 폴더 경로
		String root = request.getSession().getServletContext().getRealPath("resources");
		String realFolder = root + "/tbuploadImages";
		// String realFolder =
		// request.getSession().getServletContext().getRealPath("buploadFiles");

		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + uuid + "."
				+ org_filename.substring(org_filename.lastIndexOf(".") + 1);

		// System.out.println("원본 파일명 : " + org_filename);
		// System.out.println("저장할 파일명 : " + renameFileName);

		String filepath = realFolder + "\\" + renameFileName;
		// System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("resources/tbuploadImages/" + renameFileName);
		out.close();
	}

	
	// 게시글 작성용 메소드 
	@RequestMapping(value = "insertTBoard.do", method = RequestMethod.POST)
	public String MultifileUp(MultipartHttpServletRequest multi,ModelAndView mv,BoardFile bf,Board b) {
		System.out.println("파일업로드");
		
		  Iterator<String> files = multi.getFileNames();
		
     	  MultipartFile mpf = multi.getFile(files.next());
     	  
			List<MultipartFile> fileList = multi.getFiles("file");
			
				System.out.println(multi);
			
			
			if(!mpf.getOriginalFilename().equals("")) { // 파일이 넘어왔을때
				
				
				b.setFileStatus("Y");
				int result = tbService.insertTBoard(b);
				
				for (MultipartFile filePart : fileList) {
					System.out.println("filePart"+filePart);
				
					String originalFileName = filePart.getOriginalFilename(); // 원본파일명
					System.out.println("원본 파일 명 :" + originalFileName);
					long fileSize = filePart.getSize(); // 파일 사이즈
						
						String renameFileName = saveFileUpload(mpf,multi,originalFileName);
						
					
						bf.setOriginal_filename(originalFileName);
						bf.setRename_filename(renameFileName);
						
						
					
						
						int resultFile = tbService.insertTBoardFile(bf);
				}
				
				
		
				}else { // 파일이 넘어오지않았을때
					
					b.setFileStatus("N");
					int result = tbService.insertTBoard(b);
					
				}
			return "redirect:tblist.do"; 
				
			}
	
			
	
	
	

	
	// 파일 업로드 하고 업로드한 파일명(수정명) 반환하는 메소드 --> 재사용하기 위해 따로 빼둠
	public String saveFileUpload(MultipartFile file, HttpServletRequest request,String originalFileName) {
		System.out.println("file"+file);
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/tbuploadFiles";

		File folder = new File(savePath);

		// System.out.println(savePath);
		// System.out.println(folder.exists());

		if (!folder.exists()) {
			folder.mkdirs(); // savePath까지의 경로가 존재하지 않다면 폴더 생성
		}
		
		UUID uuid = UUID.randomUUID();


		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		// 201911051717.PNG
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + uuid+"."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		
		System.out.println("파일변경명"+renameFileName);

		// ~~~/resources/buploadFiles/201911051717.PNG
		String renamePath = savePath + "/" + renameFileName;

		try {
			FileOutputStream fs = new FileOutputStream(renamePath);
			fs.write(file.getBytes());
			fs.close();

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return renameFileName;
	}
	
	/*
	 * @RequestMapping("insertTBoard.do") public String insertTBoard(Board b,
	 * HttpServletRequest request,BoardFile bf) {
	 * 
	 * if(bfArr != null) { // 파일이 넘어왔을때
	 * 
	 * b.setFileStatus("Y"); int result = tbService.insertTBoard(b); for(int i=0;
	 * i<bfArr.length; i++) { System.out.println("객체배열이여"+bfList); String
	 * original_filename= bfArr[i].getOriginal_filename(); String rename_filename
	 * =bfArr[i].getRename_filename(); bf.setOriginal_filename(original_filename);
	 * bf.setRename_filename(rename_filename);
	 * 
	 * 
	 * int resultFile = tbService.insertTBoardFile(bf); }
	 * 
	 * } else { b.setFileStatus("N"); int result = tbService.insertTBoard(b);
	 * 
	 * }
	 * 
	 * return "redirect:tblist.do"; }
	 */

	// 파일 업로드 하고 업로드한 파일명(수정명) 반환하는 메소드 --> 재사용하기 위해 따로 빼둠
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		
		  String root =
		  request.getSession().getServletContext().getRealPath("resources"); String
		  savePath = root + "/tbuploadFiles";
		  
		  File folder = new File(savePath);
		 
		 System.out.println(savePath);
		 System.out.println(folder.exists());
		
		  if (!folder.exists()) {
			  folder.mkdirs(); // savePath까지의 경로가 존재하지 않다면 폴더 생성 }
		  }

		String originFileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		// 201911051717.PNG
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		// ~~~/resources/buploadFiles/201911051717.PNG
		String renamePath = savePath + "/" + renameFileName;

		try {
			file.transferTo(new File(renamePath)); // 수정명으로 파일 업로드

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		
	
		return renameFileName;
		  
	}
	
	
	// 선생님 게시판 댓글 작성용 메소드
	@ResponseBody
	@RequestMapping("trinsert.do")
	public String insertReplyT(BReply r) {
		System.out.println(r);
		
		int result = tbService.insertReplyT(r);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 선생님 게시판 댓글 리스트용 메소드 
	   
	@ResponseBody
	@RequestMapping(value="treplyList.do", produces="application/json; charset=UTF-8")
	public String treplyList(int b_no) {
		
		ArrayList<BReply> list = tbService.selectReplyList(b_no);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
		
	}
	
	// 선생님 게시판 댓글 수정용 메소드 
	@ResponseBody
	@RequestMapping("tbReplyUpdate.do")
	public String tbReplyUpdate(BReply r) {
		System.out.println("r="+r);
		int result = tbService.tbReplyUpdate(r);
		
		if(result > 0) {
			return "success";
		}else {
			return "failed";
		}
	}
	
	// 대댓글 작성용 메소드 
	@ResponseBody
	@RequestMapping("reReplyInsert.do")
	public String reReplyInsert(BReply r) {
		System.out.println("r="+r);
		int result = tbService.reReplyInsert(r);
		
		tbService.recountUpdate(r);
		
		
		if(result > 0) {
			return "success";
		}else {
			return "failed";
		}
	}
	
	// 댓글 삭제하는 폼
	@ResponseBody
	@RequestMapping("deleteBtn.do")
	public String deleteRe(BReply r) {
		System.out.println(r);
		
		int result = tbService.deleteRe(r);
		
		
		
		  if(r.getDepth() == 2) {
		  
		  tbService.re_countMinus(r); 
		  }
		
		
		if(result > 0) {
			return "success";
		}else {
			return "failed";
		}
	}

	
	
}
