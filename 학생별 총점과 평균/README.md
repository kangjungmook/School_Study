 JSP를 사용하여 학생들의 이름과 점수를 배열에 저장하고, 학생별 총점과 평균을 계산하여 화면에 출력하는 코드입니다

 > names 배열에 학생 이름들을 저장하고, scores 2차원 배열에는 국어, 영어, 수학 점수를 저장합니다.

```javascript
    <% String[] names = {"김미영", "김민성"};
       int[][] scores = {
            {80,90,70},  
            {50,25,30} 	
        };
    %>
```

> for 루프를 사용하여 학생들의 정보를 하나씩 가져와 총점과 평균을 계산하고 출력합니다

```javascript
<% for (int i = 0; i < names.length; i++) {
           int total = 0;
    %>
        <p>학생 이름: <%= names[i] %></p>
        <p>국어 점수: <%= scores[i][0] %></p>
        <p>영어 점수: <%= scores[i][1] %></p>
        <p>수학 점수: <%= scores[i][2] %></p>
        <% for (int j = 0; j < scores[i].length; j++) {
               total += scores[i][j];	
           }
           double average = total / (double) scores[i].length;
        %>
```

> 웹 페이지에 각 학생들의 이름, 점수, 총점, 평균이 표시되는 결과를 보여줍니다.


```javascript
    <p>총점: <%= total %></p>
        <p>평균: <%= String.format("%.2f", average) %></p>
        <br>
```
