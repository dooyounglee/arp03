package com.kh.arp.attendence.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.attendence.model.dao.AttendenceDao;
import com.kh.arp.attendence.model.vo.Attendence;

@Service
public class AttendenceServiceImpl implements AttendenceService {
		
	@Autowired
	private AttendenceDao atDao;
	
	@Override
	public Attendence selectStudentAttendence() {
		Attendence at = atDao.selectStudentAttendence();
		return null;
	}

	@Override
	public Attendence selectTeacherAttendence() {
		
		return null;
	}

	@Override
	public Attendence selectTeacherDetailAttendence() {
		
		return null;
	}

}
