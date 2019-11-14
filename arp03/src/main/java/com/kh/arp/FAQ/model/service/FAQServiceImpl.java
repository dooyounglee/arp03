package com.kh.arp.FAQ.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.FAQ.model.dao.FAQdao;
import com.kh.arp.FAQ.model.vo.FAQ;

@Service	
public class FAQServiceImpl implements FAQService {

	@Autowired
	private FAQdao fDao;
	
	@Override
	public int insertFAQ(FAQ f) {
		// TODO Auto-generated method stub
		return fDao.insertFAQ(f);
	}

	@Override
	public ArrayList<FAQ> selectList() {
		// TODO Auto-generated method stub
		return fDao.selectList();
	}

	@Override
	public int deleteFAQ(int faq_no) {
		// TODO Auto-generated method stub
		return fDao.deleteFAQ(faq_no);
	}

}
