package com.kh.arp.attendence.model.service;

import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
import org.springframework.stereotype.Service;

import com.kh.arp.attendence.model.dao.AttendenceDao;
import com.kh.arp.attendence.model.vo.Attendence;

@Service
=======

import com.kh.arp.attendence.model.dao.AttendenceDao;
import com.kh.arp.attendence.model.vo.Attendence;

>>>>>>> branch 'dev' of https://github.com/dooyounglee/arp03
public class AttendenceServiceImpl implements AttendenceService {
		
	@Autowired
	private AttendenceDao atDao;
	
	@Override
	public Attendence selectStudentAttendence() {
<<<<<<< HEAD
		Attendence at = atDao.selectStudentAttendence();
=======
		Attendence at = atDao.selectStudentAttendence(); 
>>>>>>> branch 'dev' of https://github.com/dooyounglee/arp03
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
