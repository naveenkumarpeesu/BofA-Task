
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Add Candidate</title>
</head>
<c:if test="${message != null}">
			<c:out value="${message}" />
		</c:if>
<body>
	<form class="form-horizontal" method="post" action="<c:url value='/addCandidate'/>" 
		enctype="multipart/form-data">
		
		<table>
			<tr>
				<td>*First Name :</td>
				<td><input type="text" class="form-control" id="firstName" name="firstName"></input></td>
			</tr>
			<tr>
				<td>*Last Name :</td>
				<td><input type="text" class="form-control" id="lastName" name="lastName"></input></td>
			</tr>
			<tr>
				<td>*Email :</td>
				<td><input type="text" class="form-control" id="email" name="email"></input></td>
			</tr>
			<tr>
				<td>*Resume :</td>
				<td><input type="file" name="resume" id="resume"></input></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Add Candidate" /></td>
			</tr>
		</table>
	</form>
</body>
</html>