<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>학생별 총점과 평균</title>
</head>
<body>
    <% String[] names = {"김미영", "김민성"};
       int[][] scores = {
            {80,90,70},  
            {50,25,30} 
        };
    %>

    <h2>학생별 총점과 평균</h2>

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
        <p>총점: <%= total %></p>
        <p>평균: <%= String.format("%.2f", average) %></p>
        <br>
    <% } 
    %>
</body>
</html>
