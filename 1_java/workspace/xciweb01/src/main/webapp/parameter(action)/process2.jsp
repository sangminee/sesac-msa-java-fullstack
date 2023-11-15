<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Map<String, String[]> paramMap = request.getParameterMap();	
   
	/*	
	String name = request.getParameter("name");
	String phone = request.getParameter("phone"); 
	
	String field = request.getParameter("field");
	String[] hobby = request.getParameterValues("hobby");
	
	String gender = request.getParameter("gender");
	String motive = request.getParameter("motive");
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	for(String key : paramMap.keySet()){
		String[] values = paramMap.get(key);
		
		if(values.length > 1){
			for(int i=0; i<values.length; i++){
				out.println(key + ":" + values[i]+"<br/>");
			}
		}else{
			out.println(key + ":" + values[0]+"<br/>");
		}
		
	}
%>

<%-- 
name : <%=name%><br/>
phone : <%=phone%><br/>
성별 : <%=gender%><br/>
지원동기 : <%=motive%><br/>
지원분야 : <%=field%><br/>

성별 : 
<%
if(gender.equals(1)){
	out.println("남자");
}else out.println("여자");

if(hobby != null){
	for(String a : hobby) { 
		out.println("취미 : " + a +"<br/>");
	}
}

%>
*/

--%>

</body>
</html>