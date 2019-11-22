package com.kh.arp.vacation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.vacation.model.vo.Vacation;

@Repository
public class VacationDao {

	@Autowired
	private SqlSession sqlSession;

	public int insertVacation(Vacation v) {
		
		return sqlSession.insert("vacationMapper.insertVacation" , v);
	}


	public ArrayList<Vacation> selectList(int m_no) {
		
		return (ArrayList)sqlSession.selectList("vacationMapper.selectList" , m_no);
	}


	public ArrayList<Lecture> selectLectureList(int m_no) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("vacationMapper.selectLecture" , m_no);
	}


	public Vacation selectVacation(int v_no) {
		
		return sqlSession.selectOne("vacationMapper.selectVacation",v_no);
	}


	public int updateVacation(Vacation v) {
		// TODO Auto-generated method stub
		return sqlSession.update("vacationMapper.updateVacation" , v);
	}


	public int deleteVacation(Vacation v) {
		// TODO Auto-generated method stub
		return sqlSession.delete("vacationMapper.deleteVacation",v);
	}


	public ArrayList<Vacation> studentVacation(int m_no) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("vacationMapper.studentVacationList" ,m_no);
	}


	public int permission(int v_no) {
		// TODO Auto-generated method stub
		return sqlSession.update("vacationMapper.permission" , v_no );
	}


	public int companion(Vacation v) {
		// TODO Auto-generated method stub
		return sqlSession.update("vacationMapper.companion" , v);
		
	}


	








}
