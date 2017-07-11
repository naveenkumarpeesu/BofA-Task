<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgonerd="false" %>

<html>
<head>
<style>
body {
	background-color: lightblue;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}
</style>
<title>List Of Candidates</title>
</head>
<body>
<c:out value="${can}"></c:out> 
	<table>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email ID</th>
				<th>Action</th>


			</tr>
			 <c:forEach var="candidate" items="${candidates}" >
				<tr>
					<td><c:out value="${candidate.firstName}" /></td>
					<td><c:out value="${candidate.lastName}" /></td>
					<td><c:out value="${candidate.email}" /></td>
					<td><c:forEach var="framework" items="${user.framework}" varStatus="loop">
						${framework}
    					<c:if test="${not loop.last}">,</c:if>
						</c:forEach></td>
					<td><spring:url
							value="/updateCandidate/${candidate.candidateId}/addInterview"
							var="userUrl" /> <spring:url
							value="/updateCandidate/${candidate.candidateId}/delete"
							var="deleteUrl" /> <spring:url
							value="/updateCandidate/${candidate.candidateId}/addFeedback"
							var="updateUrl" />

						<button class="btn btn-info" onclick="location.href='${userUrl}'">Add
							Interview</button>
						<button class="btn btn-primary"
							onclick="location.href='${updateUrl}'">Feedback</button>
						<button class="btn btn-danger"
							onclick="this.disabled=true;post('${deleteUrl}')">Delete</button></td>
						
				</tr>
			</c:forEach>	
		</table>
<%--

 <table width="496"  align="center"  bgcolor="#000000">
         
            <tr bgcolor="#333333" > 
              <td width="63" height="30" align="center"><font color="#FFFFFF" size="2">First Name</font></td>
               <td width="69" align="center" ><font color="#FFFFFF" size="2">last name</font></td>
              <td width="67" align="center"><font color="#FFFFFF" size="2">email</font></td>
 
    </tr>
 <%
String firstName=null;
String lastName=null;
String email=null;

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
	
	String s1="select * from CANDIDATE_DETAILS";
	PreparedStatement ps=con.prepareStatement(s1);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		firstName=rs.getString(4);
		lastName=rs.getString(6);
         email=rs.getString(2);
         %>
         <tr bgcolor="#FFFFFF"> 
             <td height="31" align="center"><strong><em><font color="#008400">
          
               </font></em></strong></td>
           <td align="center"><strong><em><font color="#008400"><%=firstName%></font></em></strong></td>
           <td align="center"><strong><em><font color="#008400"><%=lastName%></font></em></strong></td>
           <td align="center"><strong><em><font color="#008400"><%=email%></font></em></strong><href="action.jsp">action</href></td>
           
   </tr>
         <%

	}
	
	
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

 </table>
  --%>
		<%-- <tr>
<td><c:out value="${candidate.id}"/></td>
        <td> <c:out value="${candidate.fname}"/></td>
        <td> <c:out value="${candidate.lname}"/></td>  
        <td> <c:out value="${candidate.email}"/></td>
         <td> <c:out value="${employee.doj}"/></td>  
        <td> <c:out value="${employee.mailid}"/></td>
   </tr> --%>
	
	
</body>
</html>