<html>
<head>
	<title>Spring 3.0 MVC Series: Hello World</title>
</head>
<body>
<%
	String msg = (String)request.getAttribute("message");
%>
	Prueba: <%=msg%>
</body>
</html>

