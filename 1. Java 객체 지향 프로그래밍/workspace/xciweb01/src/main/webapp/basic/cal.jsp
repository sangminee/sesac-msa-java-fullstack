<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%-- page directive --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	// scriptlet 
	Calendar c = Calendar.getInstance();

	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH)+1;
	
	c.set(year, month-1, 1); // 이번달 1일로 세팅됨 
	int week = c.get(Calendar.DAY_OF_WEEK); // 1일이 무슨 요일인지 출력 
	int endday = c.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	// 이전 달의 마지막 날 계산
	c.set(Calendar.MONTH, -1);
	int preMonthEndDay = c.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	System.out.println(week + " " + endday);
	// 원래 달로 다시 설정 
	c.add(Calendar.MONTH, 1);
	c.set(year, month+1,1);
	
	// 다음달
	int nextMonthDay = c.get(Calendar.DAY_OF_WEEK);
	System.out.println(nextMonthDay);
%>
<table border=1>
	<caption><%=year%>.<%=month%></caption> <%-- expression --%>
	<tr>
		<th>일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
	</tr>
	<tr>
	<% 
	int a = preMonthEndDay-week+2;
	for(int d=a; d<=preMonthEndDay; d++){
		out.println("<td>" + d + "</td>");
	}
	for(int d=1, w=week; d<=endday; d++, w++) { 
		out.println("<td>" + d + "</td>");
		 if(w%7==0) out.println("</tr></tr>");
	}
	
	for(int w=1; w<=nextMonthDay; w++){
		out.println("<td>" + w +"</td>");
	}
	
	%>

<!-- 	
	<% 
		for(int w=1; w<week; w++){
		 	%>  <td> </td> <%	
		}
	    for(int d=1, w=week; d<=endday; d++, w++) { 
			if(d < 10){
				%> <td><%=d%></td> <% 
			}else{
				%> <td><%=d%></td> <%
			}
			if(w % 7 == 0){
				%> </tr>  <tr><% 
			}
		 } %> -->
			
	</tr>
</table>
</body>
</html>