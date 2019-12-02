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
	
	// 7. 메세지 카운트용 
	int selectMcount(int m_no);
	
	// 8. 상단바 리스트용 
	ArrayList<Message> selectNList(int m_no);
	
	// 9. 알람상태 변경용
	int updateAlram(int m_no);
	
	// 10.리스트 개수 
	int getListCount(int m_no);
	
	// 11.답장보내기용 서비스 
	Message reSendMsgForm(int ms_no);
}
