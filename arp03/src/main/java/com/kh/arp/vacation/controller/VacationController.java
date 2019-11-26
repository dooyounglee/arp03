package com.kh.arp.vacation.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.vacation.model.service.VacationServiceImpl;
import com.kh.arp.vacation.model.vo.Vacation;

@Controller
public class VacationController {
	@Autowired
	private VacationServiceImpl vService;
	
	@RequestMapping("myLlist.me")
	public ModelAndView myLectrueList(ModelAndView mv, HttpSession session) {
		int m_no =	((Member)session.getAttribute("mem")).getM_no();
		
		
		ArrayList<Lecture> list = vService.selectLectureList(m_no);	
		System.out.println(list);
		mv.addObject("list" , list).setViewName("vacation/myLectureListForm");
		
		return mv;
	}
	
	
	@RequestMapping("vlist.me")
	public ModelAndView vacationListForm(ModelAndView mv, HttpSession session ) {
		
		int m_no = ((Member)session.getAttribute("mem")).getM_no();
		
		ArrayList<Vacation> list = vService.selectList(m_no);
				
		mv.addObject("list" , list).setViewName("vacation/vacationListForm");
		
		
		return mv;
	}
	
	@RequestMapping("vinsertForm.me")
	public String vInsertForm() {
		
		return "vacation/insertVacationForm";
	}
	
	@RequestMapping("vupdateForm")
	public ModelAndView vupdate(int v_no , ModelAndView mv) {
		
	Vacation v = vService.updateVacationForm(v_no);	
	
	
	mv.addObject("v" , v).setViewName("vacation/updateVacationForm");
		
	return mv;
	}
	
	@RequestMapping("vinsert.me")
	public String vinsert(Vacation v , String dateArea ) {
		
		
		int result = vService.insertVacation(v);
		
		if(result>0) {
			return"redirect:vlist.me";
		}else {
			return "common/errorPage";
		}
	}
	
	
	/*
	@RequestMapping("vinsert.me")
	public String vinsert(Vacation v, String[] rlaalstkd) {
		
		System.out.println(v);
		for(int i=0;i<rlaalstkd.length;i++) {
			System.out.println(rlaalstkd[i]);
		}
		
		int result = vService.insertVacation(v,rlaalstkd);
		return "";
		/*
		 * int result = vService.insertVacation(v);
		 * 
		 * if(result>0) { return "redirect:vlist.me"; }else { return "common/errorPage";
		 * }
		 */
	
