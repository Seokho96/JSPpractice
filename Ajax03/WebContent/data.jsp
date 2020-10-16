<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%
 // MVC model1
 
 // DB 접근
 String userName = "홍길동";
  int userNumber = 1001;
 
 String json = "{ \"num\":" + userNumber + ", \"number\":\"" + userNumber + "\" }";

 System.out.println(json);
    out.println(json);//모델1일 경우에는 내장객체 사용
 
 
 
 
 %>