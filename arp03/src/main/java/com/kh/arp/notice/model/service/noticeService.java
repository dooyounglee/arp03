package com.kh.arp.notice.model.service;

import java.util.ArrayList;

import com.kh.arp.common.PageInfo;
import com.kh.arp.notice.model.vo.Notice;

public interface noticeService {
	
	// 공지사항 총 갯수 조회용 서비스
	int getListCount();
	
	// 현재 페이지에 보여질 공지사항 리스트 조회
	ArrayList<Notice> selectList();
	
	// 공지사항 작성용 
	int insertNotice(Notice n);

	// 공지사항 상세보기
	Notice selectNotice(int n_no);

	// 공지사항 수정하기
	int updateNotice(Notice n);

	// 수정하기 폼
	Notice updateNoticeForm(int n_no);

	// 공지사항 삭제
	int deleteNotice(int n_no);
	
	
}
