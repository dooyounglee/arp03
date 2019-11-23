package com.kh.arp.problem.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arp.problem.model.vo.Homework;
import com.kh.arp.problem.model.vo.Problem;
import com.kh.arp.problem.model.vo.ProblemRelated;
import com.kh.arp.problem.model.vo.Variables;

@Repository
public class ProblemDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Problem> getProblemList() {
		return sqlSession.selectList("problemMapper.getProblemList",null);
	}
	
	public int makeProblem(Problem p) {
		return sqlSession.insert("problemMapper.makeProblem",p);
	}

	public Problem getProblem(int p_no) {
		return sqlSession.selectOne("problemMapper.getProblem",p_no);
	}

	public List<Variables> getVariables(int p_no) {
		return sqlSession.selectList("problemMapper.getVariables",p_no);
	}

	public int editProblem(Problem p) {
		return sqlSession.update("problemMapper.editProblem",p);
	}

	public int okVariables(Variables v) {
		return sqlSession.insert("problemMapper.okVariables",v);
	}

	public int delVariables(Variables v) {
		return sqlSession.delete("problemMapper.delVariables",v);
	}

	public int editVariables(Variables v) {
		return sqlSession.update("problemMapper.editVariables",v);
	}

	public int makeHomework(Homework hw) {
		return sqlSession.insert("problemMapper.makeHomework",hw);
	}

	public Homework getHomework(int hw_no) {
		return sqlSession.selectOne("problemMapper.getHomework",hw_no);
	}

	public List<Homework> getHomeworkList(int m_no) {
		return sqlSession.selectList("problemMapper.getHomeworkList",m_no);
	}

	public int insertProblemInHomework(ProblemRelated hw_p) {
		return sqlSession.insert("problemMapper.insertProblemInHomework",hw_p);
	}

	public int deleteProblemInHomework(ProblemRelated hw_p) {
		return sqlSession.delete("problemMapper.deleteProblemInHomework",hw_p);
	}

	public List<Problem> getProblemListInHomework(int hw_no) {
		return sqlSession.selectList("problemMapper.getProblemListInHomework",hw_no);
	}


}
