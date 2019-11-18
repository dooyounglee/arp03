package com.kh.arp.vacation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.arp.vacation.model.service.VacationServiceImpl;
import com.kh.arp.vacation.model.vo.Vacation;

@Controller
public class VacationController {
	@Autowired
	private VacationServiceImpl vService;
	
	@RequestMapping("vlist.me")
	public String vacationListForm() {
		
		return "vacation/vacationListForm";
	}
	
	@RequestMapping("vinsertForm.me")
	public String vInsertForm() {
		
		return "vacation/insertVacationForm";
	}
	
	@RequestMapping("vinsert.me")
	public String vInsert(Vacation v) {
		
		int result = vService.insertVacation(v);
		
		if(result>0) {
			return "redirect:vlist.me";
		}else {
			return null;
		}
		
	}
}
