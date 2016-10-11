<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>Bootstrap Snippet for Datatable - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .container{
	padding-top:50px;	
}

/*Remove that CSS*/
.col-md-3 {
    margin:auto;
	position:absolute;
	top:575; left:512; right:0: bottom:0;
    }
/*Remove that CSS*/
.material-button-anim{
	margin: auto;
	position: absolute;
	top: 800; left: 1000; bottom: 200; right: 8000;
}

.material-button {
    position: relative;
    top: 0;
    z-index: 1;
    width: 70px;
    height: 70px;
    font-size: 1.5em;
    color: #fff;
    background: #2C98DE;
    border: none;
    border-radius: 50%;
    box-shadow: 0 3px 6px rgba(0,0,0,.275);
    outline: none;
}
.material-button-toggle {
    z-index: 3;
    width: 90px;
    height: 90px;
    margin: 0 auto;
}
.material-button-toggle span {
    -webkit-transform: none;
    transform:         none;
    -webkit-transition: -webkit-transform .175s cubic-bazier(.175,.67,.83,.67);
    transition:         transform .175s cubic-bazier(.175,.67,.83,.67);
}
.material-button-toggle.open {
    -webkit-transform: scale(1.3,1.3);
    transform:         scale(1.3,1.3);
    -webkit-animation: toggleBtnAnim .175s;
    animation:         toggleBtnAnim .175s;
}
.material-button-toggle.open span {
    -webkit-transform: rotate(45deg);
    transform:         rotate(45deg);
    -webkit-transition: -webkit-transform .175s cubic-bazier(.175,.67,.83,.67);
    transition:         transform .175s cubic-bazier(.175,.67,.83,.67);
}

#options {
  height: 70px;
}
.option {
    position: relative;
}
.option .option1,
.option .option2,
.option .option3 {
    filter: blur(5px);
    -webkit-filter: blur(5px);
    -webkit-transition: all .175s;
    transition:         all .175s;
}
.option .option1 {
    -webkit-transform: translate3d(90px,90px,0) scale(.8,.8);
    transform:         translate3d(90px,90px,0) scale(.8,.8);
}
.option .option2 {
    -webkit-transform: translate3d(0,90px,0) scale(.8,.8);
    transform:         translate3d(0,90px,0) scale(.8,.8);
}
.option .option3 {
    -webkit-transform: translate3d(-90px,90px,0) scale(.8,.8);
    transform:         translate3d(-90px,90px,0) scale(.8,.8);
}
.option.scale-on .option1, 
.option.scale-on .option2,
.option.scale-on .option3 {
    filter: blur(0);
    -webkit-filter: blur(0);
    -webkit-transform: none;
    transform:         none;
    -webkit-transition: all .175s;
    transition:         all .175s;
}
.option.scale-on .option2 {
    -webkit-transform: translateY(-28px) translateZ(0);
    transform:         translateY(-28px) translateZ(0);
    -webkit-transition: all .175s;
    transition:         all .175s;
}

@keyframes toggleBtnAnim {
    0% {
        -webkit-transform: scale(1,1);
        transform:         scale(1,1);
    }
    25% {
        -webkit-transform: scale(1.4,1.4);
        transform:         scale(1.4,1.4); 
    }
    75% {
        -webkit-transform: scale(1.2,1.2);
        transform:         scale(1.2,1.2);
    }
    100% {
        -webkit-transform: scale(1.3,1.3);
        transform:         scale(1.3,1.3);
    }
}
@-webkit-keyframes toggleBtnAnim {
    0% {
        -webkit-transform: scale(1,1);
        transform:         scale(1,1);
    }
    25% {
        -webkit-transform: scale(1.4,1.4);
        transform:         scale(1.4,1.4); 
    }
    75% {
        -webkit-transform: scale(1.2,1.2);
        transform:         scale(1.2,1.2);
    }
    100% {
        -webkit-transform: scale(1.3,1.3);
        transform:         scale(1.3,1.3);
    }
}
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<div id="Layer1" style="position:absolute; width:100%; height:100%; left:0px; top:0px;">
	<img src="./img/HomePicture.jpg" height="100%" width="100%" />	
