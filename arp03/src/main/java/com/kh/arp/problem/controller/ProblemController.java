package com.kh.arp.problem.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.member.model.vo.Member;
import com.kh.arp.problem.model.service.ProblemService;
import com.kh.arp.problem.model.vo.Homework;
import com.kh.arp.problem.model.vo.Problem;
import com.kh.arp.problem.model.vo.ProblemRelated;
import com.kh.arp.problem.model.vo.Variables;

@Controller
public class ProblemController {

	@Autowired
	private ProblemService ps;
	
	@RequestMapping("list.pro")
	public ModelAndView listProblem(ModelAndView mv) {
		List<Problem> plist=ps.getProblemList();
		//sqlSession.selectList("problemMapper.getProblemList",null);
		mv.addObject("plist", plist);
		mv.setViewName("problem/list");
		return mv;
	}
	
	@GetMapping("make.pro")
	public ModelAndView makeProblemGet(ModelAndView mv) {
		mv.setViewName("problem/make");
		return mv;
	}
	
	@PostMapping("/make.pro")
	public ModelAndView makeProblemPost(Problem p, ModelAndView mv) {
		System.out.println(p);
		int result=ps.makeProblem(p);
		System.out.println(p);
		mv.setViewName("redirect:/get.pro?p_no="+p.getP_no());
		return mv;
	}
	
	@RequestMapping("/preview")
	public ModelAndView preview(String math, ModelAndView mv) {
		mv.setViewName("problem/preview");
		mv.addObject("math", math);
		return mv;
	}
	
	@GetMapping("/get.pro")
	public ModelAndView get(int p_no, ModelAndView mv) {
		Problem p=ps.getProblem(p_no);
		Problem ranp=abc(p);
		
		System.out.println(p);
		System.out.println(ranp);
		
		mv.addObject("ranp", ranp);
		mv.addObject("p", p);
		mv.setViewName("problem/get");
		return mv;
	}
	
	@GetMapping("/edit.pro")
	public ModelAndView editGet(int p_no, ModelAndView mv) {
		Problem p=ps.getProblem(p_no);
		List<Variables> vlist=ps.getVariables(p_no);
		
		mv.addObject("vlist", vlist);
		mv.addObject("p", p);
		mv.setViewName("problem/make");
		return mv;
	}
	
	@PostMapping("/edit.pro")
	public ModelAndView editPost(Problem p, ModelAndView mv) {
		System.out.println(p);
		int result=ps.editProblem(p);
		
		mv.setViewName("redirect:/get.pro?p_no="+p.getP_no());
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/ok.val")
	public String okVariables(Variables v) {
		int result=ps.okVariables(v);
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/del.val")
	public String delVariables(Variables v) {
		int result=ps.delVariables(v);
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/edit.val")
	public String editVariables(Variables v) {
		int result=ps.editVariables(v);
		return "success";
	}
	
	@GetMapping("/list.hw")
	public ModelAndView listHomework(HttpSession session, ModelAndView mv) {
		Member mem=(Member)session.getAttribute("mem");
		List<Homework> list=ps.getHomeworkList(mem.getM_no());
		
		mv.addObject("list", list);
		mv.setViewName("problem/homework/list");
		return mv;
	}
	
	@GetMapping("/make.hw")
	public ModelAndView makeHomeworkGet(HttpSession session, ModelAndView mv) {
		mv.setViewName("problem/homework/make");
		return mv;
	}
	
	@PostMapping("/make.hw")
	public ModelAndView makeHomeworkPost(Homework hw, HttpSession session, ModelAndView mv) {
		Member mem=(Member)session.getAttribute("mem");
		
		hw.setM_no(mem.getM_no());
		int result=ps.makeHomework(hw);
		
		mv.setViewName("redirect:get.hw?hw_no="+hw.getHw_no());
		return mv;
	}
	
	@GetMapping("/get.hw")
	public ModelAndView getHomework(int hw_no, ModelAndView mv) {
		Homework hw=ps.getHomework(hw_no);
		List<Problem> list=ps.getProblemListInHomework(hw_no);
		
		mv.addObject("hw",hw);
		mv.addObject("list",list);
		mv.setViewName("problem/homework/get");
		return mv;
	}
	
	@GetMapping("/add.hw")
	public ModelAndView addHomework(int hw_no, ModelAndView mv) {
		Homework hw=ps.getHomework(hw_no);
		List<Problem> list=ps.getProblemList();
				
		mv.addObject("hw",hw);
		mv.addObject("list",list);
		mv.setViewName("problem/homework/add");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/addProblem.hw")
	public String addProblem(ProblemRelated hw_p) {
		int result=ps.insertProblemInHomework(hw_p);
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/delProblem.hw")
	public String delProblem(ProblemRelated hw_p) {
		int result=ps.deleteProblemInHomework(hw_p);
		return "success";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public Problem abc(Problem p) {
		Problem ranp=null;
		List<Variables> vlist=ps.getVariables(p.getP_no());
		if(vlist.size()>0) {
			int random=(int)(Math.random()*vlist.size());
			Variables v=vlist.get(random);
			
			System.out.println(p);
			System.out.println(v);
			String strp=p.getProblem();
			String strs=p.getSolve();
			String strsolu=p.getSolution();
			String[] keyval=p.getKeyval().split(",");
			String[] val=v.getVal().split(",");
			
			JSONObject jo=new JSONObject();
			for(int i=0;i<keyval.length;i++) {
				jo.put(keyval[i], val[i]);
			}
			
			Set<String> i=jo.keySet();
			Iterator<String> it=i.iterator();
			while(it.hasNext()){
				String temp=it.next();
				strp=strp.replaceAll(temp, (String)jo.get(temp));
				strs=strs.replaceAll(temp, (String)jo.get(temp));
				strsolu=strsolu.replaceAll(temp, (String)jo.get(temp));
			}
			
			ranp=new Problem();
			ranp.setP_no(p.getP_no());
			ranp.setProblem(strp);
			ranp.setSolve(strs);
			ranp.setSolution(strsolu);
			ranp.setKeyval(p.getKeyval());
		}
		return ranp;
	}
}
