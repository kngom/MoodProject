<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/>
<c:set var = "result" value = "${param.result }"/>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
			<!-- 제이쿼리 ui css -->
            <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
            <!-- 제이쿼리  style css -->
            <link rel="stylesheet" href="/resources/demos/style.css">
            <!-- 제이쿼리 js -->
            <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
            <!-- 제이쿼리 ui js-->
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<!-- 다음 API -->
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<link href="${contextPath}/resources/css/member.css" rel="stylesheet" type="text/css">
			<script src="${contextPath}/resources/js/member.js"></script>	
			
</head>
<body>
	<jsp:include page ="../common/topMenu.jsp"></jsp:include>
	
	<div class="container">
	<div class="container" style="text-align:center;">
		<div id="membertitle"><h4 id="titlesection1">작성한글</h4><h1 id="titlesection2">회원정보</h1><h4 id="titlesection3">주문내역</h4></div>
		<div id="membertitle2" ><h4 id="titlesection4">회원정보</h4><h1 id="titlesection5">주문내역</h1><h4 id="titlesection6">작성한글</h4></div>
		<div id="membertitle3"><h4 id="titlesection7">주문내역</h4><h1 id="titlesection8">작성한글</h1><h4 id="titlesection9">회원정보</h4></div>
		<div id="membertitle2" style="display:none;"><label><input type="chedckbox" style="display:none;" name="ordernameid" id="ordernameid" value="l" <c:if test="${membertitle2=='l'}">checked</c:if>><h4 id="titlesection4">회원정보</h4><h1 id="titlesection5">주문내역</h1><h4 id="titlesection6">작성한글</h4></label></div>
	</div>
	<div class="container" id="membertable" style="text-align:center;">
		<form class="form-horizontal" method="post" id="memInfo" name="memInfo" action="${contextPath}/member/memberUpdate.do">
			<div class="form-group">
				<button type="button" id="updatepage"><h4>정보수정하기</h4></button>
			</div>
			<div class="form-group">
				
				<label class="col-sm-5 control-label">아이디</label>
				<div class="col-sm-2">
				<input type="text" class="form-control" id="userID" name="userID" maxlength="20" value="${member1.userID}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">
				비밀번호
				</label>
				<div class="col-sm-2">
				<input type="text" class="form-control" id="pwdpwd" name="pwd" maxlength="20" value="${member1.pwd}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">
				이름
				</label>
				<div class="col-sm-2">	
				<input type="text" class="form-control" id="name" name="name" maxlength="20" value="${member1.name}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">
				우편번호
				</label>
				<div class="col-sm-2">
				<input type="text" class="form-control" id="postnum" name="postnum" maxlength="20" value="${member1.postnum}" readonly/>
				</div>
				<div class="col-sm-2">	
					<input type = "button" style="display:none;" id="searchpostnum" class = "form-control postBtn" onclick = "daumZipCode()" value = "우편번호 검색"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">
				주소
				</label>
				<div class="col-sm-6">
				<input type="text" class="form-control" id="address1" name="address1" maxlength="20" value="${member1.address1}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">
				상세주소
				</label>
				<div class="col-sm-6">
				<input type="text" class="form-control" id="address2" name="address2" maxlength="20" value="${member1.address2}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">
				전화번호
				</label>
				<div class="col-sm-3">
				<input type="text" class="form-control" id="phone" name="phone" maxlength="20" value="${member1.phone}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">성별</label>
				<div class="col-sm-2">
				<input type="text" class="form-control" id="gender" name="gender" maxlength="20" value="${member1.gender}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">
				생일
				</label>
				<div class="col-sm-3">
				<input type="text" class="form-control" id="age" name="age" maxlength="20" value="${member1.age}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">
				이메일
				</label>
				<div class="col-sm-3">
				<input type="text" class="form-control" id="email" name="email" maxlength="20" value="${member1.email}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label">가입일자</label>
				<div class="col-sm-3">
				<input type="text" class="form-control" id="joinDate" name="joinDate" maxlength="20" value="${member1.joinDate}" readonly/>
				<input type="hidden" class="form-control" id="grade" name="grade" maxlength="20" value="${member1.grade}" readonly/>
				</div>
			</div>
			<div class="form-group" id="mypagebuttonbox">
				<button type="button" id="updateinfo" style="display:none;" onclick="fn_memberUpdate();"/>수정하기</button>
				<button type="button" id="registerbtn">회원탈퇴</button>
			</div>
		</form>
	</div>
	
	<!-- 게시글 관련 테이블 -->
	<div class="container" style="text-align:center;">
		<table id="membertable3" style=" margin-bottom:500px;">
			<tr class="thead">
				<td style="width:10%;">게시글번호</td>
				<td style="width:50%;">게시글제목</td>
				<td style="width:20%;">작성일자</td>
			</tr>
			<c:forEach var="board" items="${boardList}">
			<tr>
				<td>${board.qna_bno}</td>
				<td><a href="/board/boardDetail?qna_bno=${board.qna_bno}">${board.qna_subject}</a></td>
				<td>${board.qna_regDate}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<!-- 구매내역 테이블 -->
	<div class="container" style="text-align:center;">
		<table id="membertable2" style=" margin-bottom:500px;">
			<tr class="thead">
				<td style="width:10%;">상품번호</td>
				<td style="width:10%;">상품수량</td>
				<td style="width:40%;">상품이름</td>
				<td style="width:20%;">상품사이즈</td>
				<td style="width:20%;">구매일자</td>
			</tr>
			<c:choose>
				<c:when test="${not empty orderList}">
					<c:forEach var="order" items="${orderList}">
					<tr style="width:100%;">
						<td>${order.product_code}</td>
						<td>${order.product_amount}</td>
						<td><a href="/order/orderCompleteDetail?order_num=${order.order_num}">${order.product_name}</a></td>
						<td>${order.product_size}</td>
						<td>${order.order_date}</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<td colspan='5'>주문내역이없습니다</td>
				</c:otherwise>
			</c:choose>	
		</table>
	</div>
	
	<!-- 회원탈퇴 비밀번호확인 모달창 -->
	<div id="removememberFormbox">
		<form class = "form-horizontal" method = "post" action = "${contextPath}/member/removeMember.do">
	    <div id="membermodal" class="membermodal-overlay">	
	        <div class="membermodal-window">
	            <div class="title form-group">
	                <h2>회원탈퇴</h2>
	            </div>
	            <div class="memberclose-area">X</div>
	            
	            <div class = "form-group">
		            <div style="padding-top:20px;"><h4>ID</h4></div>
		            <div class="content"><input type = "text" class = "form-control" id = "loginUserID" name ="userID" maxlength="20" value="${member1.userID}" readonly/></div>
		        </div>
		        <div class = "form-group">    
		            <div><h4>PASSWORD</h4></div>
		            <div class="content"><input type = "password" class = "form-control" id = "pwdpwd" name ="pwdpwd" maxlength="20" placeholder="비밀번호"/></div>
	            </div> 
	             <div class = "form-group">    
		            <div><h4>REPASSWORD</h4></div>
		            <div class="content"><input type = "password" class = "form-control" id = "repwd" name ="repwd" maxlength="20" placeholder="비밀번호"/></div>
	            </div> 
	            <div class="content form-group">
					<button type="button" class = "btn btn-light" id="removeuserbtn" onclick = "fn_removeMyMember('${member1.userID}')">회원탈퇴</button>
	            </div>
	        </div>
	   	</div>
	   	</form>
	  </div>
	 </div> 		
				<div>
					<input type="hidden" id = "userID" value="${member1.userID }">
					<input type="hidden" id="userGrade" value="${member1.grade}"/>
				</div>
	
	<jsp:include page ="../common/footer.jsp"></jsp:include>
	
	<c:choose>
		<c:when test = "${result == 'removeMember' }">
			<script>
			window.onload = function(){
				alert("\n회원탈퇴가 완료되었습니다.");
			}
			</script>
		</c:when>
	</c:choose>
</body>
</html>

