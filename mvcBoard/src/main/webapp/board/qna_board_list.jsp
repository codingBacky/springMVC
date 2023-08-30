<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.board.db.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
   <title>MVC 게시판</title>
</head>
<style>
	table{
		width : 80%
		
	}
	table, thr, td, th{
		border : 1px solid black;
		border-collapse : collapse;
	}
	th.no{ width: 9%}
	th.title{ width: 40%}
	th.writer{ width: 19%}
	th.regiDate{ width: 19%}
	th.ReadCnt{ width: 9%}
	
</style>

<body>
<!-- 게시판 리스트 -->

<table >

<c:if test="${listcount > 0}">
   <tr>
      <td colspan="4">MVC 게시판</td>
      <td>글 개수 : ${listcount }</td>
   </tr>
   
   <tr>
      <th class="no">번호</th>
      <th class="title">제목</th>
      <th class="writer">작성자</th>
      <th class="regiDate">날짜</th>
      <th class="ReadCnt">조회수</th>
   </tr>
   <c:forEach var="board" items="${boardlist}">
      <tr>
         <td>
            ${board.getBOARD_NUM()}
         </td>
         
         <td>
            <c:choose>  
               <c:when test="${board.getBOARD_RE_LEV()!=0}"> <!-- if와 동일 -->
                  <c:forEach var="i" begin="0" end="${board.getBOARD_RE_LEV()}">
                      &nbsp;&nbsp;
                  </c:forEach>
                  ▶
               </c:when> 
               <c:otherwise> 
                  ▶
               </c:otherwise> 
            </c:choose>
            <a href="./BoardDetailAction.bo?num=${ board.getBOARD_NUM() }">
               ${board.getBOARD_SUBJECT()}
            </a>
         </td>
         
         <td>${ board.getBOARD_NAME() }</td>
         <td>${ board.getBOARD_DATE() }</td>   
         <td>${board.getBOARD_READCOUNT() }</td>
      </tr>
   </c:forEach>
   <tr>
      <td>
         <c:choose>  
            <c:when test="${page<=1}"> 
               [이전]&nbsp;
            </c:when>
            <c:otherwise> 
               <a href="./BoardList.bo?page=${page-1}">[이전]</a>&nbsp;
            </c:otherwise> 
         </c:choose>
         
         <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
             <c:choose>  
               <c:when test="${a==page}"> 
                  [${a}]
               </c:when>
               <c:otherwise> 
                  <a href="./BoardList.bo?page=${a}">[${a}]</a>&nbsp;
               </c:otherwise> 
            </c:choose>
         </c:forEach>

         <c:choose>  
            <c:when test="${page>=maxpage}"> 
               [다음]
            </c:when>
            <c:otherwise> 
               <a href="./BoardList.bo?page=${page+1}">[다음]</a>
            </c:otherwise> 
         </c:choose>
      </td>
   </tr>
</c:if>
 <c:if test="${empty boardlist}">
    <tr >
      <td colspan="4">MVC 게시판</td>
      <td>등록된 글이 없습니다.</td>
   </tr>
</c:if>

   <tr>
      <td colspan="5">
            <a href="./BoardWrite.bo">[글쓰기]</a>
      </td>
   </tr>
</table>

</body>
</html>