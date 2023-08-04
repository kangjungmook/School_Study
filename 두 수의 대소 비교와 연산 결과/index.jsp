<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%! 
	int a = 1;
	int b = 2;
	%>	
	<p>첫번째수 : <%= a %></p>
	<p>두번째수 : <%= b %></p>
	<%
	int result;
	if(a >= b){
		result = a+b;
		
	} else{
		int temp = a;
		a = b;
		b = temp;
		result = a - b;
	}
	%>

	<p>결과값 : <%= result %></p>
	
</body>
</html>
