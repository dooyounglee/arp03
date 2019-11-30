package com.kh.arp.member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.declaree.model.vo.Declaree;
import com.kh.arp.lecture.model.vo.Classdate;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.lecture.model.vo.MyClass;
import com.kh.arp.member.model.vo.Auth;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.qna.model.vo.Qna;

public interface MemberService {

	Member login(Member m);

	List<Lecture> getClassList();

	int makeLecture(Lecture lec);

	int join(Member m);

	List<Member> getMemberList();

	int banish(Member m);

	int banishCancle(Member m);

	int insertMember(Member m);

	Auth getAuth(Auth auth);

	Member getMember(Member mem);

	int insertAuth(Auth auth);

	int deleteAuth(String email);

	int insertClassdate(ArrayList<Classdate> list);

	Lecture getLastestLecture();

	List<Board> getBoardList();

	int deleteBoard(Board b);

	int deleteCancleBoard(Board b);

	List<BReply> getReplyList();

	int deleteReply(BReply r);

	int deleteCancleReply(BReply r);
	
	int declareReplyAdmin(BReply r);

	List<Declaree> getDeclareList();

	int okDeclare(Declaree d);

	int update(Member m);

	Member find(Member m);

	List<Qna> getQnaList();

	List<Member> getStudentList();

	List<Member> getTeacherList();

	List<Lecture> getLectureListByTeacher(int m_no);

	List<Member> getIngStudentList(int lec_no);

	List<Member> getOtherStudentList(int lec_no);

	int insertStudentToIng(MyClass mc);

	int insertStudentToOther(MyClass mc);

	List<Lecture> getLectureList(Member mem);

	int acceptMember(Member mem);

	

}
