package com.kh.arp.lecture.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.arp.lecture.model.vo.Attendence;
import com.kh.arp.lecture.model.vo.Classdate;
import com.kh.arp.lecture.model.vo.Exam;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.lecture.model.vo.MyClass;
import com.kh.arp.lecture.model.vo.Score;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.problem.model.vo.Homework;
import com.kh.arp.problem.model.vo.ProblemRelated;

public interface LectureService {

	Lecture getLecture(int lec_no);

	int makeLecture(Lecture lec);

	int insertClassdate(ArrayList<Classdate> list);

	Lecture getLastestLecture();

	List<Exam> getExamList(int lec_no);

	Exam makeExam(Exam e);

	Exam getExam(int e_no);

	int editExam(Exam e);

	List<MyClass> getStudentList(int lec_no);

	int insertScore(Score e);

	List<Score> getLectureScore(int lec_no);

	List<Classdate> getLectureDatesList(int lec_no);

	int insertAttendence(Attendence att);

	List<Attendence> getLectureAttendence(int lec_no);

	List<Homework> getHomeworkListInLecture(int lec_no);

	int addHomeworkInLecture(ProblemRelated hw_lec);

	int delHomeworkInLecture(ProblemRelated hw_lec);

}
