<%@page import="com.xsis.training125.model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/assets/bootstrap-4.0.0-beta.2/dist/css/bootstrap.min.css" />
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
	 			<th>Email</th>
	 			<th>Address</th>
	 			<th>Action</th>
	 		</tr>
	 	</thead>
	 	<tbody>
	 		<c:forEach var="employee" items="${employees }">
	 			<tr>
	 				<td>${employee.name }</td>
	 				<td>${employee.email }</td>
	 				<td>${employee.address }</td>
	 				<td>
	 					<a class="btn btn-outline-danger delete-btn" href="#">Delete</a>
	 					<a id="${employee.id }" class="btn btn-outline-warning update-btn" href="#">Update</a>
	 				</td>
	 			</tr>
	 		</c:forEach>
	 	</tbody>
 	</table>
 		<form action="/employee/save" method="POST">
 			<table>
 				<tr>
 					<td>Name</td>
 					<td>:</td>
 					<td>
 						<input type="text" name="name" placeholder="Enter your name" />
 					</td>
 				</tr>
 				<tr>
 					<td>Address</td>
 					<td>:</td>
 					<td>
 						<input type="text" name="address" placeholder="Enter your address" />
 					</td>
 				</tr>
 				<tr>
 					<td>Email</td>
 					<td>:</td>
 					<td>
 						<input type="text" name="email" placeholder="Enter your Email" />
 					</td>
 				</tr>
 				<tr>
 					<td>Date</td>
 					<td>:</td>
 					<td>
 						<input type="text" name="birthDay" placeholder="" />
 					</td>
 				</tr>
 				<tr>
 					<td></td>
 					<td></td>
 					<td>
 						<input type="submit" name="submit" value="save" />
 					</td>
 				</tr>
 			</table>
 		</form>

 	</div>
 	<script type="text/javascript" src="/assets/js/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script type="text/javascript" src="/assets/bootstrap-4.0.0-beta.2/dist/js/bootstrap.min.js"></script>
	 	
 	<script type="text/javascript">
 		
 		$(document).ready(function(){
 		 var id = 0;
 			$('.update-btn').on('click', function(){
 				
 				//ambil data dari server => ajax
 				id = $(this).attr('id');
 				
 				$.ajax({
 					type: 'POST',
 					url : 'employee/empid/'+id,
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
 			}
 			
 			//event submit data for update
 			$('#submit-update').click(function(){
 				
 				//Object ala js
 				var Employee = {
 					id : id,
 					name : $('#textName').val(),
 					address : $('#textAddress').val(),
 					email : $('#textEmail').val(),
 					salary : 0
 				};
 				
 				//ajax update
 				$.ajax({
 					type: 'PUT',
 					url : 'employee/update',
 					contentType: "application/json",
 					data: JSON.stringify(Employee),
 					success: function(data){
 						window.location = "/employee";
 					}
 				});
 			});
 		});
 	</script>
 	
 	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
			  <div class="form-group">
			    <label for="textName">Name</label>
			    <input type="text" class="form-control" id="textName" name="name" placeholder="Enter Name">
			    <!-- <small id="nameHelp" class="form-text text-muted">Silahkan anda mengisi nama dengan benar</small> -->
			  </div>
			  <div class="form-group">
			    <label for="textAddress">Address</label>
			    <input type="text" class="form-control" id="textAddress" name="address" placeholder="Enter Address">
			   <!--  <small id="emailHelp" class="form-text text-muted">Silahkan anda mengisi Email dengan benar</small> -->
			  </div>
			  <div class="form-group">
			    <label for="textEmail">Email</label>
			    <input type="text" class="form-control" name="textEmail" id="textEmail" placeholder="Enter Email">
			   <!--  <small id="emailHelp" class="form-text text-muted">Silahkan anda mengisi Email dengan benar</small> -->
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="submit-update">Update</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>