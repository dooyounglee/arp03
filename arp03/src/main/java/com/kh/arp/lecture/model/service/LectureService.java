package com.kh.arp.lecture.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.arp.lecture.model.vo.Classdate;
import com.kh.arp.lecture.model.vo.Exam;
import com.kh.arp.lecture.model.vo.Lecture;

public interface LectureService {

	Lecture getLecture(int lec_no);

	int makeLecture(Lecture lec);

	int insertClassdate(ArrayList<Classdate> list);

	Lecture getLastestLecture();

	List<Exam> getExamList(int lec_no);

}
