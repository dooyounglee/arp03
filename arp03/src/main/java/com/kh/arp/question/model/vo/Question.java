package com.kh.arp.question.model.vo;

import lombok.Data;

@Data
public class Question {
	
	private int q_no;				// ������ȣ
	private int lec_no;				// ���ǹ�ȣ
	private int m_no;				// ȸ����ȣ
	private String title;			// ����
	private String content;			// ����
	private String regdate;			// �ۼ�����
	private String updatedate;			// ��������
	private String status;			// ����
	private int vcount;				// ��ȸ��
	private int dcount;				// �Ű��
	private int rcount;				// ��ۼ�
	private String isreply;			// �亯����
	private String replydate;		// ������¥
	private String replycontent;	// �亯����
	private String isdelete;		// ��������
	private String name;	// 학생이름 /join하느라 필요해서 필드명추가함
	private String fileox;	// 첨부파일여부 추가함
	private String originalname;
	private String changename;
	private String tcname;	// 선생님이름
	private String youtubelink;
}
