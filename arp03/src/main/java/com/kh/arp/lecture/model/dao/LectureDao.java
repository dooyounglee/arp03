package com.kh.arp.lecture.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.declaree.model.vo.Declaree;
import com.kh.arp.lecture.model.vo.Attendence;
import com.kh.arp.lecture.model.vo.Classdate;
import com.kh.arp.lecture.model.vo.Exam;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.lecture.model.vo.MyClass;
import com.kh.arp.lecture.model.vo.Score;
import com.kh.arp.lecture.model.vo.ScoreH;
import com.kh.arp.member.model.vo.Auth;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.problem.model.vo.Answer;
import com.kh.arp.problem.model.vo.Homework;
import com.kh.arp.problem.model.vo.ProblemRelated;
import com.kh.arp.qna.model.vo.Qna;

@Repository
public class LectureDao {

	@Autowired
	private SqlSession sqlSession;
	
	public Member login(Member m) {
		return sqlSession.selectOne("memberMapper.login",m);
	}

	public int join(Member m) {
		return sqlSession.update("memberMapper.join",m);
	}
	
	public List<Lecture> getClassList() {
		return sqlSession.selectList("lectureMapper.getClassList",null);
	}

	public Lecture getLecture(int lec_no) {
		return sqlSession.selectOne("lectureMapper.getLecture",lec_no);
	}

	public int makeLecture(Lecture lec) {
		return sqlSession.insert("lectureMapper.makeLecture",lec);
	}

	public List<Member> getMemberList() {
		return sqlSession.selectList("memberMapper.getMemberList",null);
	}

	public int banish(Member m) {
		return sqlSession.update("memberMapper.banish",m);
	}

	public int banishCancle(Member m) {
		return sqlSession.update("memberMapper.banishCancle",m);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public Auth getAuth(Auth auth) {
		return sqlSession.selectOne("memberMapper.getAuth",auth);
	}

	public Member getMember(Member mem) {
		return sqlSession.selectOne("memberMapper.getMember",mem);
	}

	public int insertAuth(Auth auth) {
		return sqlSession.insert("memberMapper.insertAuth",auth);
	}

	public int deleteAuth(String email) {
		return sqlSession.delete("memberMapper.deleteAuth",email);
	}

	public Lecture getLastestLecture() {
		return sqlSession.selectOne("lectureMapper.getLastestLecture",null);
	}

	public int insertClassdate(ArrayList<Classdate> list) {
		for(int i=0;i<list.size();i++) {
			sqlSession.insert("lectureMapper.insertClassdate",list.get(i));
		}
		return 1;
	}

	public List<Board> getBoardList() {
		return sqlSession.selectList("adminMapper.getBoardList",null);
	}

	public int deleteBoard(Board b) {
		return sqlSession.update("adminMapper.deleteBoard",b);
	}

	public int deleteCancleBoard(Board b) {
		return sqlSession.update("adminMapper.deleteCancleBoard",b);
	}

	public List<BReply> getReplyList() {
		return sqlSession.selectList("adminMapper.getReplyList",null);
	}

	public int deleteReply(BReply r) {
		return sqlSession.update("adminMapper.deleteReply",r);
	}

	public int deleteCancleReply(BReply r) {
		return sqlSession.update("adminMapper.deleteCancleReply",r);
	}

	public List<Declaree> getDeclareList() {
		return sqlSession.selectList("adminMapper.getDeclareList",null);
	}

	public int okDeclare(Declaree d) {
		return sqlSession.update("adminMapper.okDeclare",d);
	}

	public int update(Member m) {
		return sqlSession.update("memberMapper.update",m);
	}

	public Member find(Member m) {
		return sqlSession.selectOne("memberMapper.find",m);
	}

	public List<Qna> getQnaList() {
		return sqlSession.selectList("memberMapper.getQnaList",null);
	}

	public List<Exam> getExamList(int lec_no) {
		return sqlSession.selectList("lectureMapper.getExamList",lec_no);
	}
	
	public Exam makeExam(Exam e) {
		sqlSession.insert("lectureMapper.makeExam",e);
		return e;
	}

	public Exam getExam(int e_no) {
		return sqlSession.selectOne("lectureMapper.getExam",e_no);
	}

	public int editExam(Exam e) {
		return sqlSession.update("lectureMapper.editExam",e);
	}

	public List<MyClass> getStudentList(int lec_no) {
		return sqlSession.selectList("lectureMapper.getStudentList",lec_no);
	}

	public int isScore(Score s) {
		return sqlSession.selectOne("lectureMapper.isScore",s);
	}

	public int updateScore(Score s) {
		return sqlSession.update("lectureMapper.updateScore",s);
		
	}

	public int insertScore(Score s) {
		return sqlSession.insert("lectureMapper.insertScore",s);
	}

	public List<Score> getLectureScore(int lec_no) {
		return sqlSession.selectList("lectureMapper.getLectureScore",lec_no);
	}

	public List<Classdate> getLectureDatesList(int lec_no) {
		return sqlSession.selectList("lectureMapper.getLectureDatesList",lec_no);
	}

	public int isAttendence(Attendence att) {
		return sqlSession.selectOne("lectureMapper.isAttendence",att);
	}

	public int updateAttendence(Attendence att) {
		return sqlSession.update("lectureMapper.updateAttendence",att);
	}

	public int insertAttendence(Attendence att) {
		return sqlSession.insert("lectureMapper.insertAttendence",att);
	}

	public List<Attendence> getLectureAttendence(int lec_no) {
		return sqlSession.selectList("lectureMapper.getLectureAttendence",lec_no);
	}

	public List<Homework> getHomeworkListInLecture(int lec_no) {
		return sqlSession.selectList("lectureMapper.getHomeworkListInLecture",lec_no);
	}

	public int addHomeworkInLecture(ProblemRelated hw_lec) {
		return sqlSession.insert("lectureMapper.addHomeworkInLecture",hw_lec);
	}

	public int delHomeworkInLecture(ProblemRelated hw_lec) {
		return sqlSession.delete("lectureMapper.delHomeworkInLecture",hw_lec);
	}

	public int submitAnswer(Answer ans) {
		return sqlSession.insert("lectureMapper.submitAnswer",ans);
	}

	public List<ScoreH> getHomeworkScore(int lec_no) {
		return sqlSession.selectList("lectureMapper.getHomeworkScore",lec_no);
	}

	public int deleteLecture(Lecture lec) {
		return sqlSession.update("lectureMapper.deleteLecture",lec);
	}

	public int deleteLectureCancle(Lecture lec) {
		return sqlSession.update("lectureMapper.deleteLectureCancle",lec);
	}

	public List<Lecture> getlectureList(int m_no) {
		return sqlSession.selectList("lectureMapper.getlectureList",m_no);
	}

	public int acceptLecture(Lecture lec) {
		return sqlSession.update("lectureMapper.acceptLecture",lec);
	}

	public int rejectLecture(Lecture lec) {
		return sqlSession.update("lectureMapper.rejectLecture",lec);
	}

	public List<Homework> getHomeworkListInLectureForScore(int lec_no) {
		return sqlSession.selectOne("lectureMapper.getHomeworkListInLectureForScore",lec_no);
	}

	public List<Lecture> applylectureList(int m_no) {
		return sqlSession.selectList("lectureMapper.applylectureList",m_no);
	}

}
