package com.kh.arp.vacation.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.vacation.model.vo.Vacation;
import com.kh.arp.vacation.model.vo.VacationDate;

public interface VacationService {

	// 휴가작성용
	int insertVacation(Vacation v);
	
	// 날짜 입력용 
	int insertDate(Vacation v);
	
	// 휴가리스트
	ArrayList<Vacation>selectList(int m_no);
	
	// 내강의리스트
	ArrayList<Lecture>selectLectureList(int m_no);
	
	// 휴가 상세보기
	Vacation selectVacation(int v_no);
	
	// 휴가 수정하기폼
	 Vacation updateVacationForm(int v_no);
	
	// 휴가 수정하기
	 int updateVacation(Vacation v);
	 
	// 휴가 삭제하기 
	 int deleteVacation(Vacation v);
	 
	 // 학생 휴가 조회
	 ArrayList<Vacation>selectStudentList(int m_no);
	 
	 // 휴가 허가
	 int permission(int v_no);
	 
	 // 휴가 반려
	 int companion(Vacation v);
	 
	 // 관리자 다중 휴가 처리
	 int adminpermission(int num);
	 
	 //관리자 휴가처리
	 int multiPermission(int num);

	List<VacationDate> selectLecNo(VacationDate vd);

	int insertVacationDate(List<VacationDate> vDlist);

	
}
