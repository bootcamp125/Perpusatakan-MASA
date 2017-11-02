<%@page import="com.xsis.training125.model.Book"%>
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
		<form action="book/save" method="POST">
			<div class="form-row">
			    <div class="form-group col-md-6">
				    <label>ISBN</label>
				    <input type="text" class="form-control" name="isbn">
				</div>
				<div class="form-group col-md-6">
			    	<label>Title</label>
			    	<input class="form-control" type="text" name="title"></td>
				</div>
				<div class="form-group col-md-6">
			    	<label>Author</label>
			    	<input type="text" class="form-control" name="author">
			  	</div>
			  	<div class="form-group col-md-6">
			    	<label>Released Year</label>
			    	<input type="text" class="form-control" name="releasedYear">
			  	</div>
			  	<div class="form-group col-md-6">
			    	<label>Publisher</label>
			    	<select class="form-control" name="publisher.id">
			    		<c:forEach var="publisher" items="${publishers }">
			    			<option value="${publisher.id }" label="${publisher.name }"/>
			    		</c:forEach>
			    	</select>
			  	</div>
			  	<div class="form-group col-md-6">
			    	<label>Stock</label>
			    	<input type="text" class="form-control" name="bookStock.stock">
			  	</div>
			  	<div class="form-group col-md-6">
			    	<label>Category</label>
			    	<select class="form-control" name="shelf.id">
			    		<c:forEach var="shelf" items="${shelfs }">
			    			<option value="${shelf.id }" label="${shelf.category }"/>
			    		</c:forEach>
			    	</select>
			  	</div>
			</div>
			<button type="submit" class="btn btn-primary">Save</button><br><br><br><br>
		</form>
		
		<table class="table table-striped table-bordered table-hover">
  			<thead class="thead-dark">
				<tr>
					<th>ISBN</th>
					<th>Title</th>
					<th>Author</th>
					<th>Released Year</th>
					<th>Publisher</th>
					<th>Category</th>
					<th>Stock</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${books }">
					<tr>
						<td>${book.isbn }</td>
						<td>${book.title }</td>
						<td>${book.author }</td>
						<td>${book.releasedYear }</td>
						<td>${book.publisher.name }</td>
						<td>${book.shelf.category }</td>
						<td>${book.bookStock.stock }</td>
						<td>
							<button class="btn btn-warning btn-sm update-btn" data-id="${book.id}">Update</button>
							<button class="btn btn-danger btn-sm delete-btn" data-id="${book.id}">Delete</button>
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
					url: '/book/edit/'+id,
					success: function(data) {		
						setField(data);
					},
					dataType: 'json'
				});
				
				$('#updateModal').modal();
			});
			
			function setField(data) {
				$('#isbn').val(data.isbn);
				$('#title').val(data.title);
				$('#author').val(data.author);
				$('#releasedYear').val(data.releasedYear);
				$('#publisher').val(data.publisher.id);
				$('#bookStockId').val(data.bookStock.id);
				$('#bookStock').val(data.bookStock.stock);
				$('#category').val(data.shelf.id);
			}
			
			//submit update
			$('#submit-update').click(function(){
				var Book = {
					id : id,
					isbn : $('#isbn').val(),
					title : $('#title').val(),
					author : $('#author').val(),
					releasedYear : $('#releasedYear').val(),
					publisher : {
						id : $('#publisher').val()
					},
					bookStock : {
						id : $('#bookStockId').val(),
						stock : $('#bookStock').val()
					},
					shelf : {
						id : $('#category').val()
					}
				};
				
				// ajax update
				$.ajax({
					type: 'PUT',
					url: '/book/update',
					contentType: "application/json",
					data : JSON.stringify(Book),
					success: function(data) {		
						window.location = "/book";
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
					url: '/book/delete/'+id,
					success: function(data) {		
						window.location = "/book";
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
				    <label>ISBN</label>
				    <input type="text" class="form-control" name="isbn" id="isbn">
				</div>
				<div class="form-group col-md-6">
			    	<label>Title</label>
			    	<input class="form-control" type="text" name="title" id="title"></td>
				</div>
				<div class="form-group col-md-6">
			    	<label>Author</label>
			    	<input type="text" class="form-control" name="author" id="author">
			  	</div>
			  	<div class="form-group col-md-6">
			    	<label>Released Year</label>
			    	<input type="text" class="form-control" name="releasedYear" id="releasedYear">
			  	</div>
			  	<div class="form-group col-md-6">
			    	<label>Publisher</label>
			    	<select class="form-control" name="publisher" id="publisher">
			    		<c:forEach var="publisher" items="${publishers }">
			    			<option value="${publisher.id }" label="${publisher.name }"/>
			    		</c:forEach>
			    	</select>
			  	</div>
			  	<div class="form-group col-md-6">
			    	<label>Stock</label>
			    	<input type="hidden" class="form-control" name="bookStockId" id="bookStockId">
			    	<input type="text" class="form-control" name="bookStock" id="bookStock">
			  	</div>
			  	<div class="form-group col-md-6">
			    	<label>Category</label>
			    	<select class="form-control" name="category" id="category">
			    		<c:forEach var="shelf" items="${shelfs }">
			    			<option value="${shelf.id }" label="${shelf.category }"/>
			    		</c:forEach>
			    	</select>
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