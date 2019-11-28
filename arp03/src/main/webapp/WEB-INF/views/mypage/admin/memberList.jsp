<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../include/bhead.jsp"%>
	<!-- CSS Here -->
	<link rel="stylesheet" type="text/css" href="/arp/resources/material-pro/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
	<!-- Javascript Here -->
	<script src="/arp/resources/material-pro/assets/plugins/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="/arp/resources/material-pro/assets/plugins/datatables.net-bs4/js/dataTables.responsive.min.js"></script>
</head>
<body class="fix-header card-no-border logo-center">

		<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../../include/bsidebar.jsp" %>
        </aside>
        <!-- End of Left-sidebar -->

		<!-- Page wrapper  -->
        <div class="page-wrapper">
        
        
        	<!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Forms</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Form</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>THIS MONTH</small></h6>
                                    <h4 class="mt-0 text-info">$58,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="monthchart"></div>
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>LAST MONTH</small></h6>
                                    <h4 class="mt-0 text-primary">$48,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="lastmonthchart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">회원관리</h4>
                                <a class="btn btn-success float-right" href="insertMemberToLecture.ad">회원을 강좌로 넣기</a>
                                <h6 class="card-subtitle"><a class="btn btn-success" href="insertMember.ad">회원등록</a></code></h6>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>email</th>
                                                <th>phone</th>
                                                <th>Role</th>
                                                <th>강퇴</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="m" items="${list }">
                                        		<tr>
	                                        		<td>${m.m_no }</td>
	                                                <td><a href="DetailStudent.ad?m_no=${m.m_no }">${m.name }</a></td>
	                                                <td>${m.email }</td>
	                                                <td>${m.phone }</td>
	                                                <td>
	                                                	<c:if test="${m.typee eq 'a'}">
	                                                		<span class="badge badge-danger">admin</span>
	                                                	</c:if>
	                                                	<c:if test="${m.typee eq 's'}">
	                                                		<span class="badge badge-info">member</span>
	                                                	</c:if>
	                                                	<c:if test="${m.typee eq 't'}">
	                                                		<span class="badge badge-warning">teacher</span>
	                                                	</c:if>
	                                                	<c:if test="${m.typee eq 'm'}">
	                                                		<span class="badge badge-success">manager</span>
	                                                	</c:if>
	                                                </td>
	                                                <td>
	                                                	<c:if test="${m.status eq 'Y'}">
	                                                		<button class="btn btn-danger" onclick="banish(${m.m_no})">강퇴</button>
	                                                	</c:if>
	                                                	<c:if test="${m.status eq 'N'}">
	           	                                     		<button class="btn btn-primary" onclick="banishCancle(${m.m_no})">강퇴취소</button>
	                                                	</c:if>
	                                                	<c:if test="${m.status eq 'A'}">
	                                                		유저가 인증하기 전
	           	                                     		<%-- <button class="btn btn-primary" onclick="accept(${m.m_no})">승인</button> --%>
	                                                	</c:if>
	                                                </td>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">회원관리</h4>
                                <a class="btn btn-success float-right" href="insertMemberToLecture.ad">회원을 강좌로 넣기</a>
                                <h6 class="card-subtitle"><a class="btn btn-success" href="insertMember.ad">회원등록</a></code></h6>
                                <div class="table-responsive">
								    <table id="zero_config" class="table table-striped table-bordered no-wrap">
								        <thead>
								            <tr>
								                <th>Name</th>
								                <th>Position</th>
								                <th>Office</th>
								                <th>Age</th>
								                <th>Start date</th>
								                <th>Salary</th>
								            </tr>
								        </thead>
								        <tbody>
								            <tr>
								                <td>Tiger Nixon</td>
								                <td>System Architect</td>
								                <td>Edinburgh</td>
								                <td>61</td>
								                <td>2011/04/25</td>
								                <td>$320,800</td>
								            </tr>
								            <tr>
								                <td>Garrett Winters</td>
								                <td>Accountant</td>
								                <td>Tokyo</td>
								                <td>63</td>
								                <td>2011/07/25</td>
								                <td>$170,750</td>
								            </tr>
								            <tr>
								                <td>Ashton Cox</td>
								                <td>Junior Technical Author</td>
								                <td>San Francisco</td>
								                <td>66</td>
								                <td>2009/01/12</td>
								                <td>$86,000</td>
								            </tr>
								            <tr>
								                <td>Cedric Kelly</td>
								                <td>Senior Javascript Developer</td>
								                <td>Edinburgh</td>
								                <td>22</td>
								                <td>2012/03/29</td>
								                <td>$433,060</td>
								            </tr>
								            <tr>
								                <td>Airi Satou</td>
								                <td>Accountant</td>
								                <td>Tokyo</td>
								                <td>33</td>
								                <td>2008/11/28</td>
								                <td>$162,700</td>
								            </tr>
								            <tr>
								                <td>Brielle Williamson</td>
								                <td>Integration Specialist</td>
								                <td>New York</td>
								                <td>61</td>
								                <td>2012/12/02</td>
								                <td>$372,000</td>
								            </tr>
								            <tr>
								                <td>Herrod Chandler</td>
								                <td>Sales Assistant</td>
								                <td>San Francisco</td>
								                <td>59</td>
								                <td>2012/08/06</td>
								                <td>$137,500</td>
								            </tr>
								            <tr>
								                <td>Rhona Davidson</td>
								                <td>Integration Specialist</td>
								                <td>Tokyo</td>
								                <td>55</td>
								                <td>2010/10/14</td>
								                <td>$327,900</td>
								            </tr>
								            <tr>
								                <td>Colleen Hurst</td>
								                <td>Javascript Developer</td>
								                <td>San Francisco</td>
								                <td>39</td>
								                <td>2009/09/15</td>
								                <td>$205,500</td>
								            </tr>
								            <tr>
								                <td>Sonya Frost</td>
								                <td>Software Engineer</td>
								                <td>Edinburgh</td>
								                <td>23</td>
								                <td>2008/12/13</td>
								                <td>$103,600</td>
								            </tr>
								            <tr>
								                <td>Jena Gaines</td>
								                <td>Office Manager</td>
								                <td>London</td>
								                <td>30</td>
								                <td>2008/12/19</td>
								                <td>$90,560</td>
								            </tr>
								            <tr>
								                <td>Quinn Flynn</td>
								                <td>Support Lead</td>
								                <td>Edinburgh</td>
								                <td>22</td>
								                <td>2013/03/03</td>
								                <td>$342,000</td>
								            </tr>
								            <tr>
								                <td>Charde Marshall</td>
								                <td>Regional Director</td>
								                <td>San Francisco</td>
								                <td>36</td>
								                <td>2008/10/16</td>
								                <td>$470,600</td>
								            </tr>
								            <tr>
								                <td>Haley Kennedy</td>
								                <td>Senior Marketing Designer</td>
								                <td>London</td>
								                <td>43</td>
								                <td>2012/12/18</td>
								                <td>$313,500</td>
								            </tr>
								            <tr>
								                <td>Tatyana Fitzpatrick</td>
								                <td>Regional Director</td>
								                <td>London</td>
								                <td>19</td>
								                <td>2010/03/17</td>
								                <td>$385,750</td>
								            </tr>
								            <tr>
								                <td>Michael Silva</td>
								                <td>Marketing Designer</td>
								                <td>London</td>
								                <td>66</td>
								                <td>2012/11/27</td>
								                <td>$198,500</td>
								            </tr>
								            <tr>
								                <td>Paul Byrd</td>
								                <td>Chief Financial Officer (CFO)</td>
								                <td>New York</td>
								                <td>64</td>
								                <td>2010/06/09</td>
								                <td>$725,000</td>
								            </tr>
								            <tr>
								                <td>Gloria Little</td>
								                <td>Systems Administrator</td>
								                <td>New York</td>
								                <td>59</td>
								                <td>2009/04/10</td>
								                <td>$237,500</td>
								            </tr>
								            <tr>
								                <td>Bradley Greer</td>
								                <td>Software Engineer</td>
								                <td>London</td>
								                <td>41</td>
								                <td>2012/10/13</td>
								                <td>$132,000</td>
								            </tr>
								            <tr>
								                <td>Dai Rios</td>
								                <td>Personnel Lead</td>
								                <td>Edinburgh</td>
								                <td>35</td>
								                <td>2012/09/26</td>
								                <td>$217,500</td>
								            </tr>
								            <tr>
								                <td>Jenette Caldwell</td>
								                <td>Development Lead</td>
								                <td>New York</td>
								                <td>30</td>
								                <td>2011/09/03</td>
								                <td>$345,000</td>
								            </tr>
								            <tr>
								                <td>Yuri Berry</td>
								                <td>Chief Marketing Officer (CMO)</td>
								                <td>New York</td>
								                <td>40</td>
								                <td>2009/06/25</td>
								                <td>$675,000</td>
								            </tr>
								            <tr>
								                <td>Caesar Vance</td>
								                <td>Pre-Sales Support</td>
								                <td>New York</td>
								                <td>21</td>
								                <td>2011/12/12</td>
								                <td>$106,450</td>
								            </tr>
								            <tr>
								                <td>Doris Wilder</td>
								                <td>Sales Assistant</td>
								                <td>Sidney</td>
								                <td>23</td>
								                <td>2010/09/20</td>
								                <td>$85,600</td>
								            </tr>
								            <tr>
								                <td>Angelica Ramos</td>
								                <td>Chief Executive Officer (CEO)</td>
								                <td>London</td>
								                <td>47</td>
								                <td>2009/10/09</td>
								                <td>$1,200,000</td>
								            </tr>
								            <tr>
								                <td>Gavin Joyce</td>
								                <td>Developer</td>
								                <td>Edinburgh</td>
								                <td>42</td>
								                <td>2010/12/22</td>
								                <td>$92,575</td>
								            </tr>
								            <tr>
								                <td>Jennifer Chang</td>
								                <td>Regional Director</td>
								                <td>Singapore</td>
								                <td>28</td>
								                <td>2010/11/14</td>
								                <td>$357,650</td>
								            </tr>
								            <tr>
								                <td>Brenden Wagner</td>
								                <td>Software Engineer</td>
								                <td>San Francisco</td>
								                <td>28</td>
								                <td>2011/06/07</td>
								                <td>$206,850</td>
								            </tr>
								            <tr>
								                <td>Fiona Green</td>
								                <td>Chief Operating Officer (COO)</td>
								                <td>San Francisco</td>
								                <td>48</td>
								                <td>2010/03/11</td>
								                <td>$850,000</td>
								            </tr>
								            <tr>
								                <td>Shou Itou</td>
								                <td>Regional Marketing</td>
								                <td>Tokyo</td>
								                <td>20</td>
								                <td>2011/08/14</td>
								                <td>$163,000</td>
								            </tr>
								            <tr>
								                <td>Michelle House</td>
								                <td>Integration Specialist</td>
								                <td>Sidney</td>
								                <td>37</td>
								                <td>2011/06/02</td>
								                <td>$95,400</td>
								            </tr>
								            <tr>
								                <td>Suki Burks</td>
								                <td>Developer</td>
								                <td>London</td>
								                <td>53</td>
								                <td>2009/10/22</td>
								                <td>$114,500</td>
								            </tr>
								            <tr>
								                <td>Prescott Bartlett</td>
								                <td>Technical Author</td>
								                <td>London</td>
								                <td>27</td>
								                <td>2011/05/07</td>
								                <td>$145,000</td>
								            </tr>
								            <tr>
								                <td>Gavin Cortez</td>
								                <td>Team Leader</td>
								                <td>San Francisco</td>
								                <td>22</td>
								                <td>2008/10/26</td>
								                <td>$235,500</td>
								            </tr>
								            <tr>
								                <td>Martena Mccray</td>
								                <td>Post-Sales support</td>
								                <td>Edinburgh</td>
								                <td>46</td>
								                <td>2011/03/09</td>
								                <td>$324,050</td>
								            </tr>
								            <tr>
								                <td>Unity Butler</td>
								                <td>Marketing Designer</td>
								                <td>San Francisco</td>
								                <td>47</td>
								                <td>2009/12/09</td>
								                <td>$85,675</td>
								            </tr>
								            <tr>
								                <td>Howard Hatfield</td>
								                <td>Office Manager</td>
								                <td>San Francisco</td>
								                <td>51</td>
								                <td>2008/12/16</td>
								                <td>$164,500</td>
								            </tr>
								            <tr>
								                <td>Hope Fuentes</td>
								                <td>Secretary</td>
								                <td>San Francisco</td>
								                <td>41</td>
								                <td>2010/02/12</td>
								                <td>$109,850</td>
								            </tr>
								            <tr>
								                <td>Vivian Harrell</td>
								                <td>Financial Controller</td>
								                <td>San Francisco</td>
								                <td>62</td>
								                <td>2009/02/14</td>
								                <td>$452,500</td>
								            </tr>
								            <tr>
								                <td>Timothy Mooney</td>
								                <td>Office Manager</td>
								                <td>London</td>
								                <td>37</td>
								                <td>2008/12/11</td>
								                <td>$136,200</td>
								            </tr>
								            <tr>
								                <td>Jackson Bradshaw</td>
								                <td>Director</td>
								                <td>New York</td>
								                <td>65</td>
								                <td>2008/09/26</td>
								                <td>$645,750</td>
								            </tr>
								            <tr>
								                <td>Olivia Liang</td>
								                <td>Support Engineer</td>
								                <td>Singapore</td>
								                <td>64</td>
								                <td>2011/02/03</td>
								                <td>$234,500</td>
								            </tr>
								            <tr>
								                <td>Bruno Nash</td>
								                <td>Software Engineer</td>
								                <td>London</td>
								                <td>38</td>
								                <td>2011/05/03</td>
								                <td>$163,500</td>
								            </tr>
								            <tr>
								                <td>Sakura Yamamoto</td>
								                <td>Support Engineer</td>
								                <td>Tokyo</td>
								                <td>37</td>
								                <td>2009/08/19</td>
								                <td>$139,575</td>
								            </tr>
								            <tr>
								                <td>Thor Walton</td>
								                <td>Developer</td>
								                <td>New York</td>
								                <td>61</td>
								                <td>2013/08/11</td>
								                <td>$98,540</td>
								            </tr>
								            <tr>
								                <td>Finn Camacho</td>
								                <td>Support Engineer</td>
								                <td>San Francisco</td>
								                <td>47</td>
								                <td>2009/07/07</td>
								                <td>$87,500</td>
								            </tr>
								            <tr>
								                <td>Serge Baldwin</td>
								                <td>Data Coordinator</td>
								                <td>Singapore</td>
								                <td>64</td>
								                <td>2012/04/09</td>
								                <td>$138,575</td>
								            </tr>
								            <tr>
								                <td>Zenaida Frank</td>
								                <td>Software Engineer</td>
								                <td>New York</td>
								                <td>63</td>
								                <td>2010/01/04</td>
								                <td>$125,250</td>
								            </tr>
								            <tr>
								                <td>Zorita Serrano</td>
								                <td>Software Engineer</td>
								                <td>San Francisco</td>
								                <td>56</td>
								                <td>2012/06/01</td>
								                <td>$115,000</td>
								            </tr>
								            <tr>
								                <td>Jennifer Acosta</td>
								                <td>Junior Javascript Developer</td>
								                <td>Edinburgh</td>
								                <td>43</td>
								                <td>2013/02/01</td>
								                <td>$75,650</td>
								            </tr>
								            <tr>
								                <td>Cara Stevens</td>
								                <td>Sales Assistant</td>
								                <td>New York</td>
								                <td>46</td>
								                <td>2011/12/06</td>
								                <td>$145,600</td>
								            </tr>
								            <tr>
								                <td>Hermione Butler</td>
								                <td>Regional Director</td>
								                <td>London</td>
								                <td>47</td>
								                <td>2011/03/21</td>
								                <td>$356,250</td>
								            </tr>
								            <tr>
								                <td>Lael Greer</td>
								                <td>Systems Administrator</td>
								                <td>London</td>
								                <td>21</td>
								                <td>2009/02/27</td>
								                <td>$103,500</td>
								            </tr>
								            <tr>
								                <td>Jonas Alexander</td>
								                <td>Developer</td>
								                <td>San Francisco</td>
								                <td>30</td>
								                <td>2010/07/14</td>
								                <td>$86,500</td>
								            </tr>
								            <tr>
								                <td>Shad Decker</td>
								                <td>Regional Director</td>
								                <td>Edinburgh</td>
								                <td>51</td>
								                <td>2008/11/13</td>
								                <td>$183,000</td>
								            </tr>
								            <tr>
								                <td>Michael Bruce</td>
								                <td>Javascript Developer</td>
								                <td>Singapore</td>
								                <td>29</td>
								                <td>2011/06/27</td>
								                <td>$183,000</td>
								            </tr>
								            <tr>
								                <td>Donna Snider</td>
								                <td>Customer Support</td>
								                <td>New York</td>
								                <td>27</td>
								                <td>2011/01/25</td>
								                <td>$112,000</td>
								            </tr>
								        </tbody>
								        <tfoot>
								            <tr>
								                <th>Name</th>
								                <th>Position</th>
								                <th>Office</th>
								                <th>Age</th>
								                <th>Start date</th>
								                <th>Salary</th>
								            </tr>
								        </tfoot>
								    </table>
								    <script>
								   		$('#zero_config').DataTable();
								    </script>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
        
        
        
		<!-- footer -->
        <footer class="footer">
            <%@ include file="../../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../../include/bjs.jsp" %>       
        
        
        
        
        
	<jsp:include page="../../include/header.jsp"/>
	
	<h1>회원관리</h1>
	<a href="insertMember.ad">회원등록</a><br>
	<a href="insertMemberToLecture.ad">학생을 강의에 꽂아주기</a><br>
	<c:forEach var="m" items="${list }">
		<a href="DetailStudent.ad?m_no=${m.m_no }">${m }</a>
		<button onclick="banish(${m.m_no})">강퇴</button><button onclick="banishCancle(${m.m_no})">강퇴취소</button><br>
	</c:forEach>
	
	<form id="form" method='post'>
		<input type="hidden" name="m_no">
	</form>
	<script>
		function banish(m_no){
			var formm=$('#form').attr('action','banish.ad')
			formm.children('input').eq(0).val(m_no)
			formm.submit();
		}
		function banishCancle(m_no){
			var formm=$('#form').attr('action','banishCancle.ad')
			formm.children('input').eq(0).val(m_no)
			formm.submit();
		}
		/* function accept(m_no){
			var formm=$('#form').attr('action','acceptMember.ad')
			formm.children('input').eq(0).val(m_no)
			formm.submit();
		} */
	</script>
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>