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
		<form action="rent_history/save" method="POST">
			<label><h1>Borrow Entry</h1></label>
			<div class="form-row">
			    <div class="form-group col-md-6">
				    <label>Customer</label>
				    <select class="form-control" name="customer.id">
			    		<c:forEach var="customers" items="${customers }">
			    			<option value="${customers.id }" label="${customers.name }"/>
			    		</c:forEach>
			    	</select>
				</div>
				<div class="form-group col-md-6">
			    	<label>Borrow Date</label>
			    	<input type="text" class="form-control" name="borrow.borrowDate" id="borrowDate"></td>
				</div>
			  	<div class="form-group col-md-6">
			    	<label>Employee</label>
			    	<input type="text" class="form-control" name="" value="" hidden>
			    	<input type="text" class="form-control" value="">
			  	</div>
			</div>
			<button type="submit" class="btn btn-primary">Save</button><br><br><br><br>
		</form>
	</div>
	
	<script type="text/javascript" src="/assets/js/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script type="text/javascript" src="/assets/bootstrap-4.0.0-beta.2/dist/js/bootstrap.min.js"></script>
	<script src="http://code.gijgo.com/1.5.1/js/gijgo.js" type="text/javascript"></script>
	
	<script>
        $('#borrowDate').datepicker({
            uiLibrary: 'bootstrap4',
            iconsLibrary: 'fontawesome'
        });
    </script>
	
</body>
</html>