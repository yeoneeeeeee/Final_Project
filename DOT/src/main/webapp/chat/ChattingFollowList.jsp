<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<c:if test="${empty follow }">
	<div class="empty-follow-info">
		<div class="empty-follow">
			<span>존재하는 팔로우가 없습니다.</span>
		</div>
	</div>
</c:if>
<c:if test="${!empty follow }">
	<c:forEach var="f" items="${follow }">
		<dt>
			<div>
				<img src="${contextPath}/${f.filePath}/${f.changeName}" /> <label
					for="addFriend1">${f.userNick }</label>
			</div>
			<input type="checkbox" id="addFriend1" name="userNo"
				value="${f.userNo }" />
		</dt>
	</c:forEach>
</c:if>

