package com.kh.arp.problem.model.service;

import java.util.List;

import com.kh.arp.problem.model.vo.Answer;
import com.kh.arp.problem.model.vo.Homework;
import com.kh.arp.problem.model.vo.Problem;
import com.kh.arp.problem.model.vo.ProblemRelated;
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

	int makeHomework(Homework hw);

	Homework getHomework(int hw_no);

	List<Homework> getHomeworkList(int m_no);

	int insertProblemInHomework(ProblemRelated hw_p);

	int deleteProblemInHomework(ProblemRelated hw_p);

	List<Problem> getProblemListInHomework(int hw_no);

	//List<Homework> teacherHomeworkList(int m_no);

	List<Answer> getHomeworkAnswer(ProblemRelated lec_hw_m);

	int delProblem(int p_no);

}