	/*
	@ResponseBody
	@RequestMapping("vinsertDate.me")
	public String vinsertDate(@RequestParam(value="arrDate[]")List<String> DateList, 
							  @RequestParam(value="m_no") int m_no,
							  @RequestParam(value="lec_no") int lec_no,
							  Vacation v , HttpServletResponse response) {
		
		
		System.out.println("컨ㄷ트롤" + m_no + lec_no);
		
		String join = String.join(",", DateList);
		System.out.println("포문밖"+join);
		v.setM_no(m_no);
		v.setLec_no(lec_no);
		v.setVacation_date(join);
		
		int result = vService.insertDate(v);
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(result);
		
	
	}
	*/
	@RequestMapping("vDetail.me")
	public ModelAndView vDetail(ModelAndView mv,int v_no) {
		
		Vacation v = vService.selectVacation(v_no);
		
		if(v!= null) {
			
			mv.addObject("v", v).setViewName("vacation/detailVacation");
			
		}else {
			mv.addObject("msg","게시글조회실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("vupdate.me")
	public ModelAndView vUpdate(ModelAndView mv,Vacation v) {
		
		int result  = vService.updateVacation(v);
		
		if(result >0) {
			mv.addObject(v).setViewName("redirect:vlist.me");
		}else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("vdelete.me")
	public String vDelete(Vacation v) {
		int result = vService.deleteVacation(v);
		
		if(result>0) {
			return "redirect:vlist.me";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("sVlist.te")
	public ModelAndView sVlistForm(ModelAndView mv , HttpSession session) {
		
		int m_no = ((Member)session.getAttribute("mem")).getM_no();
		
		ArrayList<Vacation> list = vService.selectStudentList(m_no);
		
		mv.addObject("list",list).setViewName("vacation/studentVacationListForm");
		
		return mv;
	}
	
	@RequestMapping("companiForm.me")
	public ModelAndView companiForm(int v_no , ModelAndView mv) {
		
		mv.addObject("v_no",v_no).setViewName("vacation/companion");
		
		return mv;
	}
	
	
	@RequestMapping("permission.te")
	public String permission(int v_no) {
		
		int result = vService.permission(v_no);
		
		if(result >0) {
			return "redirect:sVlist.te";
		}else {
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("cReason.te")
	public String companion(Vacation v) {
		
		System.out.println("v"+v);
		int result = vService.companion(v);
		
		 
		if(result > 0) {
			return "redirect:sVlist.te";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("sVlist.ad")
	public ModelAndView adminpermission(HttpSession session, ModelAndView mv) {
		int m_no = ((Member)session.getAttribute("mem")).getM_no();
		ArrayList<Vacation> list = vService.selectList(m_no);
		
		mv.addObject("list" , list).setViewName("vacation/adminVacation");
		
		return mv;
		
	}
	
	@ResponseBody  
	@RequestMapping("permission.ad")
	public int checkVnoTest(@RequestParam(value="checkList[]") List<String> Number) {
		
		
	//	System.out.println(Number);
		
		int result=0;
		
		
		for(String v : Number ) {
			//System.out.println(v);
			
			int num =Integer.parseInt(v);
			
			result =vService.adminpermission(num); 	
			//System.out.println(result);
		}
		
		return result;

		
	}
	
	@ResponseBody  
	@RequestMapping("multiPermission.ad")
	public int MultiCheck(@RequestParam(value="MultiList[]") List<String> Number) {
		//System.out.println(Number);
		
		int result =0;
		
		for(String v : Number) {
			int num = Integer.parseInt(v);
			
			result = vService.multiPermission(num);
			//System.out.println(result);
		}
		
		//System.out.println(result);
		return result;
	}
	
	@RequestMapping("signature-pad.te")
	public String signaturePad() {
		return "vacation/signature-pad";
	}
	
	
	@RequestMapping("imageUpload.te")
	public void imageUpload(MultipartFile file , HttpServletRequest request , HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String realFolder = root + "/tSignImages/";
		
		UUID uuid = UUID.randomUUID();
		
		String org_filename= file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + uuid + "."
				+ org_filename.substring(org_filename.lastIndexOf(".") + 1);
		
		String filepath = realFolder + "\\" + renameFileName;
		
		File f = new File(filepath);
		
		if(!f.exists()) {
			f.mkdir();
		}
		file.transferTo(f);
		out.println("resources/tSignImages/" + renameFileName);
		out.close();
	}
	
	
	
	/*
	 * @RequestMapping("imageUpload.te") public void imageUpload(MultipartFile file,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception {
	 * response.setContentType("text/html;charset=utf-8"); PrintWriter out =
	 * response.getWriter();
	 * 
	 * // 업로드할 폴더 경로 String root =
	 * request.getSession().getServletContext().getRealPath("resources"); String
	 * realFolder = root + "/tbuploadImages"; // String realFolder = //
	 * request.getSession().getServletContext().getRealPath("buploadFiles");
	 * 
	 * UUID uuid = UUID.randomUUID();
	 * 
	 * // 업로드할 파일 이름 String org_filename = file.getOriginalFilename();
	 * 
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	 * 
	 * String renameFileName = sdf.format(new Date(System.currentTimeMillis())) +
	 * uuid + "." + org_filename.substring(org_filename.lastIndexOf(".") + 1);
	 * 
	 * // System.out.println("원본 파일명 : " + org_filename); //
	 * System.out.println("저장할 파일명 : " + renameFileName);
	 * 
	 * String filepath = realFolder + "\\" + renameFileName; //
	 * System.out.println("파일경로 : " + filepath);
	 * 
	 * File f = new File(filepath); if (!f.exists()) { f.mkdirs(); }
	 * file.transferTo(f); out.println("resources/tbuploadImages/" +
	 * renameFileName); out.close(); }
	 */
	
	
	
}
