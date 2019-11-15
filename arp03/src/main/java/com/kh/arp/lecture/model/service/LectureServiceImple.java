package com.kh.arp.lecture.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.lecture.model.vo.Classdate;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.member.model.dao.MemberDao;

@Service
public class LectureServiceImple implements LectureService {

	@Autowired
	private MemberDao md;

	@Override
	public Lecture getLecture(int lec_no) {
		return md.getLecture(lec_no);
	}

	@Override
	public int makeLecture(Lecture lec) {
		return md.makeLecture(lec);
	}

	@Override
	public Lecture getLastestLecture() {
		return md.getLastestLecture();
	}

	@Override
	public int insertClassdate(ArrayList<Classdate> list) {
		return md.insertClassdate(list);
	}

}
