<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Sidebar scroll-->
<div class="scroll-sidebar">
    <!-- Sidebar navigation-->
    <nav class="sidebar-nav">
        <ul id="sidebarnav">
            <li class="nav-small-cap">PERSONAL</li>
            <c:if test="${!empty mem }">
            <li><a class="has-arrow" href="lectureList.ad"><span class="hide-menu">나의 강좌 리스트</span></a></li>
            </c:if>
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
                <a class="has-arrow aria-expanded="false"><i class="mdi mdi-bullseye"></i><span class="hide-menu">학생</span></a>
                <ul aria-expanded="false" class="collapse">
                    <li><a href="lectureList.ad">내 수강목록</a></li>
                    <li><a href="blist.do">자유 게시판</a></li>
                    <li><a href="mylist.qna">내 문의</a></li>
                    <li><a href="myInfo.me">내 정보</a></li>
                    <li><a href="myLlist.me">내 휴가</a></li>
                </ul>
            </li>
            <li class="one-column">
                <a class="has-arrow" aria-expanded="false"><i class="mdi mdi-chart-bubble"></i><span class="hide-menu">선생님</span></a>
                <ul aria-expanded="false" class="collapse">
                    <li><a href="lectureList.ad">내 수업목록</a></li>
                    <li><a href="blist.do">자유 게시판</a></li>
                    <li><a href="tblist.do">선생님 게시판</a></li>
                    
                    <c:if test="${ mem.typee eq 't' }">
						<a href="tblist.do">선생님 게시판</a>
					</c:if>
					<c:if test="${ mem.typee ne 't' }">
						<li><a onclick="no();">선생님 게시판</a></li>
					</c:if>
                    
                    <li><a href="mylist.qna">내 문의</a></li>
                    <li><a href="myInfo.me">내 정보</a></li>
                    <li><a href="mainMsg.do">쪽지함</a></li>
                    <li><a href="sVlist.te">학생휴가 관리</a></li>
                    <li><a href="ui-tooltip-popover.html">Tooltip &amp; Popover</a></li>
                    <li><a href="ui-notification.html">Notification</a></li>
                    <li><a href="ui-progressbar.html">Progressbar</a></li>
                    <li><a href="ui-typography.html">Typography</a></li>
                    <li><a href="ui-bootstrap.html">Bootstrap Ui</a></li>
                    <li><a href="ui-breadcrumb.html">Breadcrumb</a></li>
                    <li><a href="ui-bootstrap-switch.html">Bootstrap Switch</a></li>
                    <li><a href="ui-list-media.html">List Media</a></li>
                    <li><a href="ui-ribbons.html">Ribbons</a></li>
                    <li><a href="ui-grid.html">Grid</a></li>
                    <li><a href="ui-carousel.html">Carousel</a></li>
                    <li><a href="ui-nestable.html">Nestable</a></li>
                    <li><a href="ui-range-slider.html">Range slider</a></li>
                    <li><a href="ui-timeline.html">Timeline</a></li>
                    <li><a href="ui-horizontal-timeline.html">Horizontal Timeline</a></li>
                    <li><a href="ui-session-timeout.html">Session Timeout</a></li>
                    <li><a href="ui-session-ideal-timeout.html">Session Ideal Timeout</a></li>
                    <li><a href="ui-date-paginator.html">Date-paginator</a></li>
                    <li><a href="ui-dragable-portlet.html">Dragable Portlet</a></li>
                    <li><a href="ui-spinner.html">Spinner</a></li>
                    <li><a href="ui-scrollspy.html">Scrollspy</a></li>
                    <li><a href="ui-toasts.html">Toasts</a></li>
                </ul>
            </li>
            <li class="nav-devider"></li>
            <li class="nav-small-cap">FORMS, TABLE &amp; WIDGETS</li>
            <li class="two-column">
                <a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-file"></i><span class="hide-menu">매니저</span></a>
                <ul aria-expanded="false" class="collapse">
                    <li><a href="studentconsulting.ma">학생상담</a></li>
                    <li><a href="lectureList.ad">설문조사</a></li>
                    <li><a href="form-addons.html">Form Addons</a></li>
                    <li><a href="form-material.html">Form Material</a></li>
                    <li><a href="form-float-input.html">Floating Lable</a></li>
                    <li><a href="form-pickers.html">Form Pickers</a></li>
                    <li><a href="form-upload.html">File Upload</a></li>
                    <li><a href="form-mask.html">Form Mask</a></li>
                    <li><a href="form-validation.html">Form Validation</a></li>
                    <li><a href="form-dropzone.html">File Dropzone</a></li>
                    <li><a href="form-icheck.html">Icheck control</a></li>
                    <li><a href="form-img-cropper.html">Image Cropper</a></li>
                    <li><a href="form-bootstrapwysihtml5.html">HTML5 Editor</a></li>
                    <li><a href="form-typehead.html">Form Typehead</a></li>
                    <li><a href="form-wizard.html">Form Wizard</a></li>
                    <li><a href="form-xeditable.html">Xeditable Editor</a></li>
                    <li><a href="form-summernote.html">Summernote Editor</a></li>
                    <li><a href="form-tinymce.html">Tinymce Editor</a></li>
                </ul>
            </li>
            
            <li class="nav-devider"></li>
            <li class="nav-small-cap">EXTRA COMPONENTS</li>
            <li class="two-column">
                <a class="has-arrow " href="#" aria-expanded="false"><i class="mdi mdi-book-open-variant"></i><span class="hide-menu">관리자</span></a>
                <ul aria-expanded="false" class="collapse">
                    <li><a href="lectureList.ad">강좌관리</a></li>
                    <li><a href="boardList.ad">게시글 관리</a></li>
                    <li><a href="replyList.ad">댓글 관리</a></li>
                    <li><a href="qnaList.ad">문의관리</a></li>
                    <li><a href="declareList.ad">신고관리</a></li>
                    <li><a href="memberList.ad">회원관리</a></li>
                    <li><a href="vationList.ad">휴가관리</a></li>
                    <li><a href="nlist.ad">공지사항</a></li>
                    <li><a href="flist.ad">faq</a></li>
                    <li><a href="pages-scroll.html">Scrollbar</a></li>
                    <li><a href="pages-pricing.html">Pricing</a></li>
                    <li><a href="pages-lightbox-popup.html">Lighbox popup</a></li>
                    <li><a href="pages-gallery.html">Gallery</a></li>
                    <li><a href="pages-faq.html">Faqs</a></li>
                    <li><a href="#" class="has-arrow">Error Pages</a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="pages-error-400.html">400</a></li>
                            <li><a href="pages-error-403.html">403</a></li>
                            <li><a href="pages-error-404.html">404</a></li>
                            <li><a href="pages-error-500.html">500</a></li>
                            <li><a href="pages-error-503.html">503</a></li>
                        </ul>
                    </li>
                    <li><a href="#" class="has-arrow">Authentication <span class="label label-rounded label-success">6</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="pages-login.html">Login 1</a></li>
                            <li><a href="pages-login-2.html">Login 2</a></li>
                            <li><a href="pages-register.html">Register</a></li>
                            <li><a href="pages-register2.html">Register 2</a></li>
                            <li><a href="pages-lockscreen.html">Lockscreen</a></li>
                            <li><a href="pages-recover-password.html">Recover password</a></li>
                        </ul>
                    </li>
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