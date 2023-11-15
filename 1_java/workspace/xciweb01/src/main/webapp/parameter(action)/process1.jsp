<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reserv" class="beans.Reservation" scope="page"/>
<jsp:setProperty property="*" name="reserv"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
name : <%=reserv.getName()%><br/>
phone : <%=reserv.getPhone()%><br/>
email : <%=reserv.getEmail()%><br/>
</body>
</html>