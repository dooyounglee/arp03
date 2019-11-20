package com.kh.arp.question.model.vo;

import lombok.Data;

@Data
public class QReply {
	// �������
	private int r_no;		// ��۹�ȣ
	private int lec_no;		// ���ǹ�ȣ
	private int q_no;		// �Խñ۹�ȣ
	private int m_no;		// ȸ����ȣ
	private String content;	// ����
	private String regdate;	// �ۼ�����
	private String update;	// ��������
	private String status;	// ����
}
