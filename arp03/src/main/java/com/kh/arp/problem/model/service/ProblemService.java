package com.kh.arp.problem.model.service;

import java.util.List;

import com.kh.arp.problem.model.vo.Problem;
import com.kh.arp.problem.model.vo.Variables;

public interface ProblemService {

	int makeProblem(Problem p);

	Problem getProblem(int p_no);

	List<Problem> getProblemList();

	List<Variables> getVariables(int p_no);

	int editProblem(Problem p);

	int okVariables(Variables v);

	int delVariables(Variables v);

	int editVariables(Variables v);

}
