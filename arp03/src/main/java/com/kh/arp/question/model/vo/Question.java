package com.kh.arp.question.model.vo;

import lombok.Data;

@Data
public class Question {
	// �����Խ���
	private int q_no;				// ������ȣ
	private int lec_no;				// ���ǹ�ȣ
	private int m_no;				// ȸ����ȣ
	private String title;			// ����
	private String content;			// ����
	private String regdate;			// �ۼ�����
	private String update;			// ��������
	private String status;			// ����
	private int vcount;				// ��ȸ��
	private int dcount;				// �Ű���
	private int rcount;				// ��ۼ�
	private String isreply;			// �亯����
	private String replydate;		// ������¥
	private String replycontent;	// �亯����
	private String isdelete;		// ��������

}