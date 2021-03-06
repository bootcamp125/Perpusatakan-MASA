<%@page import="com.xsis.training125.model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Library MASA Employee Entry</title>
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
<script src="http://code.gijgo.com/1.6.1/js/gijgo.js"
	type="text/javascript"></script>
<link href="http://code.gijgo.com/1.6.1/css/gijgo.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="/assets/bootstrap-4.0.0-beta.2/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container" id="container">
		<%
			/* List<Employee> employees = //(List)request.getAttribute("employees");		
			for(Employee employee: employees){
				out.println("name : "+ employee.getName());
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
				<c:forEach var="employee" items="${employees }">
					<tr>
						<td>${employee.name }</td>
						<td>${employee.address }</td>
						<td>${employee.email }</td>
						<td>${employee.phoneNumber }</td>
						<td>${employee.birthDate }</td>
						<td><a data-id="${employee.id }"
							class="btn btn-outline-danger delete-btn">Delete</a> <a
							id="${employee.id }" class="btn btn-outline-warning update-btn">Update</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<form action="employee/save" method="POST">
			<h2>Employee Entry</h2>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="name">Name :</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="name" placeholder=" "
						name="name">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="address">Address
					:</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="address"
						placeholder=" " name="address">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="email">Email :</label>
				<div class="col-sm-3">
					<input type="email" class="form-control" id="email" placeholder=" "
						name="email">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="phoneNumber">Phone
					Number :</label>
				<div class="col-sm-3">
					<input type="number" min="0" class="form-control" id="phoneNumber"
						placeholder=" " name="phoneNumber">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="birthDate">Birth
					Date :</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="birthDate"
						placeholder=" " name="birthDate">
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
					url : 'employee/edit/' + id,
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
				var Employee = {
					id : id,
					name : $('#modname').val(),
					address : $('#modaddress').val(),
					email : $('#modemail').val(),
					phoneNumber : $('#modphoneNumber').val(),
					birthDate : $('#modbirthDate').val(),
				};

				//ajax update
				$.ajax({
					type : 'PUT',
					url : 'employee/update',
					contentType : "application/json",
					data : JSON.stringify(Employee),
					success : function(data) {
						window.location = "/employee";
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
					url : '/employee/delete/' + id,
					success : function(data) {
						window.location = "/employee";
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
							<!-- <small id="nameHelp" class="form-text text-muted">Silahkan anda mengisi nama dengan benar</small> -->
						</div>
						<div class="form-group">
							<label for="modemail">Email</label> <input type="email"
								class="form-control" id="modemail" name="modemail"
								placeholder=" ">
						</div>
						<div class="form-group">
							<label for="modphoneNumber">Phone Number</label> <input
								type="number" min="0" class="form-control" id="modphoneNumber"
								name="modphoneNumber" placeholder=" ">
						</div>
						<div class="form-group">
							<label for="modbirthDate">Birth Date</label> <input type="date"
								min="1920-1-1" class="form-control" id="modbirthDate"
								name="modbirthDate" placeholder=" ">
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