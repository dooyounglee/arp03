package com.kh.arp.lecture.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.lecture.model.dao.LectureDao;
import com.kh.arp.lecture.model.vo.Attendence;
import com.kh.arp.lecture.model.vo.Classdate;
import com.kh.arp.lecture.model.vo.Exam;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.lecture.model.vo.MyClass;
import com.kh.arp.lecture.model.vo.Score;
import com.kh.arp.lecture.model.vo.ScoreH;
import com.kh.arp.member.model.dao.MemberDao;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.problem.model.vo.Answer;
import com.kh.arp.problem.model.vo.Homework;
import com.kh.arp.problem.model.vo.ProblemRelated;

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

	@Override
	public int insertAttendence(Attendence att) {
		int result=ld.isAttendence(att);
		if(result>0) {
			ld.updateAttendence(att);
		}else {
			ld.insertAttendence(att);
		}
		return 0;
	}

	@Override
	public List<Attendence> getLectureAttendence(int lec_no) {
		return ld.getLectureAttendence(lec_no);
	}

	@Override
	public List<Homework> getHomeworkListInLecture(int lec_no) {
		return ld.getHomeworkListInLecture(lec_no);
	}

	@Override
	public int addHomeworkInLecture(ProblemRelated hw_lec) {
		return ld.addHomeworkInLecture(hw_lec);
	}

	@Override
	public int delHomeworkInLecture(ProblemRelated hw_lec) {
		return ld.delHomeworkInLecture(hw_lec);
	}

	@Override
	public int submitAnswer(Answer ans) {
		return ld.submitAnswer(ans);
	}

	@Override
	public List<ScoreH> getHomeworkScore(int lec_no) {
		return ld.getHomeworkScore(lec_no);
	}

	@Override
	public int deleteLecture(Lecture lec) {
		return ld.deleteLecture(lec);
	}

	@Override
	public int deleteLectureCancle(Lecture lec) {
		return ld.deleteLectureCancle(lec);
	}

	@Override
	public List<Lecture> getlectureList(int m_no) {
		return ld.getlectureList(m_no);
	}

	@Override
	public int acceptLecture(Lecture lec) {
		return ld.acceptLecture(lec);
	}

	@Override
	public int rejectLecture(Lecture lec) {
		return ld.rejectLecture(lec);
	}

}
