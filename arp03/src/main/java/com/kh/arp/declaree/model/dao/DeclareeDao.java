package com.kh.arp.declaree.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.declaree.model.vo.Declaree;

@Repository
public class DeclareeDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int declare(Declaree d) {
		return sqlSession.insert("declareMapper.declare", d);
	}

}
