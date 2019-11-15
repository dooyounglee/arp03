package com.kh.arp.vacation.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VacationDao {

	@Autowired
	private SqlSession sqlSession;
}
