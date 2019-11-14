package com.kh.arp.attendence.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.attendence.model.vo.Attendence;

@Repository
public class AttendenceDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Attendence selectStudentAttendence() {
		
		return 
	}
}
