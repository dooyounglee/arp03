package com.kh.arp.declaree.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.declaree.model.dao.DeclareeDao;
import com.kh.arp.declaree.model.vo.Declaree;

@Service
public class DeclareeServiceImpl implements DeclareeService {

	@Autowired
	private DeclareeDao dd;

	@Override
	public int declare(Declaree d) {
		return dd.declare(d);
	}
}
