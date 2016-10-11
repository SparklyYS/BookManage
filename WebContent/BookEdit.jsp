<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
	<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel='stylesheet' type='text/css'>
	<style type="text/css">
	
body {
	padding-top: 50px;
    background-color: #eee;
}

*[role="form"] {
    max-width: 530px;
    padding: 15px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 0.3em;
}

*[role="form"] h2 {
    margin-left: 5em;
    margin-bottom: 1em;
}

        .btn3d {
    position:relative;
    top: -6px;
    border:0;
     transition: all 40ms linear;
     margin-top:10px;
     margin-bottom:10px;
     margin-left:2px;
     margin-right:2px;
}
.btn3d:active:focus,
.btn3d:focus:hover,
.btn3d:focus {
    -moz-outline-style:none;
         outline:medium none;
}
.btn3d:active, .btn3d.active {
    top:2px;
}
.btn3d.btn-primary {
    box-shadow:0 0 0 1px #417fbd inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #4D5BBE, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#4274D7;
}
.btn3d.btn-primary:active, .btn3d.btn-primary.active {
    box-shadow:0 0 0 1px #417fbd inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color:#4274D7;
}
</style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<div id="Layer1" style="position:absolute; width:100%; height:100%; left:0px; top:0px;">
	<img src="./img/BookEdit.jpg" height="100%" width="100%" />	
</div>
<div class="container">
            <form method="post" action="BookEdit.action" name="form" class="form-horizontal" role="form">
				<div class="page-header text-center">
					<h3 id="timeline">图书编辑</h3>
				</div>
                <div class="form-group">
                    <label for="ISBN" class="col-sm-3 control-label">ISBN</label>
                    <div class="col-sm-9">
                        <s:textfield name="ISBN" value="%{#request.BookInfo.ISBN}" class="form-control" readonly="true" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="Title" class="col-sm-3 control-label">书名</label>
                    <div class="col-sm-9">
                        <s:textfield name="TitleName" value="%{#request.BookInfo.Title}" class="form-control" readonly="true" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="AuthorName" class="col-sm-3 control-label">作者</label>
                    <div class="col-sm-9">
                        <s:textfield name="AuthorName" value="%{#request.AuthorInfo.Name}" class="form-control" />
                    </div>
                </div>
				<div class="form-group">
                    <label for="Publisher" class="col-sm-3 control-label">出版社</label>
                    <div class="col-sm-9">
                        <s:textfield name="Publisher" value="%{#request.BookInfo.Publisher}" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="PublishDate" class="col-sm-3 control-label">出版日期</label>
                    <div class="col-sm-9">
                        <s:textfield name="PublishDate" class="form-control"> 
                 			<s:param name="value"><s:date name="%{#request.BookInfo.PublishDate}" format="yyyy-MM-dd" />
                 			</s:param>
                    	</s:textfield>
                    </div>
                </div>
				<div class="form-group">
                    <label for="Price" class="col-sm-3 control-label">价格</label>
                    <div class="col-sm-9">
                        <s:textfield name="Price" value="%{#request.BookInfo.Price}" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12 text-right">
                    	<input type="submit" class="btn btn-default preview-add-button" value="修改">
                    </div>
                </div>
            </form> <!-- /form -->
        </div> <!-- ./container -->
        
    <div class="container">
		<div class="row">
			<div class="button-1">
			<s:url var="url" value="BookSearch.action">
			<s:param name="AuthorName" value="%{#request.AuthorInfo.Name}"></s:param>
			</s:url>
			<s:a href="%{url}">
        	<button type="button" class="btn btn-primary btn-lg btn3d"><span class="glyphicon glyphicon-cloud"></span> 返回</button>
     		</s:a>
     		</div>
     		<div class="button-2">
     		<s:url var="url" value="Search.jsp">
         	</s:url>
         	<s:a href="%{url}">
         	<button type="button" class="btn btn-primary btn-lg btn3d"><span class="glyphicon glyphicon-home"></span> 主页</button>
			</s:a>
			</div>
		</div>
	</div>
        
</body>
</html>