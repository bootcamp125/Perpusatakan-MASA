<%@page import="com.xsis.training125.model.Publisher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="/assets/bootstrap-4.0.0-beta.2/dist/css/bootstrap.css"/>
	<link href="http://code.gijgo.com/1.5.1/css/gijgo.css" rel="stylesheet" type="text/css" />
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<body>
	<div class="container">
		<form action="publisher/save" method="POST">
			<div class="form-row">
			    <div class="form-group col-md-6">
				    <label>Name : </label>
				    <input type="text" class="form-control" name="name">
				</div>
				<div class="form-group col-md-6">
			    	<label>Address : </label>
			    	<input class="form-control" type="text" name="address"></td>
				</div>
				<div class="form-group col-md-6">
			    	<label>Email : </label>
			    	<input type="email" class="form-control" name="email">
			  	</div>
			  	<div class="form-group col-md-6">
			    	<label>Phone Number : </label>
			    	<input type="text" class="form-control" name="phoneNumber">
			  	</div>
			</div>
			<button type="submit" class="btn btn-primary">Save</button><br><br><br><br>
		</form>
		
		<table class="table table-striped table-bordered table-hover">
  			<thead class="thead-dark">
				<tr>
					<th>Name</th>
					<th>Address</th>
					<th>Email</th>
					<th>Phone Number</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="publisher" items="${publisher }">
					<tr>
						<td>${publisher.name }</td>
						<td>${publisher.address }</td>
						<td>${publisher.email }</td>
						<td>${publisher.phoneNumber }</td>
						<td>
							<button class="btn btn-warning btn-sm update-btn" data-id="${publisher.id}">Update</button>
							<button class="btn btn-danger btn-sm delete-btn" data-id="${publisher.id}">Delete</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script type="text/javascript" src="/assets/js/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script type="text/javascript" src="/assets/bootstrap-4.0.0-beta.2/dist/js/bootstrap.min.js"></script>
	<script src="http://code.gijgo.com/1.5.1/js/gijgo.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		
		var id = 0;
		
		//update
		$(document).ready(function (){
			$('.update-btn').on('click',function() {
				
				id = $(this).data('id');
				
				//ajax retrive data
				$.ajax({
					type: 'POST',
					url: '/publisher/edit/'+id,
					success: function(data) {		
						setField(data);
					},
					dataType: 'json'
				});
				
				$('#updateModal').modal();
			});
			
			function setField(data) {
				$('#name').val(data.name);
				$('#address').val(data.address);
				$('#email').val(data.email);
				$('#phoneNumber').val(data.phoneNumber);
			}
			
			//submit update
			$('#submit-update').click(function(){
				var Publisher = {
					id : id,
					name : $('#name').val(),
					address : $('#address').val(),
					email : $('#email').val(),
					phoneNumber : $('#phoneNumber').val()
				};
				
				// ajax update
				$.ajax({
					type: 'PUT',
					url: '/publisher/update',
					contentType: "application/json",
					data : JSON.stringify(Publisher),
					success: function(data) {		
						window.location = "/publisher";
					}
				});
			});
		});
		
		//delete
		$(document).ready(function (){
			
			$('.delete-btn').on('click',function() {
				
				id = $(this).data('id');
				$('#deleteConfirmation').modal(id);
			});
			
			$('#ok-delete').click(function(){
				
				$.ajax({
					type: 'DELETE',
					url: '/publisher/delete/'+id,
					success: function(data) {		
						window.location = "/publisher";
					}
				});
			});
		});
		
	</script>
	
	<!-- Modal Update -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Update Modal</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
				<div class="form-row">
			    <div class="form-group col-md-6">
				    <label>Name : </label>
				    <input type="text" class="form-control" name="name" id="name">
				</div>
				<div class="form-group col-md-6">
			    	<label>Address : </label>
			    	<input class="form-control" type="text" name="address" id="address"></td>
				</div>
				<div class="form-group col-md-6">
			    	<label>Email : </label>
			    	<input type="email" class="form-control" name="email" id="email">
			  	</div>
			  	<div class="form-group col-md-6">
			    	<label>Phone Number : </label>
			    	<input type="text" class="form-control" name="phoneNumber" id="phoneNumber">
			  	</div>
			</div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="submit-update">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal Delete -->
	<div class="modal fade" id="deleteConfirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        Are you sure?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
	        <button type="button" class="btn btn-primary" id="ok-delete">Yes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>