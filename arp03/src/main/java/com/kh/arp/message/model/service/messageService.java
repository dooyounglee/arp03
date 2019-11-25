package com.kh.arp.message.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.arp.message.model.vo.Dto;
import com.kh.arp.message.model.vo.Message;

public interface messageService{
	
	// 1. 쪽지보내기용 서비스 
	int insertMsg(Message m);

	// 2. 받은 쪽지 리스트용 서비스
	ArrayList<Message> selectList(int m_no);
	
	// 3. 상세보기용 서비스 
	Message detailMsg(int ms_no);
	
	// 4. 보낸 쪽지 리스트용 
	ArrayList<Message> listSendMsg(int m_no);
	
	// 5. 수신확인용 리스트
	int updateDate(int m_no);
	
	// 6. 자동완성용 
	List<Dto> searchList(Dto dto);
	
	/*
	 * // 7. 회원번호 검색용 리스트 int selectMno(String name);
	 */
	
}
