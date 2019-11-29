package com.kh.arp.vacation.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.vacation.model.vo.Vacation;
import com.kh.arp.vacation.model.vo.VacationDate;

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


	public Vacation selectVacation(int lec_no) {
		
		return sqlSession.selectOne("vacationMapper.selectVacation",lec_no);
	}


	public int updateVacation(Vacation v) {
		// TODO Auto-generated method stub
		return sqlSession.update("vacationMapper.updateVacation" , v);
	}


	public int deleteVacation(VacationDate v) {
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


	public int adminpermission(int num) {
		// TODO Auto-generated method stub
		return sqlSession.update("vacationMapper.adminpermission" , num);
	}


	public int multipermission(int num) {
		
		return sqlSession.update("vacationMapper.adminpermission" , num);
	}


	public int insertDate(Vacation v) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertDate" , v);
	}


	public List<VacationDate> selectLecNo(VacationDate vd) {
		return sqlSession.selectList("vacationMapper.selectLecNo" , vd);
	}


	public int insertVacationDate(List<VacationDate> vDlist) {
		for(int i=0;i<vDlist.size();i++) {
			sqlSession.insert("vacationMapper.insertVacationDate" , vDlist.get(i));
		}
		return 1;
	}


	/*
	public int insertVacation(Vacation v, String[] rlaalstkd) {
		List<Vacation> lec_no_date_list=sqlSession.selectList("vacationMapper.rlaalstkd" , v.getM_no());
		for(int i=0;i<lec_no_date_list.size();i++) {
			v.setLec_no(lec_no_date_list.get(0).getLec_no());
			v.setVacation_date(lec_no_date_list.get(0).getVacation_date());
			
			sqlSession.insert("vacationMapper.insertDate" , v);
		}
		return 0;
	}*/


	








}
