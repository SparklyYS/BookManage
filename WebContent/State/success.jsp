<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
	<head>
		<title>Successful Login</title>
	</head>
	<body>
		Hello World, <%=session.getAttribute("AuthorName") %>
	</body>
</html>