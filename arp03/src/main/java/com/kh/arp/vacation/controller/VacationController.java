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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.lecture.model.service.LectureService;
import com.kh.arp.lecture.model.vo.Attendence;
import com.kh.arp.lecture.model.vo.Classdate;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.vacation.model.service.VacationService;
import com.kh.arp.vacation.model.vo.Vacation;
import com.kh.arp.vacation.model.vo.VacationDate;

@Controller
public class VacationController {
	@Autowired
	private VacationService vService;
	
	@Autowired
	private LectureService ls;
	
	/*
	 * @RequestMapping("myLlist.me") public ModelAndView myLectrueList(ModelAndView
	 * mv, HttpSession session) { int m_no =
	 * ((Member)session.getAttribute("mem")).getM_no();
	 * 
	 * 
	 * ArrayList<Lecture> list = vService.selectLectureList(m_no);
	 * System.out.println(list); mv.addObject("list" ,
	 * list).setViewName("vacation/myLectureListForm");
	 * 
	 * return mv; }
	 */
	
	
	@RequestMapping("vlist.me")
	public ModelAndView vacationListForm(ModelAndView mv, HttpSession session ) {
		Member mem=(Member)session.getAttribute("mem");
		
		ArrayList<Vacation> list=null;
		if(mem.getTypee().equals("s")) {
			list = vService.selectList(mem.getM_no());
		}else if(mem.getTypee().equals("a")){
			list=vService.selectListAdmin();
		}
		System.out.println(list);
		mv.addObject("list" , list).setViewName("vacation/vacationListForm");
		
		
		return mv;
	}
	
	
	
	@RequestMapping("vinsertForm.me")
	public ModelAndView vInsertForm(HttpSession session , ModelAndView mv) {
		
		Member mem=(Member)session.getAttribute("mem");
		
		ArrayList<Classdate> date = vService.classdateList(mem.getM_no());
		
		System.out.println(date);
		
		mv.addObject("date", date).setViewName("vacation/insertVacationForm");
		
		
		return mv;
	}
	
