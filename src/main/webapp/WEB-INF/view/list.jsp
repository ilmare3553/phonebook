<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="pb" items="${list}">
<%-- <li onclick="location.href='getPhonebook?idx=${pb.idx}'" > --%>
<li style="list-style-type: none" onclick="getPhonebook('${pb.idx}')">
<img src="https://item.kakaocdn.net/do/b6e0f1175f0e0cc865dcb84e8c519c21f43ad912ad8dd55b04db6a64cddaf76d" style="width:20px;height:20px">
<c:out value="${pb.name}"/><br>
<c:out value="${pb.hp}"/><br>
<c:out value="${pb.memo}"/><br>
</li>
</c:forEach>