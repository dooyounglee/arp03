package com.kh.arp.vacation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.arp.vacation.model.service.VacationServiceImpl;

@Controller
public class VacationController {
	@Autowired
	private VacationServiceImpl vService;
	
	@RequestMapping("vlist.me")
	public String vacationListForm() {
		
		return "vacation/vacationListForm";
	}
	
	@RequestMapping("vinsert.me")
	public String vInsertForm() {
		
		return "vacation/insertVacationForm";
	}
}
