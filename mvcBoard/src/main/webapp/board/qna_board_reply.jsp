<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.board.db.*" %>
<%-- <%
	BoardBean board=(BoardBean)request.getAttribute("boarddata");
%>
 --%>
<html>
<head>
	<title>MVC 게시판</title>
	<script language="javascript">
	function replyboard(){
		boardform.submit();
	}
	</script>
</head>
<body>
<!-- 게시판 답변 -->
<form  action="./BoardReplyAction.bo" method="post" name="boardform">
<input type="hidden" name="BOARD_NUM" value="${ boarddata.BOARD_NUM }">
<input type="hidden" name="BOARD_RE_REF" value="${ boarddata.BOARD_RE_REF}">
<input type="hidden" name="BOARD_RE_LEV" value="${ boarddata.BOARD_RE_LEV}">
<input type="hidden" name="BOARD_RE_SEQ" value="${ boarddata.BOARD_RE_SEQ}">

<table>
	<tr>
		<td colspan="2">MVC 게시판</td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td>
			<input name="BOARD_NAME" type="text"/>
		</td>
	</tr>
	<tr>
		<td>제 목</td>
		<td>
			<input name="BOARD_SUBJECT" value="Re: ${ boarddata.BOARD_SUBJECT }"/>
		</td>
	</tr>
	<tr>
		<td>내 용</td>
		<td>
			<textarea name="BOARD_CONTENT"></textarea>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input name="BOARD_PASS" type="password">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr>
		<td colspan="2">
		<a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 답변 -->
</body>
</html>