<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.spring.model.AddressVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link rel="stylesheet" href="/resources/css2/responsive.css">
</head>
<body>
<form action="/member/adsearch" method="post">
		<h3>우편번호 찾기</h3>
		<input type="text" name="address" size=20> 
		<input type="submit" value="검색"> <p>**동으로 검색    ex)상계2동 검색</p>
	</form>
</body>
</html>