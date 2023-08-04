이 코드는 두 변수 a와 b를 비교하여 덧셈 또는 뺄셈을 수행하고, 그 결과를 웹 페이지에 출력합니다

> a와 b 변수에 각각 1과 2를 대입합니다.

```javascript
<%! 
	int a = 1;
	int b = 2;
%>	
```

> 웹 페이지에 "첫번째수 : 1"과 "두번째수 : 2"를 출력합니다.

```javascript
	%>	
	<p>첫번째수 : <%= a %></p>
	<p>두번째수 : <%= b %></p>
	<%
```

> a와 b를 비교하여 result 변수에 결과를 할당합니다.
만약 a가 b보다 크거나 같으면, a와 b를 더한 값을 result에 대입합니다.
그렇지 않으면, a와 b의 값을 교환하고, a에서 b를 뺀 값을 result에 대입합니다.

```javascript
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
```

> 웹 페이지에 "결과값 : -1"을 출력합니다.

```javascript
	<p>결과값 : <%= result %></p>
```

