<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 상세보기 -->
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<lable for="title">전화번호 상세보기</lable><br>


<form id="form1" name="form1" method="post" >
<input type="hidden" value="${phonebook.idx}" name="idx"> 
이름 : <input type="text" id="name" name="name" value="${phonebook.name}"><br>
전화번호 : <input type="text" id="hp" name="hp" value="${phonebook.hp}"><br>
메모 : <input type="text" id="memo" name="memo" value="${phonebook.memo}"><br>

<input type="button" value="수정" onclick="update()">
<input type="button" value="삭제" onclick="deleteproc()">
 
</form>

<script>

    var formData = $("#form1").serialize();
   	
    function update(){
    	alert(documentgetElementById("name"));
    }
    
    
    /*
    function update(){
    	alert(document.getElementsByName("name"));
  	$.ajax({
			url:"/update",
			type : "post",		
			data  : formData,
			success:function(result){$("#content").html(result);}
		});	
    	
    }
    
    function deleteproc(){
    	//var formData = $("#form1").serialize();
    	alert(formData);
    	$.ajax({
			url:"/deleteproc",
			type : "post",		//get:url에 요청.. 입력은 post방식이 맞다...
			data  : formData,
			success:function(result){$("#list").html(result);}
		});	
    	
    }
   */ 
    
    
    /*
    function update(){
    	var name=document.getElementById("name").value
    	var hp=document.getElementById("hp").value
    	var memo=document.getElementById("memo").value

    		$.ajax({
    			url:"/insert?name="+name+"&hp="+hp+"&memo="+memo,
    			data : $("#form1").serialize(),
    			dataType : "JSON"
    			success:function(result){$("#index").html(result);}
    			alert("수정되었습니다.")
    		});	

    }
    
    function deleteproc(){
    	var name=document.getElementById("name").value
    	var hp=document.getElementById("hp").value
    	var memo=document.getElementById("memo").value

    		$.ajax({
    			url:"/insert?name="+name+"&hp="+hp+"&memo="+memo,
    			data : $("#form1").serialize(),	
    			dataType : "JSON"
    			success:function(result){$("#index").html(result);}
    			alert("삭제되었습니다.")
    		});	

    }
    */
</script>





<!-- 
<input type="submit" value="수정" id="update">
<input type="submit" value="삭제" id=delete> 
-->