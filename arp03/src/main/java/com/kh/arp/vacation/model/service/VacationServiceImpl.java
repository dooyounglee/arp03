package com.kh.arp.vacation.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.lecture.model.vo.Classdate;
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
	public ArrayList<VacationDate> detailVacation(int v_no) {
		// TODO Auto-generated method stub
		return vDao.detailVacation(v_no);
	
	};
//	@Override
//	public Vacation updateVacationForm(int v_no) {
//		// TODO Auto-generated method stub
//		return vDao.selectVacation(v_no);
//	}

	@Override
	public int updateVacation(Vacation v) {
		// TODO Auto-generated method stub
		return vDao.updateVacation(v);
	}
	@Override
	public int deleteVacation(VacationDate v) {
		// TODO Auto-generated method stub
		return vDao.deleteVacation(v);
	}

	@Override
	public ArrayList<Vacation> selectStudentList(int m_no) {
		// TODO Auto-generated method stub
		return vDao.studentVacation(m_no);
	}

	@Override
	public ArrayList<Vacation> adminList(int m_no) {
		// TODO Auto-generated method stub
		return vDao.adminList(m_no);
	}
	
	@Override
	public int permission(VacationDate vd) {
		// TODO Auto-generated method stub
		return vDao.permission(vd);
	}
	@Override
	public int companion(VacationDate v) {
		// TODO Auto-generated method stub
		return vDao.companion(v);
	}
	@Override
	public int adminpermission(int num) {
		// TODO Auto-generated method stub
		return vDao.adminpermission(num);
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
	@Override
	public Vacation updateVacationForm(int v_no) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int multiPermission(VacationDate vd) {
		
		return vDao.multiPermission(vd);
	}
	@Override
	public int statusCheck(int v_no) {
		// TODO Auto-generated method stub
		return vDao.statusCheck(v_no);
	}
	@Override
	public ArrayList<VacationDate> detailVactionT(Vacation v) {
		return vDao.detailVactionT(v);
	}
	@Override
	public ArrayList<Vacation> selectListAdmin() {
		return vDao.selectListAdmin();
	}
	@Override
	public ArrayList<Vacation> selectStatus(Vacation v) {
		// TODO Auto-generated method stub
		return vDao.selectStatus(v);
	}
	@Override
	public Vacation selectVacation(int v_no) {
		// TODO Auto-generated method stub
		return vDao.selectVacation(v_no);
	}
	@Override
	public List<VacationDate> selectVacationDateListWithCount(int v_no) {
		return vDao.selectVacationDateListWithCount(v_no);
	}
	@Override
	public ArrayList<Classdate> classdateList(int m_no) {
		
		return vDao.classdateList(m_no);
	}


	}
	

	



	







	
	

