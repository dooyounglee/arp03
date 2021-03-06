package com.kh.arp.vacation.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.lecture.model.vo.Classdate;
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




	public ArrayList<VacationDate> detailVacation(int v_no) {
		
		return (ArrayList)sqlSession.selectList("vacationMapper.detailVacation",v_no);
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

	public ArrayList<Vacation> adminList(int m_no) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("vacationMapper.adminList" ,m_no);
	}

	public int permission(VacationDate vd) {
		// TODO Auto-generated method stub
		return sqlSession.update("vacationMapper.permission" , vd);
	}


	public int companion(VacationDate v) {
		// TODO Auto-generated method stub
		return sqlSession.update("vacationMapper.companion" , v);
		
	}


	public int adminpermission(int num) {
		// TODO Auto-generated method stub
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


	public int multiPermission(VacationDate vd) {
		// TODO Auto-generated method stub
		return sqlSession.update("vacationMapper.multipermission" , vd);
	}


	public int statusCheck(int v_no) {
		// TODO Auto-generated method stub
		
//		int con = sqlSession.update("vacationMapper.statusCheck" , v_no);
//		
//		int rst =0;
//		
//		if(con >0) {
//			rst=sqlSession.insert("vacationMapper.insertvacation" , v_no);
//		}
//		
//		return rst;
		return sqlSession.update("vacationMapper.statusCheck" , v_no);
	}


	public ArrayList<VacationDate> detailVactionT(Vacation v) {
		return (ArrayList)sqlSession.selectList("vacationMapper.detailVactionT" , v);
	}


	public ArrayList<Vacation> selectListAdmin() {
		return (ArrayList)sqlSession.selectList("vacationMapper.selectListAdmin" , null);
	}


	public ArrayList<Vacation> selectStatus(Vacation v) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("vacationMapper.selectStatus" , v);
	}


	public Vacation selectVacation(int v_no) {
		
		return sqlSession.selectOne("vacationMapper.selectVacation" , v_no);
	}


	public List<VacationDate> selectVacationDateListWithCount(int v_no) {
		return sqlSession.selectList("vacationMapper.selectVacationDateListWithCount" , v_no);
	}


	public ArrayList<Classdate> classdateList(int m_no) {
		
		return (ArrayList)sqlSession.selectList("vacationMapper.classdateList" , m_no);
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
