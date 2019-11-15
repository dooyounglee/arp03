package com.kh.arp.member.model.service;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.declaree.model.vo.Declaree;
import com.kh.arp.member.model.dao.MemberDao;
import com.kh.arp.member.model.vo.Auth;
import com.kh.arp.member.model.vo.Classdate;
import com.kh.arp.member.model.vo.Lecture;
import com.kh.arp.member.model.vo.Member;

@Service
public class MemberServiceImple implements MemberService {

	@Autowired
	private MemberDao md;
	
	@Override
	public Member login(Member m) {
		return md.login(m);
	}

	@Override
	public List<Lecture> getClassList() {
		return md.getClassList();
	}

	@Override
	public Lecture getLecture(int lec_no) {
		return md.getLecture(lec_no);
	}

	@Override
	public int makeLecture(Lecture lec) {
		return md.makeLecture(lec);
	}

	@Override
	public int join(Member m) {
		return md.join(m);
	}

	@Override
	public List<Member> getMemberList() {
		return md.getMemberList();
	}

	@Override
	public int banish(Member m) {
		return md.banish(m);
	}

	@Override
	public int banishCancle(Member m) {
		return md.banishCancle(m);
	}

	@Override
	public int insertMember(Member m) {
		return md.insertMember(m);
	}

	@Override
	public Auth getAuth(Auth auth) {
		return md.getAuth(auth);
	}

	@Override
	public Member getMember(Member mem) {
		return md.getMember(mem);
	}

	@Override
	public int insertAuth(Auth auth) {
		return md.insertAuth(auth);
	}

	@Override
	public int deleteAuth(String email) {
		return md.deleteAuth(email);
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
	public List<Board> getBoardList() {
		return md.getBoardList();
	}

	@Override
	public int deleteBoard(Board b) {
		return md.deleteBoard(b);
	}

	@Override
	public int deleteCancleBoard(Board b) {
		return md.deleteCancleBoard(b);
	}

	@Override
	public List<BReply> getReplyList() {
		return md.getReplyList();
	}

	@Override
	public int deleteReply(BReply r) {
		return md.deleteReply(r);
	}

	@Override
	public int deleteCancleReply(BReply r) {
		return md.deleteCancleReply(r);
	}

	@Override
	public List<Declaree> getDeclareList() {
		return md.getDeclareList();
	}

	@Override
	public int okDeclare(Declaree d) {
		return md.okDeclare(d);
	}

	@Override
	public int update(Member m) {
		return md.update(m);
	}

	@Override
	public Member find(Member m) {
		return md.find(m);
	}

}
