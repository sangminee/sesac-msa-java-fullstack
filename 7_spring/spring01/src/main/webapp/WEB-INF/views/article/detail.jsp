<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="${myContextPath}/resources/css/article_style.css">
</head>
<body>
<img src='<c:url value="/resources/img/detail_icon.jpg" />' width="20" />
<img src="${myContextPath}/resources/img/detail_icon.jpg" width="20"/>
<table>
  <caption>게시물 상세보기</caption>
  <tr>
    <th>글번호</th>
    <td>${dto.no}</td>
  </tr>
  <tr>
    <th>제목</th>
    <td>${dto.title}</td>
  </tr>
  <tr>
    <th>이름</th>
    <td>${dto.name}</td>
  </tr>
  <tr>
    <th>내용</th>
    <td>${dto.content}</td>
  </tr>
  <tr>
    <th>작성일</th>
    <td><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
  </tr>
  <tr>
    <th>조회수</th>
    <td>${dto.readcount}</td>
  </tr>
</table><br/>
<a href="update?no=${dto.no}">수정</a> |
<a href="delete?no=${dto.no}">삭제</a> |
<a href="list">리스트</a>
</body>
</html>