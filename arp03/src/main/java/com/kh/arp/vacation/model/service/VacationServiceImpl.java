package com.kh.arp.vacation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.vacation.model.dao.VacationDao;

@Service
public class VacationServiceImpl {
	@Autowired
	private VacationDao vDao;
}
