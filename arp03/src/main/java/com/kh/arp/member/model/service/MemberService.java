package com.kh.arp.member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.arp.board.model.vo.Board;
import com.kh.arp.member.model.vo.Auth;
import com.kh.arp.member.model.vo.Classdate;
import com.kh.arp.member.model.vo.Lecture;
import com.kh.arp.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);

	List<Lecture> getClassList();

	Lecture getLecture(int lec_no);

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

}
