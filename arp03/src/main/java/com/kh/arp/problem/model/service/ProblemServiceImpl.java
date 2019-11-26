package com.kh.arp.problem.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.problem.model.dao.ProblemDao;
import com.kh.arp.problem.model.vo.Answer;
import com.kh.arp.problem.model.vo.Homework;
import com.kh.arp.problem.model.vo.Problem;
import com.kh.arp.problem.model.vo.ProblemRelated;
import com.kh.arp.problem.model.vo.Variables;

@Service
public class ProblemServiceImpl implements ProblemService {

	@Autowired
	private ProblemDao pd;
	
	@Override
	public List<Problem> getProblemList() {
		return pd.getProblemList();
	}
	
	@Override
	public int makeProblem(Problem p) {
		return pd.makeProblem(p);
	}

	@Override
	public Problem getProblem(int p_no) {
		return pd.getProblem(p_no);
	}

	@Override
	public List<Variables> getVariables(int p_no) {
		return pd.getVariables(p_no);
	}

	@Override
	public int editProblem(Problem p) {
		return pd.editProblem(p);
	}

	@Override
	public int okVariables(Variables v) {
		return pd.okVariables(v);
	}

	@Override
	public int delVariables(Variables v) {
		return pd.delVariables(v);
	}

	@Override
	public int editVariables(Variables v) {
		return pd.editVariables(v);
	}

	@Override
	public int makeHomework(Homework hw) {
		return pd.makeHomework(hw);
	}

	@Override
	public Homework getHomework(int hw_no) {
		return pd.getHomework(hw_no);
	}

	@Override
	public List<Homework> getHomeworkList(int m_no) {
		return pd.getHomeworkList(m_no);
	}

	@Override
	public int insertProblemInHomework(ProblemRelated hw_p) {
		return pd.insertProblemInHomework(hw_p);
	}

	@Override
	public int deleteProblemInHomework(ProblemRelated hw_p) {
		return pd.deleteProblemInHomework(hw_p);
	}

	@Override
	public List<Problem> getProblemListInHomework(int hw_no) {
		return pd.getProblemListInHomework(hw_no);
	}

	@Override
	public List<Answer> getHomeworkAnswer(ProblemRelated lec_hw_m) {
		return pd.getHomeworkAnswer(lec_hw_m);
	}

	@Override
	public int delProblem(int p_no) {
		return pd.delProblem(p_no);
	}

	@Override
	public int endHomework(ProblemRelated lec_hw) {
		return pd.endHomework(lec_hw);
	}


}
