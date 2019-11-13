package com.kh.arp.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.notice.model.vo.Notice;

@Repository
public class noticeDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	public int insertNotice(Notice n) {
	
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}


	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.getListCount");
	}


	public ArrayList<Notice> selectList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList");
	}


	public int updateCount(int n_no) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.updateCount" ,n_no);
	}


	public Notice selectNotice(int n_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectNotice", n_no);
	}

}
