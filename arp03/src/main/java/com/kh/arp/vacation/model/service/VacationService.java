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
	
	// 휴가 상세보기
	ArrayList<VacationDate> detailVacation(int v_no);
	
	// 휴가 수정하기폼
	 Vacation updateVacationForm(int v_no);
	
	// 휴가 수정하기
	 int updateVacation(Vacation v);
	 
	// 휴가 삭제하기 
	 int deleteVacation(VacationDate v);
	 
	 // 학생 휴가 조회
	 ArrayList<Vacation>selectStudentList(int m_no);
	 
	 // 휴가 허가
	 int permission(VacationDate vd);
	 
	 // 휴가 반려
	 int companion(VacationDate v);
	 // 관리자 휴가리스트
	 ArrayList<Vacation> adminList(int m_no);
	 
	 // 관리자 다중 휴가 처리
	 int adminpermission(int num);
	 
	 //관리자 휴가처리
	 
	 int multiPermission(VacationDate vd);

	List<VacationDate> selectLecNo(VacationDate vd);

	// 날짜조회용
	int insertVacationDate(List<VacationDate> vDlist);

	// 휴가 상태
	int statusCheck(int v_no);
	
	//	선생님 디테일
	ArrayList<VacationDate> detailVactionT(Vacation v);
	
	// 관리자 리스트
	ArrayList<Vacation> selectListAdmin();

	//상태
	ArrayList<Vacation> selectStatus(Vacation v);

	Vacation selectVacation(int v_no);



	
}
