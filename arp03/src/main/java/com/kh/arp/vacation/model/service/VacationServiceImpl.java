package com.kh.arp.vacation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


	
	
}
