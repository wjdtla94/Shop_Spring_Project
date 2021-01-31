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
<script type="text/javascript">
	function btn(form) {
		var i = form.add.selectedIndex;
		if(i >0){
			addText = form.add.options[i].text;
			var str = addText.split(' ');
 			opener.document.frm.userPostcode.value = str[0];
 			opener.document.frm.userAddress.value = str[1]+" "+str[2]+ " "+str[3]+ " "+str[4];
	 		self.close();
		}
	}
</script>
</head>
<body>
	<form action="/member/adsearch" method="post">
		<h3>우편번호 찾기</h3>
		<input type="text" name="address" size=20> <input
			type="submit" value="검색">

		<%
			List<AddressVO> address = (ArrayList<AddressVO>) request.getAttribute("address");
		%>
		
		<select id="add" size="<%=address.size()%>">
			<%
				for (AddressVO add : address) {
			%>
			<option><%=add.getZipcode()%>
				<%=add.getSido()%>
				<%=add.getGugun()%>
				<%=add.getDong()%>
				<%=add.getBldg()%>
				<%=add.getBunji()%></option>
			<br />

			<%
				}
			%>
		</select>
		<p>
			<input type="button" value="주소 입력" onclick="btn(form)">
		</p>
	</form>
</body>
</html>