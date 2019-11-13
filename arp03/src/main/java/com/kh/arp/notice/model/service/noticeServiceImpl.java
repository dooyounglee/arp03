package com.kh.arp.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.common.PageInfo;
import com.kh.arp.notice.model.dao.noticeDao;
import com.kh.arp.notice.model.vo.Notice;

@Service
public class noticeServiceImpl implements noticeService{

	@Autowired
	private noticeDao nDao;
	
	@Override
	public int insertNotice(Notice n) {
		
		return nDao.insertNotice(n);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return nDao.getListCount();
	}

	@Override
	public ArrayList<Notice> selectList() {
		// TODO Auto-generated method stub
		return nDao.selectList();
	}

	@Override
	public Notice selectNotice(int n_no) {
		// TODO Auto-generated method stub
		
		int result = nDao.updateCount(n_no);
		
		if(result>0) {
			return nDao.selectNotice(n_no);
		}else {
			return null;
		}
		
	
	}



}
