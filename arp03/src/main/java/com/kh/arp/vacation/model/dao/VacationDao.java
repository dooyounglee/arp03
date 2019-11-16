package com.kh.arp.vacation.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VacationDao {

	@Autowired
	private SqlSession sqlSession;

	public int insertVacation(int v_no) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertVacation" , v_no);
	}
}
