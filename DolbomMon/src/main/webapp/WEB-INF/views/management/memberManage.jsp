<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="float:right; margin:10px 20px;">
    <div class="row">    
        <div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
				<div class="dropdown">
				  <a class="btn btn-outline-info dropdown-toggle" href="#" role="button" id="serchKey" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    검색 조건
				  </a>
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				    <a class="dropdown-item" href="#">아이디</a>
				    <a class="dropdown-item" href="#">주소</a>
				    <a class="dropdown-item" href="#">성별</a>
				    <a class="dropdown-item" href="#">활동허용</a>
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
	  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    목록 전환
	  </a>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	    <a class="dropdown-item" href="#">모든회원</a>
	    <a class="dropdown-item" href="#">부모님</a>
	    <a class="dropdown-item" href="#">선생님</a>
	  </div>
	</div>
</div>
<table class="table" style="float:clear;">
  <thead class="thead-dark">
    <tr>
      <th scope="col">회원번호</th>
      <th scope="col">아이디</th>
      <th scope="col">이름</th>
      <th scope="col">성별</th>
      <th scope="col">생일</th>
      <th scope="col">연락처</th>
      <th scope="col">비상연락처</th>
      <th scope="col">주소</th>
      <th scope="col">우편번호</th>
      <th scope="col">등록일</th>
      <th scope="col">회원유형</th>
      <th scope="col">등록아동</th>
      <th scope="col">선생님정보</th>
      <th scope="col">활동허용</th>
      <th scope="col">회원메모</th>
      
      
    </tr>
  </thead>
  <tbody>
  <%
  	for(int i=0; i<=10; i++){
  %>
    <tr>
      <th scope="row">1</th>
      <td>test1</td>
      <td>테스트1</td>
      <td>남성</td>
      <td>2000-01-01 / 08-19</td>
      <td>010-1234-1234</td>
      <td>없음</td>
      <td>서울시 마포구 백범로 1010-1010</td>
      <td>01010</td>
      <td>2020-05-05</td>
      <td>선생님</td>
      <td><a href="#">아동보기</a></td>
      <td><a href="#">선생님정보</a></td>
      <td>
        <select class="form-control" id="activity">
            <option value="A">활동허용</option>
            <option value="B">활동중지</option>
        </select>
	</td>
      <td><a href="#">회원메모...</a></td>
    </tr>
   <%
 	}
   %>
  </tbody>
</table>

<tr/>
