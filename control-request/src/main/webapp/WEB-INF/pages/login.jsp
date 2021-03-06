
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="SHORTCUT ICON" href='<c:url value="/images/favicon.ico"/>' type="image/x-icon">
<script type="text/javascript" src='<c:url value="/js/jquery-1.12.0.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"/>'></script>
<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'/>
<link rel="stylesheet" href='<c:url value="/css/loginform.css"/>'/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Control-Request</title>

</head>

<body>
 
 
 <div class="Absolute-Center">
	 <div class="row">
	 	
	 		<p style="text-indent:50px"> 
			
			<c:if test="${param.logout != null}">
				You are currently logged off. Please log in.
			</c:if>
			</p>
	 	<form class="form-horizontal" action="<c:url value="/auth"/>" method="POST">
	 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"/>
			
			<div class="form-group">
	  			<label for="mail" class="col-sm-1 control-label pull-left">Email</label>
	  				<div class="col-sm-1">
	  				</div>
	  				<div class="col-sm-6">
	   					<input type="text" class="form-control"   name="username" value="">
	  				</div>
	 		</div>
	 		<div class="form-group">
	  			<label for="pass" class="col-sm-2 control-label pull-left">Password</label>
	  				<div class="col-sm-6">
	   					<input type="password" class="form-control"   value="" name="password">
	  				</div>
	 		</div>
	 		<div class="form-group">
	  			<div class="col-sm-offset-2 col-sm-10">
	   				<div class="checkbox">
	    				<label>
	     					<input  type="checkbox"  name="ControlRequest"> Remember me
	    				</label>
	   				</div>
	  			</div>
	 		</div>
	 		
	 		<div class="row">
	  			<div class="col-sm-offset-2 col-sm-3">
	   				<button type="submit" class="btn btn-success" value="true" name="login">Login</button>
	  			</div>
	  			<div class="col-sm-offset-2">
	  			<a href="<c:url value="registration"/>" class="btn btn-primary">Registration</a>
	  			</div>
	 		</div>
	 		
	   				
	  			
	 	</form>

			<p style="text-indent: 10px">
				<c:if test="${param.error != null}">
				Invalid login or password. Please check and try again.
			</c:if>
			</p>

			<c:if test="${confim != null}">
			<br>
			<br>
			<div class="col-xs-1"></div>
				<div class="col-sm-8 alert alert-warning fade in">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">×</button>
					<strong>${confim}</strong>
				</div>

			</c:if>
			
		</div>
</div>

	
</body>
</html>