package com.kh.arp.vacation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.vacation.model.vo.Vacation;

@Repository
public class VacationDao {

	@Autowired
	private SqlSession sqlSession;

	public int insertVacation(Vacation v) {
		
		return sqlSession.insert("vacationMapper.insertVacation",v);
	}


	public ArrayList<Vacation> selectList() {
		
		return (ArrayList)sqlSession.selectList("vacationMapper.selectList");
	}
}
