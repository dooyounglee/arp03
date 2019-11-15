package com.kh.arp.attendence.model.service;

import com.kh.arp.attendence.model.vo.Attendence;

public interface AttendenceService {

	
	//1. 학생 출석조회  셀렉트
	Attendence selectStudentAttendence();
	//2. 선생님 (학생 명단 조회) 셀렉트
	Attendence selectTeacherAttendence();
	//3. 선생님 (학생 상세 출석 조회) 셀렉트
	Attendence selectTeacherDetailAttendence();
	
}
