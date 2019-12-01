package com.kh.arp.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.declaree.model.vo.Declaree;
import com.kh.arp.lecture.model.vo.Classdate;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.lecture.model.vo.MyClass;
import com.kh.arp.member.model.vo.Auth;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.qna.model.vo.Qna;

@Repository
public class MemberDao {

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
	
	public int declareBoard(Board b) {
		return sqlSession.update("adminMapper.declareBoard",b);
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
	
	public int declareReplyAdmin(BReply r) {
		return sqlSession.update("adminMapper.declareReplyAdmin",r);
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

	public List<Member> getStudentList() {
		return sqlSession.selectList("memberMapper.getStudentList",null);
	}

	public List<Member> getTeacherList() {
		return sqlSession.selectList("memberMapper.getTeacherList",null);
	}

	public List<Lecture> getLectureListByTeacher(int m_no) {
		return sqlSession.selectList("memberMapper.getLectureListByTeacher",m_no);
	}

	public List<Member> getIngStudentList(int lec_no) {
		return sqlSession.selectList("memberMapper.getIngStudentList",lec_no);
	}

	public List<Member> getOtherStudentList(int lec_no) {
		return sqlSession.selectList("memberMapper.getOtherStudentList",lec_no);
	}

	public int insertStudentToIng(MyClass mc) {
		return sqlSession.insert("memberMapper.insertStudentToIng",mc);
	}

	public int insertStudentToOther(MyClass mc) {
		return sqlSession.delete("memberMapper.insertStudentToOther",mc);
	}

	public List<Lecture> getLectureList(Member mem) {
		return sqlSession.selectList("memberMapper.getLectureList",mem);
	}

	public int acceptMember(Member mem) {
		return sqlSession.update("memberMapper.acceptMember",mem);
	}

	

	

}
