package com.kh.arp.vacation.model.service;

import java.util.ArrayList;

import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.vacation.model.vo.Vacation;

public interface VacationService {

	// 휴가작성용
	int insertVacation(Vacation v);
	// 휴가리스트
	ArrayList<Vacation>selectList();
	
	// 내강의리스트
	ArrayList<Lecture>selectLectureList(int m_no);
	
}
