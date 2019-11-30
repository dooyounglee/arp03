<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Sidebar scroll-->
<div class="scroll-sidebar">
    <!-- Sidebar navigation-->
    <nav class="sidebar-nav">
        <ul id="sidebarnav">
            <li class="nav-small-cap">PERSONAL</li>
            <li>
            	<c:if test="${!empty mem}">
            	<a class="has-arrow" onclick="location.href='lectureList.ad'" href="lectureList.ad"><span class="hide-menu">나의 강좌 리스트</span></a>
            	<c:if test="${mem.typee ne 'a' }">
            	<ul aria-expanded="false" class="collapse">
            		<c:forEach var="l" items="${myLec }">
                    	<li><a href="main.lec?lec_no=${l.lec_no }">${l.title }</a></li>
            		</c:forEach>
                </ul>
            	</c:if>
            	</c:if>
            </li>
            <li><a class="has-arrow" href="blist.do"><span class="hide-menu">자유게시판</span></a></li>
            <li><a class="has-arrow" href="nlist.ad"><span class="hide-menu">공지사항</span></a></li>
            <li><a class="has-arrow" href="flist.ad"><span class="hide-menu">FAQ</span></a></li>
            <c:if test="${!empty mem && mem.typee ne 'a' }">
            <li><a class="has-arrow" href="mylist.qna"><span class="hide-menu">내 문의</span></a></li>
            </c:if>
            <c:if test="${!empty mem && mem.typee ne 's' }">
            <li><a class="has-arrow" href="list.pro"><span class="hide-menu">문제관리</span></a></li>
            <li><a class="has-arrow" href="list.hw"><span class="hide-menu">숙제관리</span></a></li>
            </c:if>
            <li>
                <a class="has-arrow" href="#" aria-expanded="false"><i class=" mdi mdi-email"></i><span class="hide-menu">쪽지함</span></a>
                <ul aria-expanded="false" class="collapse">
                    <li><a href="listMsg.do">보낸 쪽지함</a></li>
                    <li><a href="listSendMsg.do">받은 쪽지함</a></li>
                </ul>
            </li>
            <li>
                <a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-bullseye"></i><span class="hide-menu">학생</span></a>
                <ul aria-expanded="false" class="collapse">
                    <li><a href="vlist.me">내 휴가</a></li>
                </ul>
            </li>
            <li class="nav-devider"></li>
            <li class="one-column">
                <a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bubble"></i><span class="hide-menu">선생님</span></a>
                <ul aria-expanded="false" class="collapse">
                    <li><a href="applyList.lec">신청 리스트</a></li>
                    <li><a href="tblist.do">선생님 게시판</a></li>
                    
                    <c:if test="${ mem.typee eq 't' }">
						<a href="tblist.do">선생님 게시판</a>
					</c:if>
					<c:if test="${ mem.typee ne 't' }">
						<li><a onclick="no();">선생님 게시판</a></li>
					</c:if>
                    
                    <li><a href="sVlist.te">학생휴가 관리</a></li>
                    <li><a href="calmain.ca">캘린더</a></li>
                </ul>
            </li>
            
            
            <li class="nav-devider"></li>
            <li class="nav-small-cap">EXTRA COMPONENTS</li>
            <li class="two-column">
                <a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-book-open-variant"></i><span class="hide-menu">관리자</span></a>
                <ul aria-expanded="false" class="collapse">
                    <li><a href="boardList.ad">게시글 관리</a></li>
                    <li><a href="replyList.ad">댓글 관리</a></li>
                    <li><a href="qnaList.ad">문의관리</a></li>
                    <li><a href="declareList.ad">신고관리</a></li>
                    <li><a href="memberList.ad">회원관리</a></li>
                    <li><a href="sVlist.ad">휴가관리</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <!-- End Sidebar navigation -->
</div>
<!-- End Sidebar scroll-->

<script>
	function no(){
		alert("선생님만 이용가능한 게시판입니다.");
	
	}
</script>