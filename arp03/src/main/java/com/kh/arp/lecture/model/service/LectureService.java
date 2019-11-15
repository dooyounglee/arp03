package com.kh.arp.lecture.model.service;

import java.util.ArrayList;

import com.kh.arp.lecture.model.vo.Classdate;
import com.kh.arp.lecture.model.vo.Lecture;

public interface LectureService {

	Lecture getLecture(int lec_no);

	int makeLecture(Lecture lec);

	int insertClassdate(ArrayList<Classdate> list);

	Lecture getLastestLecture();

}
