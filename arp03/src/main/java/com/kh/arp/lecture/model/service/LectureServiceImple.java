package com.kh.arp.lecture.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.lecture.model.dao.LectureDao;
import com.kh.arp.lecture.model.vo.Classdate;
import com.kh.arp.lecture.model.vo.Exam;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.lecture.model.vo.MyClass;
import com.kh.arp.lecture.model.vo.Score;
import com.kh.arp.member.model.dao.MemberDao;
import com.kh.arp.member.model.vo.Member;

@Service
public class LectureServiceImple implements LectureService {

	@Autowired
	private MemberDao md;
	
	@Autowired
	private LectureDao ld;

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

	@Override
	public List<Exam> getExamList(int lec_no) {
		return ld.getExamList(lec_no);
	}

	@Override
	public Exam makeExam(Exam e) {
		return ld.makeExam(e);
	}

	@Override
	public Exam getExam(int e_no) {
		return ld.getExam(e_no);
	}

	@Override
	public int editExam(Exam e) {
		return ld.editExam(e);
	}

	@Override
	public List<MyClass> getStudentList(int lec_no) {
		return ld.getStudentList(lec_no);
	}

	@Override
	public int insertScore(Score s) {
		int result=ld.isScore(s);
		if(result>0) {
			ld.updateScore(s);
		}else {
			ld.insertScore(s);
		}
		return 0;
	}

	@Override
	public List<Score> getLectureScore(int lec_no) {
		return ld.getLectureScore(lec_no);
	}

	@Override
	public List<Classdate> getLectureDatesList(int lec_no) {
		return ld.getLectureDatesList(lec_no);
	}

}
