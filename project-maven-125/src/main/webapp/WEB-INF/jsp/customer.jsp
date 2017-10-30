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
						<td><a class="btn btn-outline-danger delete-btn" href="#">Delete</a>
							<a id="${customer.id }"
							class="btn btn-outline-warning update-btn" href="#">Update</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="container">
			<form action="/customer/save" method="POST">
				<h2>Customer Entry</h2>
				<div class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">Name :</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="name" placeholder=" "
								name="name">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="address">Address
							:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="address"
								placeholder=" " name="address">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">Email :</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="email"
								placeholder=" " name="email">
						</div>
					</div>

					<div class="container">
						<div class="col-xs-4">
							<div class="form-group phone-number">
								<label class="control-label col-sm-2" for="phoneNumber">Phone
							Number :</label>
								<div class="col-xs-3">
									<input type="tel" name="phone" class="form-control" value=""
										size="4" maxlength="4" required="required" title="">
								</div>

								<div class="col-xs-3">
									<input type="tel" name="phone" class="form-control" value=""
										size="4" maxlength="4" required="required" title="">
								</div>


								<div class="col-xs-4">
									<input type="tel" name="phone" class="form-control" value=""
										size="4" maxlength="4" required="required" title="">
								</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="phoneNumber">Phone
							Number :</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="phoneNumber"
								placeholder=" " name="phoneNumber">
						</div>
					</div>
				</div>
			</form>
		</div>

		<tr>
			<td>Birth Date</td>
			<td>:</td>
			<td><input type="text" name="birthDate" placeholder="" /></td>
		</tr>
		<tr>
			<td>Submit</td>
			<td></td>
			<td><input type="submit" name="submit" value="save" /></td>
		</tr>
		</table>
		</form>

	</div>
	<script type="text/javascript" src="/assets/js/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="/assets/bootstrap-4.0.0-beta.2/dist/js/bootstrap.min.js"></script>

	<script type="text/javascript">
 		
 		$(document).ready(function(){
 		 var id = 0;
 			$('.update-btn').on('click', function(){
 				
 				//ambil data dari server => ajax
 				id = $(this).attr('id');
 				
 				$.ajax({
 					type: 'POST',
 					url : 'customer/empid/'+id,
 					success : function(data){
 						//console.log(JSON.stringify(data));
 						_setFieldUpdateModal(data);
 					},
 					dataType: 'json'
 				});
 				
 				$('#updateModal').modal();
 			});
 			
 			function _setFieldUpdateModal(data){
 				$('#textName').val(data.name);
				$('#textAddress').val(data.address);
				$('#textEmail').val(data.email);
				$('#textPhoneNumber').val(data.phoneNumber);
 			}
 			
 			//event submit data for update
 			$('#submit-update').click(function(){
 				
 				//Object ala js
 				var Customer = {
 					id : id,
 					name : $('#textName').val(),
 					address : $('#textAddress').val(),
 					email : $('#textEmail').val(),
 					phone_number : $('#textPhoneNumber').val();
 				};
 				
 				//ajax update
 				$.ajax({
 					type: 'PUT',
 					url : 'customer/update',
 					contentType: "application/json",
 					data: JSON.stringify(Customer),
 					success: function(data){
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
							<label for="textName">Name</label> <input type="text"
								class="form-control" id="textName" name="textName"
								placeholder=" ">
							<!-- <small id="nameHelp" class="form-text text-muted">Silahkan anda mengisi nama dengan benar</small> -->
						</div>
						<div class="form-group">
							<label for="textAddress">Address</label> <input type="text"
								class="form-control" id="textAddress" name="textAddress"
								placeholder=" ">
							<!--  <small id="emailHelp" class="form-text text-muted">Silahkan anda mengisi Email dengan benar</small> -->
						</div>
						<div class="form-group">
							<label for="textEmail">Email</label> <input type="text"
								class="form-control" name="textEmail" id="textEmail"
								placeholder=" ">
							<!--  <small id="emailHelp" class="form-text text-muted">Silahkan anda mengisi Email dengan benar</small> -->
						</div>
						<div class="form-group">
							<label for="textPhoneNumber">Phone Number</label> <input
								type="text" class="form-control" name="textPhoneNumber"
								id="textPhoneNumber" placeholder=" ">
							<!--  <small id="emailHelp" class="form-text text-muted">Silahkan anda mengisi Email dengan benar</small> -->
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