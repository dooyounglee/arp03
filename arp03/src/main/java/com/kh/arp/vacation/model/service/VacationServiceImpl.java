package com.kh.arp.vacation.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.vacation.model.dao.VacationDao;
import com.kh.arp.vacation.model.vo.Vacation;
import com.kh.arp.vacation.model.vo.VacationDate;

@Service
public class VacationServiceImpl implements VacationService {
	@Autowired
	private VacationDao vDao;

	@Override
	public int insertVacation(Vacation v) {
		// TODO Auto-generated method stub
		return vDao.insertVacation(v);
	}
	@Override
	public int insertDate(Vacation v) {
		// TODO Auto-generated method stub
		return vDao.insertDate(v);
	}

	@Override
	public ArrayList<Vacation> selectList(int m_no) {
		// TODO Auto-generated method stub
		return vDao.selectList(m_no);
	}
	@Override
	public ArrayList<Lecture> selectLectureList(int m_no) {
		// TODO Auto-generated method stub
		return vDao.selectLectureList(m_no);
	}
	@Override
	public Vacation selectVacation(int v_no) {
		// TODO Auto-generated method stub
		return vDao.selectVacation(v_no);
	}
	@Override
	public Vacation updateVacationForm(int v_no) {
		// TODO Auto-generated method stub
		return vDao.selectVacation(v_no);
	}

	@Override
	public int updateVacation(Vacation v) {
		// TODO Auto-generated method stub
		return vDao.updateVacation(v);
	}
	@Override
	public int deleteVacation(Vacation v) {
		// TODO Auto-generated method stub
		return vDao.deleteVacation(v);
	}

	@Override
	public ArrayList<Vacation> selectStudentList(int m_no) {
		// TODO Auto-generated method stub
		return vDao.studentVacation(m_no);
	}
	@Override
	public int permission(int v_no) {
		// TODO Auto-generated method stub
		return vDao.permission(v_no);
	}
	@Override
	public int companion(Vacation v) {
		// TODO Auto-generated method stub
		return vDao.companion(v);
	}

	public int adminpermission(int num) {
		// TODO Auto-generated method stub
		return vDao.adminpermission(num);
	}

	public int multiPermission(int num) {
		// TODO Auto-generated method stub
		return vDao.multipermission(num);
	}
	/*
	public int insertVacation(Vacation v, String[] rlaalstkd) {
		return vDao.insertVacation(v,rlaalstkd);
	}*/
	@Override
	public List<VacationDate> selectLecNo(VacationDate vd) {
		return vDao.selectLecNo(vd);
	}
	@Override
	public int insertVacationDate(List<VacationDate> vDlist) {
		return vDao.insertVacationDate(vDlist);
	}
	

	



	







	
	
}
