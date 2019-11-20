<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Preloader - style you can find in spinners.css -->
	<%@ include file="../include/bpreloader.jsp" %>
	<!-- End of Preloader - style you can find in spinners.css -->

	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../include/bsidebar.jsp" %>
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
                            <div class="">
                                <button
                                    class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right ml-2"><i
                                        class="ti-settings text-white"></i></button>
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
                    <div class="col-lg-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="mb-0 text-white">Other Sample form</h4>
                            </div>
                            <div class="card-body">
                                <form action="#">
                                    <div class="form-body">
                                        <h3 class="card-title">Person Info</h3>
                                        <hr>
                                        <div class="row pt-3">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">First Name</label>
                                                    <input type="text" id="firstName" class="form-control"
                                                        placeholder="John doe">
                                                    <small class="form-control-feedback"> This is inline help </small>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group has-danger">
                                                    <label class="control-label">Last Name</label>
                                                    <input type="text" id="lastName"
                                                        class="form-control form-control-danger" placeholder="12n">
                                                    <small class="form-control-feedback"> This field has error. </small>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Gender</label>
                                                    <select class="form-control custom-select">
                                                        <option value="">Male</option>
                                                        <option value="">Female</option>
                                                    </select>
                                                    <small class="form-control-feedback"> Select your gender </small>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Date of Birth</label>
                                                    <input type="date" class="form-control" placeholder="dd/mm/yyyy">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Category</label>
                                                    <select class="form-control custom-select"
                                                        data-placeholder="Choose a Category" tabindex="1">
                                                        <option value="Category 1">Category 1</option>
                                                        <option value="Category 2">Category 2</option>
                                                        <option value="Category 3">Category 5</option>
                                                        <option value="Category 4">Category 4</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Membership</label>
                                                    <div class="mb-2">
                                                        <label class="custom-control custom-radio">
                                                            <input id="radio5" name="radio" type="radio"
                                                                class="custom-control-input">
                                                            <span class="custom-control-label">Free</span>
                                                        </label>
                                                        <label class="custom-control custom-radio">
                                                            <input id="radio6" name="radio" type="radio"
                                                                class="custom-control-input">
                                                            <span class="custom-control-label">Paid</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <h3 class="p-2 rounded-title mt-4">Address</h3>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-12 ">
                                                <div class="form-group">
                                                    <label>Street</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>City</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>State</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Post Code</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Country</label>
                                                    <select class="form-control custom-select">
                                                        <option>--Select your Country--</option>
                                                        <option>India</option>
                                                        <option>Sri Lanka</option>
                                                        <option>USA</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i>
                                            Save</button>
                                        <button type="button" class="btn btn-inverse">Cancel</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="mb-0 text-white">Other Sample Horizontal form</h4>
                            </div>
                            <div class="card-body">
                                <form action="#" class="form-horizontal">
                                    <div class="form-body">
                                        <h3 class="p-2 rounded-title">Person Info</h3>
                                        <hr class="mt-0 mb-5">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-lg-3">First Name</label>
                                                    <div class="col-lg-9">
                                                        <input type="text" class="form-control" placeholder="John doe">
                                                        <small class="form-control-feedback"> This is inline help
                                                        </small> </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group has-danger row">
                                                    <label class="control-label text-right col-lg-3">Last Name</label>
                                                    <div class="col-lg-9">
                                                        <input type="text" class="form-control form-control-danger"
                                                            placeholder="12n">
                                                        <small class="form-control-feedback"> This field has error.
                                                        </small> </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-lg-3">Gender</label>
                                                    <div class="col-lg-9">
                                                        <select class="form-control custom-select">
                                                            <option value="">Male</option>
                                                            <option value="">Female</option>
                                                        </select>
                                                        <small class="form-control-feedback"> Select your gender.
                                                        </small> </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-lg-3">Date of
                                                        Birth</label>
                                                    <div class="col-lg-9">
                                                        <input type="date" class="form-control"
                                                            placeholder="dd/mm/yyyy">
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-lg-3">Category</label>
                                                    <div class="col-lg-9">
                                                        <select class="form-control custom-select"
                                                            data-placeholder="Choose a Category" tabindex="1">
                                                            <option value="Category 1">Category 1</option>
                                                            <option value="Category 2">Category 2</option>
                                                            <option value="Category 3">Category 5</option>
                                                            <option value="Category 4">Category 4</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-lg-3">Membership</label>
                                                    <div class="col-lg-9">
                                                        <div class="mb-2">
                                                            <label class="custom-control custom-radio">
                                                                <input id="radio3" name="radio" type="radio"
                                                                    class="custom-control-input">
                                                                <span class="custom-control-label">Free</span>
                                                            </label>
                                                            <label class="custom-control custom-radio">
                                                                <input id="radio4" name="radio" type="radio"
                                                                    class="custom-control-input">
                                                                <span class="custom-control-label">Paid</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <h3 class="p-2 rounded-title">Address</h3>
                                        <hr class="mt-0 mb-5">
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-lg-3">Address 1</label>
                                                    <div class="col-lg-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-lg-3">Address 2</label>
                                                    <div class="col-lg-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-lg-3">City</label>
                                                    <div class="col-lg-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-lg-3">State</label>
                                                    <div class="col-lg-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-lg-3">Post Code</label>
                                                    <div class="col-lg-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-lg-3">Country</label>
                                                    <div class="col-lg-9">
                                                        <select class="form-control custom-select">
                                                            <option>Country 1</option>
                                                            <option>Country 2</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                    </div>
                                    <hr>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <button type="submit" class="btn btn-success">Submit</button>
                                                        <button type="button" class="btn btn-inverse">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6"> </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Sample Form with the Icons</h4>
                                <h6 class="card-subtitle">made with bootstrap elements</h6>
                                <form class="form pt-3">
                                    <div class="form-group">
                                        <label for="exampleInputuname">User Name</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1">
                                                    <i class="ti-user"></i>
                                                </span>
                                            </div>
                                            <input type="text" class="form-control" id="exampleInputuname"
                                                placeholder="Username">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1">
                                                    <i class="ti-email"></i>
                                                </span>
                                            </div>
                                            <input type="email" class="form-control" id="exampleInputEmail1"
                                                placeholder="Enter email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd1">Password</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1">
                                                    <i class="ti-lock"></i>
                                                </span>
                                            </div>
                                            <input type="password" class="form-control" id="pwd1"
                                                placeholder="Enter email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd2">Confirm Password</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1">
                                                    <i class="ti-lock"></i>
                                                </span>
                                            </div>
                                            <input type="password" class="form-control" id="pwd2"
                                                placeholder="Enter email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="checkbox checkbox-success">
                                            <input id="checkbox1" type="checkbox">
                                            <label for="checkbox1"> Remember me </label>
                                        </div>
                                    </div>
                                    <button type="submit"
                                        class="btn btn-success waves-effect waves-light mr-2">Submit</button>
                                    <button type="submit"
                                        class="btn btn-inverse waves-effect waves-light">Cancel</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Sample Form with the right Icons</h4>
                                <h6 class="card-subtitle">made with bootstrap elements</h6>
                                <form class="form pt-3">
                                    <div class="form-group">
                                        <label for="exampleInputuname2">User Name</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="exampleInputuname2"
                                                placeholder="Username">
                                            <div class="input-group-append">
                                                <span class="input-group-text" id="basic-addon2">
                                                    <i class="ti-user"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail2">Email address</label>
                                        <div class="input-group">
                                            <input type="email" class="form-control" id="exampleInputEmail2"
                                                placeholder="Enter email">
                                            <div class="input-group-append">
                                                <span class="input-group-text" id="basic-addon2">
                                                    <i class="ti-email"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputpwd2">Password</label>
                                        <div class="input-group">
                                            <input type="password" class="form-control" id="exampleInputpwd2"
                                                placeholder="Enter pwd">
                                            <div class="input-group-append">
                                                <span class="input-group-text" id="basic-addon2">
                                                    <i class="ti-lock"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputpwd3">Confirm Password</label>
                                        <div class="input-group">
                                            <input type="password" class="form-control" id="exampleInputpwd3"
                                                placeholder="Enter pwd">
                                            <div class="input-group-append">
                                                <span class="input-group-text" id="basic-addon2">
                                                    <i class="ti-lock"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="checkbox checkbox-success">
                                            <input id="checkbox2" type="checkbox">
                                            <label for="checkbox2"> Remember me </label>
                                        </div>
                                    </div>
                                    <div class="text-left">
                                        <button type="submit"
                                            class="btn btn-success waves-effect waves-light mr-2">Submit</button>
                                        <button type="submit"
                                            class="btn btn-inverse waves-effect waves-light">Cancel</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Sample Horizontal Form with Icons</h4>
                                <h6 class="card-subtitle">Use Bootstrap's predefined grid classes for horizontal form
                                </h6>
                                <form class="form-horizontal pt-3">
                                    <div class="form-group row">
                                        <label for="exampleInputuname3" class="col-sm-3 control-label">Username*</label>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">
                                                        <i class="ti-user"></i>
                                                    </span>
                                                </div>
                                                <input type="text" class="form-control" id="exampleInputuname3"
                                                    placeholder="Username">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="exampleInputEmail3" class="col-sm-3 control-label">Email*</label>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">
                                                        <i class="ti-email"></i>
                                                    </span>
                                                </div>
                                                <input type="email" class="form-control" id="exampleInputEmail3"
                                                    placeholder="Enter email">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="web" class="col-sm-3 control-label">Website</label>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">
                                                        <i class="ti-world"></i>
                                                    </span>
                                                </div>
                                                <input type="text" class="form-control" id="web"
                                                    placeholder="Enter Website Name">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword4" class="col-sm-3 control-label">Password*</label>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">
                                                        <i class="ti-lock"></i>
                                                    </span>
                                                </div>
                                                <input type="password" class="form-control" id="exampleInputpwd4"
                                                    placeholder="Enter pwd">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword5" class="col-sm-3 control-label">Re Password*</label>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">
                                                        <i class="ti-lock"></i>
                                                    </span>
                                                </div>
                                                <input type="password" class="form-control" id="exampleInputpwd5"
                                                    placeholder="Re Enter pwd">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="offset-sm-3 col-sm-9">
                                            <div class="checkbox checkbox-success">
                                                <input id="checkbox33" type="checkbox">
                                                <label for="checkbox33">Check me out !</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row mb-0">
                                        <div class="offset-sm-3 col-sm-9">
                                            <button type="submit" class="btn btn-info waves-effect waves-light">Sign
                                                in</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Form with right Icon</h4>
                                <h6 class="card-subtitle">Use Bootstrap's predefined grid classes for horizontal form
                                </h6>
                                <form class="form-horizontal pt-3">
                                    <div class="form-group row">
                                        <label for="uname" class="col-sm-3 control-label">Username*</label>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="uname"
                                                    placeholder="Username">
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">
                                                        <i class="ti-user"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email2" class="col-sm-3 control-label">Email*</label>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <input type="email" class="form-control" id="exampleInputEmail1"
                                                    placeholder="Enter email">
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">
                                                        <i class="ti-email"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="web1" class="col-sm-3 control-label">Website</label>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="web1"
                                                    placeholder="Enter Website Name">
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">
                                                        <i class="ti-world"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="pass3" class="col-sm-3 control-label">Password*</label>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <input type="password" class="form-control" id="pass3"
                                                    placeholder="Enter pwd">
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">
                                                        <i class="ti-lock"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="pass4" class="col-sm-3 control-label">Re Password*</label>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <input type="password" class="form-control" id="pass4"
                                                    placeholder="Re Enter pwd">
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">
                                                        <i class="ti-lock"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="offset-sm-3 col-sm-9">
                                            <div class="checkbox checkbox-success">
                                                <input id="checkbox35" type="checkbox">
                                                <label for="checkbox35">Check me out !</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row mb-0">
                                        <div class="offset-sm-3 col-sm-9 ">
                                            <button type="submit" class="btn btn-info waves-effect waves-light">Sign
                                                in</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="mb-0 text-white">Form with view only</h4>
                            </div>
                            <div class="card-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-body">
                                        <h3 class="p-2 rounded-title">Person Info</h3>
                                        <hr class="mt-0 mb-5">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-lg-right col-lg-3 col-6">First
                                                        Name:</label>
                                                    <div class="col-lg-9 col-6">
                                                        <p class="form-control-static"> John </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-lg-right col-lg-3 col-6">Last
                                                        Name:</label>
                                                    <div class="col-lg-9 col-6">
                                                        <p class="form-control-static"> Doe </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label
                                                        class="control-label text-lg-right col-lg-3 col-6">Gender:</label>
                                                    <div class="col-lg-9 col-6">
                                                        <p class="form-control-static"> Male </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-lg-right col-lg-3 col-6">Date of
                                                        Birth:</label>
                                                    <div class="col-lg-9 col-6">
                                                        <p class="form-control-static"> 11/06/1987 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label
                                                        class="control-label text-lg-right col-lg-3 col-6">Category:</label>
                                                    <div class="col-lg-9 col-6">
                                                        <p class="form-control-static"> Category1 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label
                                                        class="control-label text-lg-right col-lg-3 col-6">Membership:</label>
                                                    <div class="col-lg-9 col-6">
                                                        <p class="form-control-static"> Free </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <h3 class="p-2 rounded-title">Address</h3>
                                        <hr class="mt-0 mb-5">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label
                                                        class="control-label text-lg-right col-lg-3 col-md-6">Address:</label>
                                                    <div class="col-lg-9 col-md-6">
                                                        <p class="form-control-static"> E104, Dharti-2, Near silverstar
                                                            mall </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label
                                                        class="control-label text-lg-right col-lg-3 col-6">City:</label>
                                                    <div class="col-lg-9 col-6">
                                                        <p class="form-control-static"> Bhavnagar </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label
                                                        class="control-label text-lg-right col-lg-3 col-6">State:</label>
                                                    <div class="col-lg-9 col-6">
                                                        <p class="form-control-static"> Gujarat </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-lg-right col-lg-3 col-6">Post
                                                        Code:</label>
                                                    <div class="col-lg-9 col-6">
                                                        <p class="form-control-static"> 457890 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label
                                                        class="control-label text-lg-right col-lg-3 col-6">Country:</label>
                                                    <div class="col-lg-9 col-6">
                                                        <p class="form-control-static"> India </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <button type="submit" class="btn btn-info"> <i
                                                                class="fa fa-pencil"></i> Edit</button>
                                                        <button type="button" class="btn btn-inverse">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6"> </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="mb-0 text-white">With Border at Bottom (<small>Use class
                                        form-bordered</small>)</h4>
                            </div>
                            <div class="card-body">
                                <form action="#" class="form-horizontal form-bordered">
                                    <div class="form-body">
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">First Name</label>
                                            <div class="col-md-9">
                                                <input type="text" placeholder="small" class="form-control">
                                                <small class="form-control-feedback"> This is inline help </small>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Last Name</label>
                                            <div class="col-md-9">
                                                <input type="text" placeholder="medium" class="form-control">
                                                <small class="form-control-feedback"> This is inline help </small>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Gender</label>
                                            <div class="col-md-9">
                                                <select class="form-control custom-select">
                                                    <option value="">Male</option>
                                                    <option value="">Female</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Date of Birth</label>
                                            <div class="col-md-9">
                                                <input type="date" class="form-control" placeholder="dd/mm/yyyy">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Category</label>
                                            <div class="col-md-9">
                                                <select class="form-control custom-select">
                                                    <option value="Category 1">Category 1</option>
                                                    <option value="Category 2">Category 2</option>
                                                    <option value="Category 3">Category 5</option>
                                                    <option value="Category 4">Category 4</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Multi-Value Select</label>
                                            <div class="col-md-9">
                                                <select class="form-control" multiple="">
                                                    <optgroup label="NFC EAST">
                                                        <option>Dallas Cowboys</option>
                                                        <option>New York Giants</option>
                                                        <option>Philadelphia Eagles</option>
                                                        <option>Washington Redskins</option>
                                                    </optgroup>
                                                    <optgroup label="NFC NORTH">
                                                        <option>Chicago Bears</option>
                                                        <option>Detroit Lions</option>
                                                        <option>Green Bay Packers</option>
                                                        <option>Minnesota Vikings</option>
                                                    </optgroup>
                                                    <optgroup label="NFC SOUTH">
                                                        <option>Atlanta Falcons</option>
                                                        <option>Carolina Panthers</option>
                                                        <option>New Orleans Saints</option>
                                                        <option>Tampa Bay Buccaneers</option>
                                                    </optgroup>
                                                    <optgroup label="NFC WEST">
                                                        <option>Arizona Cardinals</option>
                                                        <option>St. Louis Rams</option>
                                                        <option>San Francisco 49ers</option>
                                                        <option>Seattle Seahawks</option>
                                                    </optgroup>
                                                    <optgroup label="AFC EAST">
                                                        <option>Buffalo Bills</option>
                                                        <option>Miami Dolphins</option>
                                                        <option>New England Patriots</option>
                                                        <option>New York Jets</option>
                                                    </optgroup>
                                                    <optgroup label="AFC NORTH">
                                                        <option>Baltimore Ravens</option>
                                                        <option>Cincinnati Bengals</option>
                                                        <option>Cleveland Browns</option>
                                                        <option>Pittsburgh Steelers</option>
                                                    </optgroup>
                                                    <optgroup label="AFC SOUTH">
                                                        <option>Houston Texans</option>
                                                        <option>Indianapolis Colts</option>
                                                        <option>Jacksonville Jaguars</option>
                                                        <option>Tennessee Titans</option>
                                                    </optgroup>
                                                    <optgroup label="AFC WEST">
                                                        <option>Denver Broncos</option>
                                                        <option>Kansas City Chiefs</option>
                                                        <option>Oakland Raiders</option>
                                                        <option>San Diego Chargers</option>
                                                    </optgroup>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Membership</label>
                                            <div class="col-md-9">
                                                <div class="mb-2">
                                                    <label class="custom-control custom-radio">
                                                        <input id="radio5" name="radio" type="radio"
                                                            class="custom-control-input">
                                                        <span class="custom-control-label">Free</span>
                                                    </label>
                                                    <label class="custom-control custom-radio">
                                                        <input id="radio6" name="radio" type="radio"
                                                            class="custom-control-input">
                                                        <span class="custom-control-label">Paid</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Street</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">City</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">State</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Post Code</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row last">
                                            <label class="control-label text-right col-md-3">Country</label>
                                            <div class="col-md-9">
                                                <select class="form-control">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="offset-sm-3 col-md-9">
                                                        <button type="submit" class="btn btn-success"> <i
                                                                class="fa fa-check"></i> Submit</button>
                                                        <button type="button" class="btn btn-inverse">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <div class="right-sidebar">
                    <div class="slimscrollright">
                        <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span>
                        </div>
                        <div class="r-panel-body">
                            <ul id="themecolors" class="mt-3">
                                <li><b>With Light sidebar</b></li>
                                <li><a href="javascript:void(0)" data-theme="default" class="default-theme">1</a></li>
                                <li><a href="javascript:void(0)" data-theme="green" class="green-theme">2</a></li>
                                <li><a href="javascript:void(0)" data-theme="red" class="red-theme">3</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue" class="blue-theme working">4</a></li>
                                <li><a href="javascript:void(0)" data-theme="purple" class="purple-theme">5</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna" class="megna-theme">6</a></li>
                                <li class="d-block mt-4"><b>With Dark sidebar</b></li>
                                <li><a href="javascript:void(0)" data-theme="default-dark"
                                        class="default-dark-theme">7</a></li>
                                <li><a href="javascript:void(0)" data-theme="green-dark" class="green-dark-theme">8</a>
                                </li>
                                <li><a href="javascript:void(0)" data-theme="red-dark" class="red-dark-theme">9</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue-dark" class="blue-dark-theme">10</a>
                                </li>
                                <li><a href="javascript:void(0)" data-theme="purple-dark"
                                        class="purple-dark-theme">11</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna-dark"
                                        class="megna-dark-theme ">12</a></li>
                            </ul>
                            <ul class="mt-3 chatonline">
                                <li><b>Chat option</b></li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/1.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Varun Dhavan <small
                                                class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/2.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Genelia Deshmukh <small
                                                class="text-warning">Away</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/3.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Ritesh Deshmukh <small
                                                class="text-danger">Busy</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/4.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Arijit Sinh <small
                                                class="text-muted">Offline</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/5.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Govinda Star <small
                                                class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/6.jpg" alt="user-img"
                                            class="rounded-circle"> <span>John Abraham<small
                                                class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/7.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Hritik Roshan<small
                                                class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/8.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Pwandeep rajan <small
                                                class="text-success">online</small></span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
        
        
        









		<!-- footer -->
        <footer class="footer">
            <%@ include file="../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->


	<%@ include file="../include/bjs.jsp" %>


	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<form action="login.me" method="post" autocomplete=off>
		id:<input name="id" id="id"><br>
		pw:<input name="pw" id="pass"><button>로그인</button><br>
		<input type="checkbox" name="remember">자동로그인 | <input type="checkbox" id="idSaveCheck"> 아이디/비번 기억하기<br>
	</form>
	
	<script>
	$("#id").val(Cookies.get('id'));      
	$("#pass").val(Cookies.get('pass'));      
    if($("#id").val() != ""){
        $("#idSaveCheck").attr("checked", true);
    }
    
    $("#idSaveCheck").change(function(){
        if($("#idSaveCheck").is(":checked")){
            Cookies.set('id', $("#id").val(), { expires: 7 });
            Cookies.set('pass', $("#pass").val(), { expires: 7 });
        }else{
              Cookies.remove('id');
              Cookies.remove('pass');
        }
    });
    
    $("#id,#pass").keyup(function(){
        if($("#idSaveCheck").is(":checked")){
            Cookies.set('id', $("#id").val(), { expires: 7 });
            Cookies.set('pass', $("#pass").val(), { expires: 7 });
        }
    });
	</script>
	
	
	<table border=1>
		<tr>
			<th>id</th>
			<th>pw</th>
		</tr>
	<c:forEach var="m" items="${list }">
		<tr>
			<td>${m.id }
			<td>${m.pw }
		</tr>
	</c:forEach>
	</table>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>