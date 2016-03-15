<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="SHORTCUT ICON" href='<c:url value="/images/favicon.ico"/>' type="image/x-icon">
<script type="text/javascript" src='<c:url value="/js/jquery-1.12.0.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/list-acc.js"/>'></script>
<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'/>
<link rel="stylesheet" href='<c:url value="/css/table.css"/>'/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Control-Request</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<h3>Hello, ${name}</h3>
			<div class="navbar navbar-inverse">
				<div class="collapse navbar-collapse js-navbar-collapse">
					<ul class="nav navbar-nav js-nav-add-active-class">
           				<li><a href="<c:url value="/"/>"><span class="glyphicon glyphicon-home"></span> </a></li>
           			</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="true">My
								account <span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="<c:url value="all-list"/>"><span
										class="glyphicon glyphicon-file"></span> All requests</a></li>
								<li><a href="<c:url value="/settings"/>"> <span
										class="glyphicon glyphicon-cog"></span> Settings
								</a></li>
								<li class="divider"></li>
								<li>
								<a href="javascript:void(0)"
									onClick="document.forms['formout'].submit()"> <span
										class="glyphicon glyphicon-off"></span> Exit
								</a>
									<form name="formout" method="POST"
										action="<c:url value="/logouth"/>">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token }" />
									</form>
								</li>
							</ul>
						</li>
					</ul>
				</div>

			</div>
		</div>

	</div>
	
	<div class="container">
		<hr>
	<div class="row">	
		<div class="col-md-3">	
			<p>Your id: ${id}</p>
			<p>Your departament: ${departament}</p>
		</div>
	</div>
	<br>
	<form  method="POST" action="<c:url value="/settings/change"/>" >
	  	<div class="row">	
			<div class="col-md-3">	
		  		<select class="form-control" id="dep" name="id">
		  		<c:forEach items="${departaments}" var="departaments">
		  				<option value="${departaments.id}">${departaments}</option>
		  		</c:forEach>
		    	</select>
	    </div>
	    <button class="btn btn-success" type="submit">Change</button>
	    </div>
	    
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	</form>
	<br>
	<p>Add departament</p>
	<form  method="POST" action="<c:url value="/settings/add-dep"/>" >
	  	<div class="row">	
			<div class="col-md-3">
	  			<input class="form-control " name="titleDep">
	    	</div>
	    	<button class="btn btn-success" type="submit">Add</button>
	    </div>
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	</form>
	<br>
	<p>Delete departament</p>
	<form  method="POST" action="<c:url value="/settings/delete-dep"/>" >
	  	<div class="row">	
			<div class="col-md-3">	
		  		<select class="form-control" name="id">
		  		<c:forEach items="${departaments}" var="departaments">
		  				<option value="${departaments.id}">${departaments}</option>
		  		</c:forEach>
		    	</select>
	    </div>
	    <button class="btn btn-danger" type="submit">Delete</button>
	    </div>
	    
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	</form>
	<br>
	<p>Delete your account!<p>
	</div>
	
	
	
	<script>
		$("select#dep").val("${departament.id}");
	</script>
	
</body>
</html>