<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header{height:300px;width:100%;border:1px solid black}

main{display:flex;height:600px;width:100%; border:1px solid black}
aside{overflow: scroll;height:600px;width:50%; border:1px solid black}
#content{height:600px;width:50%; border:1px solid black}

footer{height:100px;width:100%;border:1px solid black}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function getlist(){
	//$.ajax();->$.ajax({});->$.ajax({url,성공했을 때 함수 구현});
	//json생긴 형태{키:값, 키:값, 키:값}, ajax통신은 {url:"/list", success:function(result){}} 
	//참고할 사항은 값은 익명함수로 선언이 가능하다
	$.ajax({
		url:"/list",
		success:function(result){$("#list").html(result);}
	});	
}

function search(search) {
	//$("#content").html(search);
	
	$.ajax({
		url:"/find?search="+search,								//url에 전달된 값이 있다
		success:function(result){$("#list").html(result);}
	});
	
}

function insert(){
	var name=document.getElementById("name").value
	var hp=document.getElementById("hp").value
	var memo=document.getElementById("memo").value
	
	//document.querySelector("#name");			//참고용
	console.log(name);
	console.log(hp);
	console.log(memo);
	
	
		//$.ajax();->$.ajax({});->$.ajax({url,성공했을 때 함수 구현});
		//json생긴 형태{키:값, 키:값, 키:값}, ajax통신은 {url:"/list", success:function(result){}} 
		//참고할 사항은 값은 익명함수로 선언이 가능하다
		
		/*
		$.ajax({
			url:"/insert?name="+name+"&hp="+hp+"&memo="+memo,
			success:function(result){$("#list").html(result);}
		});	
		*/
		
		/*
		$.ajax({
			url:"/insert",
			type : "post",		//get:url에 요청.. 입력은 post방식이 맞다...
			dataType : "text",
			data  : {"name":name, "hp":hp, "memo":memo},
			success:function(result){$("#list").html(result);}
		});	
		*/
	
		
		var formData = $("#form1").serialize();

		$.ajax({
			url:"/insert",
			type : "post",		//get:url에 요청.. 입력은 post방식이 맞다...
			data  : formData,
			success:function(result){$("#list").html(result);}
		});	
		
		
		document.querySelector("#name").value="";
		document.querySelector("#hp").value="";
		document.querySelector("#memo").value="";
}

function getPhonebook(idx){
	console.log(idx);
	$.ajax({
		url:"/findOne?idx="+idx,
		success:function(result){$("#content").html(result);}
	});
}


</script>

</head>
<body onload="getlist()">			
<header>
<h3>전화번호부입력</h3>
<form action="/insertProc" method="post"  id="form1" name="form1">
<lable for="name">이름:</lable>
<input type="text" id="name" name="name">
<br>
<lable for="hp">전화번호:</lable>
<input type="text" id="hp" name="hp">
<br>
<lable for="memo">메모:</lable>
<input type="text" id="memo" name="memo">
<br>

<!-- 폼으로 전송하는 방법 -->
<!-- <input type="submit" value="전화번호입력"> --> 

<!-- 자바스크릅트로 전송하는 방법 -->
<input type="button" value="전화번호입력" onclick="insert()">
</form>
</header>

<main>
<aside>
<div id="search">검색<input type="text" name="search" onkeyup="search(this.value)"></div>
<div id="list">전체리스트 or 검색리스트 결과</div>
</aside>
<div id="content">선택 결과</div>
</main>
<footer></footer>
</body>
</html>