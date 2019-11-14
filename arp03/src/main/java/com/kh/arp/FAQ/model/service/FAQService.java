package com.kh.arp.FAQ.model.service;

import java.util.ArrayList;

import com.kh.arp.FAQ.model.vo.FAQ;

public interface FAQService {

	// faq 작성용 메소드
	int insertFAQ(FAQ f);

	// faq 리스트
	ArrayList<FAQ> selectList();

	// faq 삭제
	int deleteFAQ(int faq_no);

	// 카테고리 선택
	ArrayList<FAQ> selectCategory(String category);

}
