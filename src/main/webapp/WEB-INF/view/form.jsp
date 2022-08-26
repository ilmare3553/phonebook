<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<form method="post"  id="form1" name="form1">
<lable for="name">이름:</lable>
<input type="text" id="name" name="name">
<br>
<lable for="hp">전화번호:</lable>
<input type="text" id="hp" name="hp">
<br>
<lable for="memo">메모:</lable>
<input type="text" id="memo" name="memo">
<br>

<input type="button" value="전송" onclick="tran()"> 
</form>


<script>

function tran() {
	var data={
			//json만들어주는 형태
			name:$('#name').val(),
			hp:$('#hp').val(),
			memo:$('#memo').val(),
	}
	//ajax형태로 데이터 전달
	$.ajax({
		url:"/formProc",
		type:"post",
		data:JSON.stringify(data),
		contentType:"application/json;charset=utf-8",			//이렇게 보내야 json지원을 한다
		dataType:"json",
		success:function(data){
			//alert(JSON.stringify(data));
			alert(data.name+":"+data.hp+":"+data.memo);
		}
	});
}


</script>

</body>
</html>