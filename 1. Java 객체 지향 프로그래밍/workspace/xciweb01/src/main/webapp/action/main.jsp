<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	margin: 0px;
}
table{
	width: 1180px;
}
#top{
	height:150px; 
	background-color:yellow;
}
#menu {
   width:250px; 
   background-color:red; 
   height:450px
}
#content {
   background-color:green;
}
</style>
</head>
<body>
<% 
	String msg = "안녕하세요~"; 
%>

<table>
<tr>
	<td colspan="2" id="top">
		<jsp:include page="top.jsp">
   			<jsp:param name="msg" value="<%=msg%>" />
   		</jsp:include>
	</td> 
</tr>
<tr>
   <td id="menu"><jsp:include page="menu.jsp"/></td>
   <td id="content"><jsp:include page="content.jsp"/></td>
</tr>
</table>

</body>
</html>