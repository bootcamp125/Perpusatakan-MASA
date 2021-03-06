<%@page import="com.xsis.training125.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Library MASA Customer Entry</title>
		<!-- start: Css -->
		<link rel="stylesheet" type="text/css"
			href="assets/asset/css/bootstrap.min.css">
		
		<!-- plugins -->
		<link rel="stylesheet" type="text/css"
			href="assets/asset/css/plugins/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css"
			href="assets/asset/css/plugins/datatables.bootstrap.min.css" />
		<link rel="stylesheet" type="text/css"
			href="assets/asset/css/plugins/animate.min.css" />
		<link href="assets/asset/css/style.css" rel="stylesheet">
		<!-- end: Css -->
		
		<link rel="shortcut icon" href="assets/asset/img/logomi.png">
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
				      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
				      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
				      <![endif]-->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script src="http://code.gijgo.com/1.6.1/js/gijgo.js"
	type="text/javascript"></script>
<link href="http://code.gijgo.com/1.6.1/css/gijgo.css" rel="stylesheet"
	type="text/css" /> -->
<link rel="stylesheet"
	href="/assets/bootstrap-4.0.0-beta.2/dist/css/bootstrap.min.css" />
</head>
<body id="mimin" class="dashboard">
	<!-- start: Header -->
	<nav class="navbar navbar-default header navbar-fixed-top">
		<div class="col-md-12 nav-wrapper">
			<div class="navbar-header" style="width: 100%;">
				<div class="opener-left-menu is-open">
					<span class="top"></span> <span class="middle"></span> <span
						class="bottom"></span>
				</div>
				<a href="index.html" class="navbar-brand"> <b>MASA</b>
				</a>

				<ul class="nav navbar-nav search-nav">
					<li>
						<div class="search">
							<span class="fa fa-search icon-search" style="font-size: 23px;"></span>
							<div class="form-group form-animate-text">
								<input type="text" class="form-text" required> <span
									class="bar"></span> <label class="label-search">Type
									anywhere to <b>Search</b>
								</label>
							</div>
						</div>
					</li>
				</ul>

				<ul class="nav navbar-nav navbar-right user-nav"
					style="margin-right: 5px;">
					<li class="user-name"><span>Akihiko Avaron</span></li>
					<li class="dropdown avatar-dropdown"><img
						src="assets/asset/img/avatar.jpg" class="img-circle avatar"
						alt="user name" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="true" />
						<ul class="dropdown-menu user-dropdown">
							<li><a href="#"><span class="fa fa-user"></span> My
									Profile</a></li>
							<li><a href="#"><span class="fa fa-calendar"></span> My
									Calendar</a></li>
							<li role="separator" class="divider"></li>
							<li class="more">
								<ul style="float: right;">
									<li><a href=""><span class="fa fa-power-off "></span></a></li>
								</ul>
							</li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- end: Header -->

	<div class="container-fluid mimin-wrapper">

		<!-- start:Left Menu -->
		<div id="left-menu">
			<div class="sub-left-menu scroll">
				<ul class="nav nav-list">
					<li><div class="left-bg"></div></li>
					<li class="time">
						<h1 class="animated fadeInLeft">21:00</h1>
						<p class="animated fadeInRight">Sat,October 1st 2029</p>
					</li>
					<li class="active ripple"><a class="tree-toggle nav-header"><span
							class="fa-home fa"></span> Dashboard <span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul class="nav nav-list tree">
							<li><a href="dashboard-v1.html">Dashboard v.1</a></li>
							<li><a href="dashboard-v2.html">Dashboard v.2</a></li>
						</ul></li>
					<li class="ripple"><a class="tree-toggle nav-header"><span
							class="fa fa-table"></span> Tables <span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul class="nav nav-list tree">
							<li><a href="datatables.html">Data Tables</a></li>
							<li><a href="handsontable.html">handsontable</a></li>
							<li><a href="tablestatic.html">Static</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- end: Left Menu -->


		<!-- start: Content -->
		<div id="content">
			<div class="panel box-shadow-none content-header">
				<div class="panel-body">
					<div class="col-md-12">
						<h3 class="animated fadeInLeft">Book</h3>
						<p class="animated fadeInDown">
							Home <span class="fa-angle-right fa"></span> Book
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-12 top-20 padding-0">
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-heading">
							<h3>Book List</h3>
						</div>
						<div class="panel-body">
							<div class="responsive-table">
								<%
									/* List<Customer> customers = //(List)request.getAttribute("customers");		
									for(Customer customer: customers){
										out.println("name : "+ customer.getName());
									} */
								%>
								<table
									class="table table-sm table-striped table-bordered table-hover">
									<thead class="thead-dark">
										<tr>
											<th>Name</th>
											<th>Address</th>
											<th>Email</th>
											<th>Phone Number</th>
											<th>Birth Date</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="customer" items="${customers }">
											<tr>
												<td>${customer.name }</td>
												<td>${customer.address }</td>
												<td>${customer.email }</td>
												<td>${customer.phoneNumber }</td>
												<td>${customer.birthDate }</td>
												<td><a data-id="${customer.id }"
													class="btn btn-outline-danger delete-btn">Delete</a> <a
													id="${customer.id }"
													class="btn btn-outline-warning update-btn">Update</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end: content -->
	</div>

	<form action="customer/save" method="POST">
		<h2>Customer Entry</h2>
		<div class="form-group row">
			<label class="control-label col-sm-2" for="name">Name :</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="name" placeholder=" "
					name="name">
			</div>
		</div>
		<div class="form-group row">
			<label class="control-label col-sm-2" for="address">Address :</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="address" placeholder=" "
					name="address">
			</div>
		</div>
		<div class="form-group row">
			<label class="control-label col-sm-2" for="email">Email :</label>
			<div class="col-sm-4">
				<input type="email" class="form-control" id="email" placeholder=" "
					name="email">
			</div>
		</div>
		<div class="form-group row">
			<label class="control-label col-sm-2" for="phoneNumber">Phone
				Number :</label>
			<div class="col-sm-4">
				<input type="number" min="0" class="form-control" id="phoneNumber"
					placeholder=" " name="phoneNumber">
			</div>
		</div>
		<div class="form-group row">
			<label class="control-label col-sm-2" for="birthDate">Birth
				Date :</label>
			<div class="col-sm-4">
				<input type="text" min="1920-12-31" class="form-control"
					id="birthDate" placeholder=" " name="birthDate">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" name="submit"
					value="save">Submit</button>
			</div>
		</div>
	</form>
	</div>

	<script>
		$('#birthDate').datepicker({
			uiLibrary : 'bootstrap4',
			iconsLibrary : 'fontawesome'
		});
	</script>

	<script type="text/javascript" src="/assets/js/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="/assets/bootstrap-4.0.0-beta.2/dist/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		var id = 0;
		$(document).ready(function() {

			$('.update-btn').on('click', function() {

				//ambil data dari server => ajax
				id = $(this).attr('id');

				$.ajax({
					type : 'POST',
					url : 'customer/edit/' + id,
					success : function(data) {
						console.log(JSON.stringify(data));
						_setFieldUpdateModal(data);
					},
					dataType : 'json'
				});

				$('#updateModal').modal();
			});

			function _setFieldUpdateModal(data) {
				$('#modname').val(data.name);
				$('#modaddress').val(data.address);
				$('#modemail').val(data.email);
				$('#modphoneNumber').val(data.phoneNumber);
				$('#modbirthDate').val(data.birthDate);
			}

			//event submit data for update
			$('#submit-update').click(function() {

				//Object ala js
				var Customer = {
					id : id,
					name : $('#modname').val(),
					address : $('#modaddress').val(),
					email : $('#modemail').val(),
					phoneNumber : $('#modphoneNumber').val(),
					birthDate : $('#modbirthDate').val()
				};

				//ajax update
				$.ajax({
					type : 'PUT',
					url : 'customer/update',
					contentType : "application/json",
					data : JSON.stringify(Customer),
					success : function(data) {
						window.location = "/customer";
					}
				});
			});
		});

		//delete
		$(document).ready(function() {

			$('.delete-btn').on('click', function() {

				id = $(this).data('id');
				$('#deleteModal').modal(id);
			});

			$('#submit-delete').click(function() {

				$.ajax({
					type : 'DELETE',
					url : 'customer/delete/' + id,
					success : function(data) {
						window.location = "/customer";
					}
				});
			});
		});
	</script>

	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Update
						Confirmation</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="modname">Name</label> <input type="text"
								class="form-control" id="modname" name="modname" placeholder=" ">
							<!-- <small id="nameHelp" class="form-text text-muted">Silahkan anda mengisi nama dengan benar</small> -->
						</div>
						<div class="form-group">
							<label for="modaddress">Address</label> <input type="text"
								class="form-control" id="modaddress" name="modaddress"
								placeholder=" ">
						</div>
						<div class="form-group">
							<label for="modemail">Email</label> <input type="email"
								class="form-control" name="modemail" id="modemail"
								placeholder=" ">
						</div>
						<div class="form-group">
							<label for="modphoneNumber">Phone Number</label> <input
								type="number" min="0" class="form-control" name="modphoneNumber"
								id="modphoneNumber" placeholder=" "> <small
								id="phoneNumberHelp" class="form-text text-muted">Example
								: 0818xxxx8181 or 021xxx2121</small>
						</div>
						<div class="form-group">
							<label for="modbirthDate">Birth Date :</label> <input type="date"
								min="1920-12-31" class="form-control" id="modbirthDate"
								placeholder=" " name="modbirthDate">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="submit-update">Update</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Delete
						Confirmation</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" id="submit-delete">Delete</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>