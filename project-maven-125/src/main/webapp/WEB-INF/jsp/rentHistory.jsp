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
		<table class="table table-striped table-bordered table-hover">
  			<thead class="thead-dark">
				<tr>
					<th>Customer</th>
					<th>Borrow Date</th>
					<th>Borrow Employee</th>
					<th>Due Date</th>
					<th>Return Date</th>
					<th>Return Employee</th>
					<th>Fine</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rentHistories" items="${rentHistories }">
					<tr>
						<td>${rentHistories.borrowTransaction.customer.name }</td>
						<td>${rentHistories.borrowTransaction.borrowDate }</td>
						<td>${rentHistories.borrowTransaction.employee.name }</td>
						<td>${rentHistories.dueDate }</td>
						<td>${rentHistories.returnTransaction.returnDate }</td>
						<td>${rentHistories.returnTransaction.employeee.name }</td>
						<td>${rentHistories.fine }</td>
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