	@RequestMapping("vupdateForm")
	public ModelAndView vupdate(int v_no , ModelAndView mv) {
		
	Vacation v = vService.updateVacationForm(v_no);	
	
	
	mv.addObject("v" , v).setViewName("vacation/updateVacationForm");
		
	return mv;
	}
	
	
	/*
	 * public ModelAndView calenderList(int m_no , ModelAndView mv , HttpSession
	 * session) {
	 * 
	 * Member mem=(Member)session.getAttribute("mem");
	 * 
	 * ArrayList<Classdate> list = vService.classdateList(mem.getM_no());
	 * 
	 * System.out.println(list);
	 * 
	 * mv.addObject("list", list).setViewName("vacation/insertVacationForm");
	 * 
	 * return mv;
	 * 
	 * }
	 */
	
	
	
	
	@PostMapping("vinsert.me")
	public String vinsert(Vacation v , String[] dateArea, HttpSession session  ) {
		
		Member mem=(Member)session.getAttribute("mem");
		
		

		int result = vService.insertVacation(v);
	
		int result1 = 0;
		for(int j =0; j<dateArea.length; j++) {
			
			VacationDate vd=new VacationDate();
			vd.setM_no(mem.getM_no());
//			String temp=dateArea[j].replaceAll("-", "/");
//			temp=temp.substring(2);
//			vd.setClassdate(temp); // vacationdate 로 바꾸기
			// 날짜 YY/MM/DD 로바꾼뒤
//			vd.setClassdate(dateArea[j]);
			vd.setVacation_date(dateArea[j]);
			
			
			List<VacationDate> list=vService.selectLecNo(vd);
			
			List<VacationDate> vDlist = new ArrayList<VacationDate>();
			for(int i=0;i<list.size();i++) {
				VacationDate vdd=new VacationDate();
				vdd.setV_no(v.getV_no());
				vdd.setLec_no(list.get(i).getLec_no());
//				vdd.setClassdate(list.get(i).getClassdate().split(" ")[0].replaceAll("-", "/"));
//				vdd.setClassdate(list.get(i).getClassdate().split(" ")[0]);
				vdd.setVacation_date(list.get(i).getVacation_date().split(" ")[0]);
				System.out.println(list);
				vDlist.add(vdd );
			}
			System.out.println(vDlist);
			
			 result1=vService.insertVacationDate(vDlist);

		}
		
		if(result >0 && result1 >0) {
			
			return"redirect:vlist.me";
		}else {
			return"common/errorPage";
		}
		
		
		
//		if(result>0) {
//			return"redirect:vlist.me";
//		}else {
//			return "common/errorPage";
//		}
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
	public ModelAndView vDetail(ModelAndView mv,int v_no, HttpSession session) {
		//vd.setVacationdate(vacationD);
		Member mem=(Member)session.getAttribute("mem");
		
		ArrayList<VacationDate> list=null;
		Vacation v=new Vacation();
		v.setV_no(v_no);
		v.setM_no(mem.getM_no());
		if(mem.getTypee().equals("t")) {
			list=vService.detailVactionT(v);
		}else {
			list=vService.detailVacation(v_no);
		}
		
		Vacation vv = vService.selectVacation(v_no);
		
		System.out.println(list);
		
			mv.addObject("list", list).addObject("vv",vv).setViewName("vacation/detailVacation");
			
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
	public String vDelete(VacationDate v) {
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
			System.out.println(list);
			mv.addObject("list", list).setViewName("vacation/studentVacationListForm");
		
		return mv;
	}
	
	@RequestMapping("companiForm.me")
	public ModelAndView companiForm(int v_no ,int lec_no ,String vacation_date, ModelAndView mv, VacationDate vd ) {
		
		vd.setV_no(v_no);
		vd.setLec_no(lec_no);
		vd.setVacation_date(vacation_date);
		mv.addObject("vd",vd).setViewName("vacation/companion");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("permission.te")
	public String permission(VacationDate vd , int lec_no , int v_no , String vacation_date) {
		
		vd.setLec_no(lec_no);
		vd.setV_no(v_no);
		vd.setVacation_date(vacation_date);
		
		int result = vService.permission(vd);
		
		if(result >0) {
			return "success";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("cReason.te")
	public String companion(VacationDate v, int v_no , int lec_no) {
		
		v.setV_no(v_no);
		v.setLec_no(lec_no);
		int result = vService.companion(v);
		
		 
		if(result > 0) {
			return "redirect:vDetail.me?v_no="+v_no;
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("sVlist.ad")
	public ModelAndView adminpermission(HttpSession session, ModelAndView mv) {
		int m_no = ((Member)session.getAttribute("mem")).getM_no();
		ArrayList<Vacation> list = vService.adminList(m_no);
			mv.addObject("list", list).setViewName("vacation/adminVacation");
		return mv;
		
	}
	
	@ResponseBody  
	@RequestMapping("permission.ad")
	public String checkVnoTest(@RequestParam(value="checkList[]") List<String> Number) {
		
		
	//	System.out.println(Number);
		
		int result=0;
		
		for(String v : Number ) {
			System.out.println("값이 넘어오는" + v);
			
			int num =Integer.parseInt(v);
			System.out.println(num);
			result =vService.adminpermission(num); 	
			//System.out.println(result);
		}
	
		
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		

		
	}
	@ResponseBody
	@RequestMapping("status.me")
	public String statusCheck( int v_no,ModelAndView mv) {
		
		System.out.println("asdasd"+v_no);
		
		int result  = vService.statusCheck(v_no);
		System.out.println("aa"+result + "aa1211212121");
		if(result > 0) {
			//학생꺼 출결 바꾸는거
			Vacation v=vService.selectVacation(v_no);
			List<VacationDate> vdList=vService.selectVacationDateListWithCount(v_no);
			if(vdList.size()==0) {
				return "success";
			}else {
				for(VacationDate vd:vdList) {
					Attendence att=new Attendence();
					att.setLec_no(vd.getLec_no());
					att.setM_no(vd.getM_no());
					att.setNth(vd.getNth());
					att.setContent("휴");
					int result1=ls.insertAttendence(att);
				}
			}
			return "success";
		}else {
			return "error";
		}
		
		
	}
	
	
	
	
	
//	public ModelAndView adminStatus(Vacation v , ModelAndView mv) {
//		
//		v.getV_no();
//		
//		ArrayList<Vacation> list = vService.selectStatus(v);
//		
//		
//		mv.addObject("v" , list).addObject("vacation/detailView");
//		
//		return mv;
//				
//	 
//	}
//	
	@ResponseBody  
	@RequestMapping("multiPermission.ad")
	public int MultiCheck(@RequestParam(value="MultiList[]") List<String> Number ,
						  @RequestParam(value="lec_no")int lec_no,
						  @RequestParam(value="vacation_date")String vacation_date, VacationDate vd) {
		System.out.println("배열"+Number);
		
		System.out.println(lec_no);
		System.out.println(vacation_date);
		int num=0;
		for(String v : Number) {
			System.out.println(v);
			 num = Integer.parseInt(v);
		}
		
		
		vd.setV_no(num);
		vd.setLec_no(lec_no);
		vd.setVacation_date(vacation_date);
		
		System.out.println("dd" + num);
		
		int result = vService.multiPermission(vd);
	
	
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
