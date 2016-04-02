
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
<link rel="stylesheet" href='<c:url value="/css/registration.css"/>'/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Control-Request</title>
</head>
<body>

<form class="form-horizontal" action="<c:url value="/registration-confim"/>" method="POST">
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"/>

	<div class="Absolute-Center is-Responsive">
		<div class="control-group">

			<div class="control-group">
				<!-- E-mail -->
				<label class="control-label" for="name">E-mail</label>
				<div class="controls">
					<input type="text"  name="name" placeholder=""
						class="form-control">
					<p class="help-block">Please provide your E-mail</p>
				</div>
			</div>

			<!-- Username -->
			<label class="control-label" for="lfName">Last Name and First Name </label>
			<div class="controls">
				<input type="text" id="lfName" name="lfName" placeholder=""
					class="form-control">
				<p class="help-block">Last Name and First Name  can contain any letters</p>
			</div>
		</div>

		<div class="control-group">
			<!-- Password-->
			<label class="control-label" for="password">Password</label>
			<div class="controls">
				<input type="password" id="password" name="password" placeholder=""
					class="form-control">
				<p class="help-block">Password should be at least 4 characters</p>
			</div>
		</div>

		<div class="control-group">
			<!-- Password -->
			<label class="control-label" for="password_confirm">Password
				(Confirm)</label>
			<div class="controls">
				<input type="password" id="password_confirm"
					name="password_confirm" placeholder="" class="form-control">
				<p class="help-block">Please confirm password</p>
			</div>
		</div>

		<div class="control-group">
			<!-- Button -->
			<div class="controls">
				<button type="submit" class="btn btn-success">Register</button>
			</div>
		</div>
	</div>

</form>



</body>
</html>