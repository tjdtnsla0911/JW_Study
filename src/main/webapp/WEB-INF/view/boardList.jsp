<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JTSL을 쓰기위한 코어 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 최신 컴파일 및 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<!-- 옵션 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- jQuery library 부트스트랩을 사용하려면 jQuery가 필요함-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- 최신 컴파일 및 최소화된 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

</head>
<body>

	<!-- ---테이블영역-------- -->
	<div class="container">
		<h2>게시판</h2>
		<p>
			<b>글쓴이는 시퀀스1번으로만갑니다. (나중에 회원가입/로그인 하고할꺼임)</b>
		</p>
		<table class="table">
			<thead>
				<tr>
					<th>게시글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>이미지여부</th>
					<th>올린시간</th>
				</tr>
			</thead>
			<tbody>

				<tr class="info">
					<td>테스트</td>
					<td>테스트</td>
					<td>테스트</td>
					<td>테스트</td>
					<td>테스트</td>
				</tr>
			</tbody>
		</table>
		<br />
		<!-- 글쓰기버튼 -->
		<!-- data-target="#write" 요놈으로 앞에 #붙여서 모달 지정한다 -->
		<button class="btn btn-outline-secondary" style="float: right;"
			data-toggle="modal" data-target="#write" id="modalStart">
			<b>글쓰기</b>
		</button>
	</div>
	<!--------테이블 영역끝------  -->


</body>

<!---Modal 영역 -->
<!-- 지정받은걸 id에 적으면 #타겟 적은걸 누르면 이게실행된다-->
<div class="modal fade" id="write" role="dialog">
	<!-- 사용자 지정 부분① : id명 -->
	<div class="modal-dialog">

		<!-- Modal content-->

		<div class="modal-content">

			<div class="modal-header">
				<h4 class="modal-title">글을적어봅시다</h4>
				<!-- 사용자 지정 부분② : 타이틀 -->
			</div>

			<div class="modal-body" style="margin-bottom: 50px">


				<b>글제목</b>
				<div class="form-group">
					<input type="text" class="form-control form-control-user"
						id="title" placeholder="">
				</div>
				<!-- 테스트어레어 -->
				<div class="small-10 columns" style="margin-top: 15px;">
					<label style="color: black;"> 글내용</label>
					
					<textarea class="form-control span12" name="content" id="boardContent"
						rows="10" cols="100" placeholder="Enter your email content"
						data-validation-required-message="Please enter your message"
						minlength="5" data-validation-minlength-message="Min 5 characters"
						data-toggle="tooltip"
						title="Input Message Content between 50 to 500" required></textarea>
				</div>

				<div class="form-group">
					<b>이미지파일첨부</b> <input type="file" name="imageFileName"
						id="uploadImage" onchange="readURL(this);"> <img
						id="preview" src="#" width="200" height="200" />
				</div>

			</div>

			<div class="form-group">


				<button type="button" class="btn btn-primary"
					style="float: right; margin-top: -33px"
					onclick="simple_Writing(this)">글작성하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal"
					style="float: right; margin-top: -33px">글작성취소</button>

			</div>
		</div>
	</div>
</div>
<!-- Modal 영역끝 -->

<!-- 자바스크립트영역 -->
<script>
//사진미리보기 간만에 제이쿼리좀씀
const readURL = (input) =>{
   //이름붙인놈을 가져온다
   const uploadImage = document.getElementById("uploadImage").value || null; //이미지 사진을 가져온다  this이므로 그자체를 가져오는데 없으면 null을 가져온다

   if(uploadImage == null || uploadImage == ""){ //만약없으면 알터띄우고 return 으로종료
      alert('이미지첨부하세여');
      return;
   }
   //유효성검사
   const  fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/; //근데 대문자로 하면될지몰겟음
   if(!uploadImage.match(fileForm)) { //match로 검사해서 이미지가 아닌지 검사한다!
      alert('이미지사진이아닙니다');
      return;
   }
    let reader = new FileReader(); //api입니다 사진올리는거
         
    reader.readAsDataURL(input.files[0]); //로그찍어서보시길
 	        
  	reader.onload= (e) =>{ //콜백함수임

    $('#preview').attr('src',e.target.result); //이건 속성추가하는건데 따로공부하셔야합니다

    }
 }

/////////////////////////////////////////////////

const simple_Writing = (str) => {
	alert('글작성클릭함');
	
}

</script>
</html>