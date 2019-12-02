package com.kh.arp.message.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.member.model.vo.Member;
import com.kh.arp.message.model.vo.Dto;
import com.kh.arp.message.model.vo.Message;

@Repository
public class messageDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertMsg(Message m) {
		return sqlSession.insert("msg-mapper.insertMsg",m);
	}
	
	public ArrayList<Message> selectList(int m_no){
		return (ArrayList)sqlSession.selectList("msg-mapper.selectList",m_no);
	}
	
	public Message detailMsg(int ms_no) {
		return sqlSession.selectOne("msg-mapper.detailMsg",ms_no);
	}
	
	public ArrayList<Message> listSendMsg(int m_no){
		/*
		 * int boardLimit = pi.getBoardLimit(); RowBounds rowBounds = new
		 * RowBounds(offset, boardLimit);
		 */
		return (ArrayList)sqlSession.selectList("msg-mapper.listSendMsg",m_no);
	}
	
	public int updateDate(int m_no) {
		return sqlSession.update("msg-mapper.updateDate",m_no);
	}
	
	public List<Dto> searchList(Dto name) {
		System.out.println("dao");
		return (List)sqlSession.selectList("msg-mapper.searchList",name);
	}
	
	public int selectMcount(int m_no) {
		return sqlSession.selectOne("msg-mapper.selectMcount",m_no);
	}
	
	public ArrayList<Message> selectNList(int m_no){
		return (ArrayList)sqlSession.selectList("msg-mapper.selectNList",m_no);
	}
	
	public int updateAlram(int m_no) {
		return sqlSession.update("msg-mapper.updateAlram",m_no);
	}
	
	public int getListCount(int m_no) {
		return sqlSession.selectOne("msg-mapper.getListCount",m_no);
	}
	
	public Message reSendMsgForm(int ms_no) {
		return sqlSession.selectOne("msg-mapper.reSendMsgForm",ms_no);
	}
	
	public ArrayList<Member> selectMember(){
		return (ArrayList)sqlSession.selectList("msg-mapper.selectMember");
	}
	
	
}
