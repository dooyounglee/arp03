package com.kh.arp.vacation.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.vacation.model.dao.VacationDao;
import com.kh.arp.vacation.model.vo.Vacation;

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
	public ArrayList<Vacation> selectList() {
		// TODO Auto-generated method stub
		return vDao.selectList();
	}

	public ArrayList<Lecture> selectLectureList(int m_no) {
		// TODO Auto-generated method stub
		return vDao.selectLectureList(m_no);
	}

	public Vacation selectVacation(int v_no) {
		// TODO Auto-generated method stub
		return vDao.selectVacation(v_no);
	}

	public Vacation updateVacationForm(int v_no) {
		// TODO Auto-generated method stub
		return vDao.selectVacation(v_no);
	}


	







	
	
}
