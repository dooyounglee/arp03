package com.kh.arp.vacation.model.service;

import java.util.ArrayList;

import com.kh.arp.vacation.model.vo.Vacation;

public interface VacationService {

	// 휴가작성용
	int insertVacation(Vacation v);
	// 휴가리스트
	ArrayList<Vacation>selectList();
	
}
