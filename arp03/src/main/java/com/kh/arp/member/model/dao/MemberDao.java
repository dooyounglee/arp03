package com.kh.arp.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.member.model.vo.Auth;
import com.kh.arp.member.model.vo.Classdate;
import com.kh.arp.member.model.vo.Lecture;
import com.kh.arp.member.model.vo.Member;

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

}