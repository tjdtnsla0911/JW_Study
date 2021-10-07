<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

</head>
<body>

<!-- nav관련 (원래는 공통으로 빼서해야하는데 일단 처음이라 걍 박으세요 불편함을 알아야 나중에 공통으로뺌 -->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">

		<a class="navbar-brand" href="#">진짜 간단하게 테스트할거</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample03" aria-controls="navbarsExample03"
			aria-expanded="false" aria-label="Toggle navigation">

			<span class="navbar-toggler-icon"></span>

		</button>

		<div class="collapse navbar-collapse" id="navbarsExample03">

			<ul class="navbar-nav mr-auto">

				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="sr-only">(current)</span></a></li>
				
				<li class="nav-item"><a class="nav-link" href="signup"><span
						style="color: blue">회원가입하기</span></a></li>

				<li class="nav-item"><a class="nav-link disabled" href="#"><span
						style="color: red">미구현</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown03"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">미구현</a>

					<div class="dropdown-menu" aria-labelledby="dropdown03">

						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
					</div></li>
			</ul>

			<form class="form-inline my-2 my-md-0">

				<input class="form-control" type="text" placeholder="Search">

			</form>

		</div>

	</nav>
<!-- -------------------------------------------------------------------------- -->
<article class="container">
	<div class="page-header">
		<div class="col-md-6 col-md-offset-3">
			<h3>회원가입 Form</h3>
		</div>
	</div>
	<div class="col-sm-6 col-md-offset-3">
		<form role="form">
			<div class="form-group">
				<label for="inputName">성명</label> <input type="text"
					class="form-control" id="memberId" placeholder="이름을 입력해 주세요">
			</div>

			<div class="form-group">
				<label for="inputName">아이디</label> 
				<input type="text"
					class="form-control" id="memberAcount" placeholder="아이디를 입력해주세요">
			</div>
			<button type="button" class="btn btn-primary" id="idCheck" onclick="CheckId()">중복체크</button>

			<div class="form-group">
				<label for="inputPassword">비밀번호</label> <input type="password"
					class="form-control" id="memberPassword" placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="form-group">
				<label for="inputPasswordCheck">비밀번호 확인</label> <input
					type="password" class="form-control" id="memberPassword2"
					placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
			</div>
			<div class="form-group">
				<label for="inputMobile">나이</label> <input type="text"
					class="form-control" id="inputMobile">
			</div>
			<div class="form-group">
				<label for="inputtelNO">주소</label> <input type="text"
					class="form-control" id="memberAdd">
			</div>

			<div class="form-group">
				<label for="inputtelNO">성별</label> <input type="text"
					class="form-control" id="memberGender">
			</div>

			<div class="form-group">
				<label>약관 동의</label>
				<div data-toggle="buttons">
					<label class="btn btn-primary active"> <span
						class="fa fa-check"></span> <input id="agree" type="checkbox"
						autocomplete="off" checked>
					</label> <a href="#">이용약관</a>에 동의합니다.
				</div>
			</div>

			<div class="form-group text-center">
				<button type="submit" id="join-submit" class="btn btn-primary">
					회원가입<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="submit" class="btn btn-warning">
					가입취소<i class="fa fa-times spaceLeft"></i>
				</button>
			</div>
		</form>
	</div>

</article>
</body>

<script>


const CheckId = () => {
	
	console.log('클릭됬다!!!');
	const memberAcount = document.getElementById('memberAcount').value;
	console.log('받은 아이디는? = ',memberId);
	
	
	 $.ajax({
		 //원래는 data: 내가넣을데이터, 이것도 추가해야하는데 어차피 한개보내는거라 url에 담아보내겟습니다
	        type:'GET',//뭘로보낼래? get post put delete중에 우린 포스트로 보내겟습니다
	        url : '/checkId/'+memberAcount, //쿼리스트링형시으로 보내겟다는거임 
	        contentType: 'application/json; charset=utf-8', //이놈은 전송할데이터타입인데 잘이해안가면 현재는 걍 이걸로 때려박으세요(내가 보내는 데이터타입)
	        dataType: 'text', //대세는 JSON을 받는거지만 우리는 잇냐없냐만 받으면되서 text으로하겟습니다 (이건 내가 돌려받을 response타입)d     
	        
	        success : function(data){//성공시 처리
	        	console.log(data);
	        
	        	if(data == 0){
	        		//사용하고잇는 사람이 0명일때
	        		document.getElementById("memberAcount").style.border = "3px solid blue";
	        		alert('사용할수있는 아이디입니다!');
	
	        	}else if(data == 1){
	        		//사용하고 잇는사람이 1명일떄
	        		 document.getElementById("memberAcount").style.border = "3px solid red";
	        		alert('중복된 아이디 이므로 사용할수없습니다');
	              
	        	}else{
	        		//사용하고있는사람이 0명도아니고 1명도아니고 즉, 2명이상이거나 마이너스일때 ㅋㅋ
	        		 document.getElementById("memberAcount").style.border = "3px solid red";
	        		alert('이건 나오면 ㅋㅋ 안됨 ㅋㅋㅋ');
	        	}
	         	
	        },
	        
	        error:function(request,status,error){ //실패시처리
	        	console.log(request);
	        	console.log(error);
	        	console.log(status);
	           alert('실패햇어 ㅠㅠㅠ');
	       }
	        
	    });
	}

</script>


</html>