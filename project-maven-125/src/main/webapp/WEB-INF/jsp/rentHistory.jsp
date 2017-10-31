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
		<form action="borrow/save" method="POST">
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
			    	<input type="text" class="form-control" name="stock.stock">
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
						<td>${book.stock.stock }</td>
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
	
</body>
</html>