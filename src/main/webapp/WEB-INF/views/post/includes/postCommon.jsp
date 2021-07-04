<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- Begin Page Content -->
<div class="form-group">
	<!-- VO, name, Class, id, readonly, HTML태그종류 -->
	<label>아이디</label> <input name="id" class="form-control" value="${post.id}" readonly="readonly">
</div>

<div class="form-group">
	<label>제목</label>
	<input id="title" class="form-control" name="title" value="${post.title}" readonly="readonly"></input>
</div>

<!-- id값으로 content를 그대로 사용하는것은 위험 -->
<div class="form-group">
	<label>내용</label>
	<textarea id="txacontent" class="form-control" name="content" rows="3"
		readonly="readonly">${post.content}</textarea>
</div>


<div class="form-group">
	<label>작성자</label> 

	<!-- 생성 시는 로그인한 사용자 이름 출력
	R, U 를 할 시에는 작성자 이름을 출력.
	 -->	 
	 <c:choose>
    <c:when test="${empty post}">
        <input class="form-control" value=' <sec:authentication property="principal.curUser.name"/>' readonly="readonly">  
    </c:when>
    <c:otherwise>
       <input class="form-control" value="${post.writer.name}" readonly="readonly">
    </c:otherwise>
</c:choose>
</div>


<div class="form-group">
	<label>조회수 </label><input value="${post.readCnt}" readonly="readonly"> 
	<label>좋아요 </label><input value="${post.likeCnt}" readonly="readonly"> 
	<label>싫어요 </label><input value="${post.dislikeCnt}"readonly="readonly">
</div>

<div class="form-group">
	<label>등록시점 : </label>
	<fmt:formatDate pattern="yyyy-MM-dd" value="${post.registrationDate}" />
	<label>, 수정시점 :</label>
	<fmt:formatDate pattern="yyyy-MM-dd" value="${post.updateDate}" />
</div>
<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
<script>
	// 수정 처리시 title, content 에는 readonly는 없어야함 
	// 신규 처리시 title, content 에는 value와 readonly는 없어야함 
	function controlInput(includer) {
		if (includer === '수정' || includer === '신규') {
			$('#title').attr("readonly", false);
			$('#txacontent').attr("readonly", false);
		}
	}
</script>