</div>  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

<h1 align="center">全部图书</h1>
<div class="container">
	<div class="row">
		
        <div class="col-md-12">
        <div class="table-responsive">
                    <div class="panel panel-default panel-table">
               <div class="panel-heading">
                 <div class="row">
                    <h2>所有图书</h2>
                 </div> 
               </div>
              <div class="panel-body">
              <table class="table table-striped table-bordered table-list">
                   
                  <thead>
                   
                   <th>ISBN</th>
                   <th>图书名</th>
                   <th>作者</th>
                   <th>出版社</th>
                   <th>出版日期</th>
                   <th>价格</th>   
				   <th>编辑</th>
                   <th>删除</th>
                   </thead>
    <tbody>
    <s:iterator value="#request.BookList" var="BookInfo" status="status">
    	<tr>
    	<td><s:property value="#BookInfo.ISBN" /></td>
    	<td>
   		<s:url var="url" action="ShowDetail.action">
		<s:param name="AuthorID" value="#BookInfo.AuthorID"></s:param>
	    <s:param name="Title" value="#BookInfo.Title"></s:param>
	    </s:url>
	    <s:a href="%{url}">
    	《<s:property value="#BookInfo.Title" />》
    	</s:a>
    	</td>
    	<td><s:property value="#BookInfo.AuthorName" /></td>
    	<td><s:property value="#BookInfo.Publisher" /></td>
    	<td><s:date name="#BookInfo.PublishDate" format="yyyy-MM-DD"/></td>
    	<td><s:property value="#BookInfo.Price" /></td>
    	<td>
    	<p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p>
    	</td>
    	<td>
    	<s:url var="url" value="DeleteRowBook.action">
    	<s:param name="AuthorID" value="#BookInfo.AuthorID"></s:param>
    	<s:param name="Title" value="#BookInfo.Title"></s:param>
    	</s:url>
    	<s:a href="%{url}">
    	<button class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span></button>
    	</s:a>
    	</td>
 
    	</tr>
    </s:iterator>
    
    </tbody>
        
</table>                
            </div>
            </div>
        </div>
        </div>
	</div>
</div>


<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">编辑这本书(ISBN和书名不可更改)</h4>
      </div>
      <form method="post" name="form" action="AllBookEdit.action">
          <div class="modal-body">
         <div class="form-group">
        </div>
        <div class="form-group">
        <s:textfield class="form-control" name="ISBN" type="text" placeholder="ISBN" />
        </div>
        <div class="form-group">
        <s:textfield class="form-control" name="TitleName" type="text" placeholder="书名" />
        </div>
        <div class="form-group">
        <s:textfield class="form-control" name="AuthorName" type="text" placeholder="作者" />
        </div>
		<div class="form-group">
        <s:textfield class="form-control" name="Publisher" type="text" placeholder="出版社" />
        </div>
		<div class="form-group">
        <s:textfield class="form-control" name="PublishDate" type="text" placeholder="出版日期" />
        </div>
		<div class="form-group">
        <s:textfield class="form-control" name="Price" type="text" placeholder="价格" />
        </div>
      </div>
 
          <div class="modal-footer ">
        <button type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
      </div>
      </form>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
</div>

<div class="container">
	<div class="row">
      <div class="col-md-4 col-md-offset-4">
        <div class="material-button-anim">
          <s:url var="url" value="Search.jsp">
          </s:url>
          <s:a href="%{url}">
          <button class="material-button material-button-toggle" type="button">
            <span class="fa fa-home" aria-hidden="true">主页</span>
          </button>
          </s:a>
        </div>
      </div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function () {
    $('.material-button-toggle').click(function () {
        $(this).toggleClass('open');
        $('.option').toggleClass('scale-on');
    });
});
</script>
  
</body>
</html>