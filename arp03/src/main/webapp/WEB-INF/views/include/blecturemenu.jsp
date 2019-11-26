<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-lg-2 col-xlg-2 col-md-2">
    <div class="stickyside">
        <div class="list-group" id="top-menu">
            <a href="main.lec?lec_no=${lec.lec_no }" class="list-group-item">메인</a>
            <a href="question.qu" class="list-group-item">질문게시판</a>
            <a href="info.lec" class="list-group-item">강의계획</a>
            <a href="list.at" class="list-group-item">내 출석</a>
            <a href="list.sc" class="list-group-item">내 점수</a>
            <a href="homeworklist.lec" class="list-group-item">숙제</a>
            <a href="selectsurvey.ma" class="list-group-item">설문조사하러가기</a>
            <a href="#5" class="list-group-item">--------</a>
            <c:if test="${mem.typee eq 't' && lec.m_no eq mem.m_no }">
            <a href="list.ex" class="list-group-item">시험관리</a>
            <a href="list.at" class="list-group-item">출석관리</a>
            <a href="list.sc" class="list-group-item">점수관리</a>
            <a href="homeworklist.lec" class="list-group-item">숙제관리</a>
            <a href="selectsurvey.ma" class="list-group-item">설문조사만들기</a>
            <a href="#10" class="list-group-item">Title will be 10</a>
            </c:if>
        </div>
    </div>
</div>