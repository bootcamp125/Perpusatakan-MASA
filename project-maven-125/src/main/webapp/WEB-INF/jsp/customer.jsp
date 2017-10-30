<%@page import="com.xsis.training125.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
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
<script src="http://code.gijgo.com/1.6.0/js/gijgo.js"
	type="text/javascript"></script>
<link href="http://code.gijgo.com/1.6.0/css/gijgo.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="/assets/bootstrap-4.0.0-beta.2/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container" id="container">
		<%
			/* List<Customer> customers = //(List)request.getAttribute("customers");		
			for(Customer customer: customers){
				out.println("name : "+ customer.getName());
			} */
		%>
		<table class="table table-sm table-striped table-bordered table-hover">
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
						<td><a class="btn btn-outline-danger delete-btn">Delete</a> <a
							id="${customer.id }" class="btn btn-outline-warning update-btn">Update</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<form action="/customer/save" method="POST">
			<h2>Customer Entry</h2>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="name">Name :</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" placeholder=" "
						name="name">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="address">Address
					:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="address"
						placeholder=" " name="address">
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
					<input type="number" class="form-control" id="phoneNumber"
						placeholder=" " name="phoneNumber">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="birthDate">Birth
					Date :</label>
				<div class="col-sm-4">
					<input class="form-control" id="birthDate" placeholder=" "
						name="birthDate">
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
					url : '/customer/empid/' + id,
					success : function(data) {
						//console.log(JSON.stringify(data));
						_setFieldUpdateModal(data);
					},
					dataType : 'json'
				});

				$('#updateModal').modal();
			});

			function _setFieldUpdateModal(data) {
				$('#name').val(data.name);
				$('#address').val(data.address);
				$('#email').val(data.email);
				$('#phoneNumber').val(data.phoneNumber);
				$('#birthDate').val(data.birthDate);
			}

			//event submit data for update
			$('#submit-update').click(function() {

				//Object ala js
				var Customer = {
					id : id,
					name : $('#name').val(),
					address : $('#address').val(),
					email : $('#email').val(),
					phone_number : $('#phoneNumber').val(),
					birth_date : $('#birthDate').val()
				};

				//ajax update
				$.ajax({
					type : 'PUT',
					url : '/customer/update',
					contentType : "application/json",
					data : JSON.stringify(Customer),
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
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="name">Name</label> <input type="text"
								class="form-control" id="name" name="name" placeholder=" ">
							<!-- <small id="nameHelp" class="form-text text-muted">Silahkan anda mengisi nama dengan benar</small> -->
						</div>
						<div class="form-group">
							<label for="address">Address</label> <input type="text"
								class="form-control" id="address" name="address" placeholder=" ">
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="email"
								class="form-control" name="email" id="email" placeholder=" ">
						</div>
						<div class="form-group">
							<label for="phoneNumber">Phone Number</label> <input
								type="number" class="form-control" name="phoneNumber"
								id="phoneNumber" placeholder=" "> <small
								id="phoneNumberHelp" class="form-text text-muted">Example
								: 0818xxxx8181 or 021xxx2121</small>
						</div>
						<div class="form-group">
							<label for="birthDate">Birth Date :</label> <input
								class="form-control" id="birthDate" placeholder=" "
								name="birthDate">
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
</body>
</html>