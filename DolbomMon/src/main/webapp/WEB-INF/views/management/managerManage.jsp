<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		$("#mrBtn").click(function(){
			memberPage("/dbmon/managerRegister");
		});
	})
</script>

<div style="float:right; margin:10px 20px;">
    <div class="row">    
        <div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
				<div class="dropdown">
				  <a class="btn btn-outline-dark dropdown-toggle" href="#" role="button" id="serchKey" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    검색 조건
				  </a>
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				    <a class="dropdown-item" href="#">이름</a>
				    <a class="dropdown-item" href="#">직급</a>
				    <a class="dropdown-item" href="#">부서</a>
				  </div>
				</div>
                <input type="hidden" name="search_param" value="all" id="search_param">         
                <input type="text" class="form-control" name="x" placeholder="검색어 입력">
                <span class="input-group-btn">
                    <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                </span>
            </div>
        </div>
	</div>
</div>

<div style="float:clear; margin:10px 20px; width:100px">
	<div class="dropdown">
	  <a class="btn btn-info dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    관리자 등급
	  </a>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	    <a class="dropdown-item" href="#">1등급</a>
	    <a class="dropdown-item" href="#">2등급</a>
	    <a class="dropdown-item" href="#">3등급</a>
	    <a class="dropdown-item" href="#">4등급</a>
	  </div>
	</div>
</div>

<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">관리자번호</th>
      <th scope="col">아이디</th>
      <th scope="col">이름</th>
      <th scope="col">부서</th>
      <th scope="col">직책</th>
      <th scope="col">연락처</th>
      <th scope="col">등록일</th>
      <th scope="col">권한</th>
    </tr>
  </thead>
  <tbody>
   	<%
  		for(int i=0; i<=10; i++){
  	%>
    <tr>
      <th scope="row">1</th>
      <td>test2</td>
      <td>관리자1</td>
      <td>유지보수팀</td>
      <td>과장</td>
      <td>010-1231-1231</td>
      <td>2020-01-01</td>
      <td>2등급</td>
    </tr>
    <%
  		}
    %>
  </tbody>
</table>