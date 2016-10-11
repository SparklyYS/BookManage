<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>SearchResult</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
	<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel='stylesheet' type='text/css'>
	<style type="text/css">
	.panel-table .panel-body{
	  padding:0;
	}

	.panel-table .panel-body .table-bordered{
	  border-style: none;
	  margin:0;
	}

	.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
		text-align:center;
		width: 100px;
	}

	.panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
	.panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
	  border-right: 0px;
	}

	.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
	.panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
	  border-left: 0px;
	}

	.panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{
	  border-bottom: 0px;
	}

	.panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{
	  border-top: 0px;
	}

	.panel-table .panel-footer .pagination{
	  margin:0; 
	}

	/*
	used to vertically center elements, may need modification if you're not using default sizes.
	*/
	.panel-table .panel-footer .col{
	 line-height: 34px;
	 height: 34px;
	}

	.panel-table .panel-heading .col h3{
	 line-height: 30px;
	 height: 30px;
	}

	.panel-table .panel-body .table-bordered > tbody > tr > td{
	  line-height: 34px;
	}
	

	#custom-search-input{
    padding: 3px;
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;
	}

	#custom-search-input input{
		border: 0;
		box-shadow: none;
	}

	#custom-search-input button{
		margin: 2px 0 0 0;
		background: none;
		box-shadow: none;
		border: 0;
		color: #666666;
		padding: 0 8px 0 10px;
		border-left: solid 1px #ccc;
	}

	#custom-search-input button:hover{
		border: 0;
		box-shadow: none;
		border-left: solid 1px #ccc;
	}

	#custom-search-input .glyphicon-search{
		font-size: 23px;
	}
	
	        /*-------------------------
Please follow me @maridlcrmn
/*-------------------------*/
.material-button-anim{
	margin: auto;
	position: absolute;
	right:200; left:525; top:70; bottom:100;
}

.material-button-anim {
  position: relative;
  padding: 127px 15px 27px;
  text-align: center;
  max-width: 320px;
  margin: 0 auto 20px;
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

<body background="./img/MainPage.jpg">
<div id="Layer1" style="position:absolute; width:100%; height:100%; left:0px; top:0px;">
	<img src="./img/MainPage.jpg" height="100%" width="100%" />	
</div>
	<form method="get" name="form" action="BookSearch.action">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h2>作者查询</h2>
						<div id="custom-search-input">
						<div class="input-group col-md-12">
						<input type="text" name="AuthorName" class="form-control input-lg" placeholder="<s:property value="AuthorName" />" />
						<span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="submit">
                          <i class="glyphicon glyphicon-search"></i>
                        </button>
						</span>
					</div>
				</div>
			</div>
		</div>
			</div>
    </form>

        <div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
               <div class="panel-heading">
                 <div class="row">
                    <h2><s:property value="AuthorName" />所著图书</h2>
                 </div> 
               </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list"> 
                  <thead>
                    <tr>
                        <th><em class="fa fa-cog"></em></th>
                        <th>图书名</th>
                        <th>出版社</th>
                        <th>定价</th>
                    </tr> 
                  </thead>
                  <tbody>
							<s:iterator value="#request.BookList" var="BookInfo" status="status">
							<tr>
							<td align="center">
							  <s:url var="url" value="ShowBook.action">
							  <s:param name="Title" value="#BookInfo.Title"></s:param>
							  <s:param name="AuthorID" value="#BookInfo.AuthorID"></s:param>
							  </s:url>
							  <s:a href="%{url}" class="btn btn-default"><em class="fa fa-pencil"></em></s:a>
							  <s:url var="url" action="DeleteBook.action">
							  <s:param name="AuthorID" value="#BookInfo.AuthorId"></s:param>
							  <s:param name="Title" value="#BookInfo.Title"></s:param>
							  </s:url>
                              <s:a href="%{url}" class="btn btn-danger"><em class="fa fa-trash"></em></s:a>
                            </td>
							<td class="hidden-xs">
							  <s:url var="url" action="ShowDetail.action">
							  <s:param name="AuthorID" value="#BookInfo.AuthorID"></s:param>
							  <s:param name="Title" value="#BookInfo.Title"></s:param>
							  </s:url>
							<s:a href="%{url}">《<s:property value="#BookInfo.Title" />》</s:a></td>
							<td><s:property value="#BookInfo.Publisher" /></td>
							<td><s:property value="#BookInfo.Price" /></td>
							</tr>
							</s:iterator>
                        </tbody>
                </table>
            
              </div>
            </div>
          </div>
          
<div class="container">
	<div class="row">
      <div class="col-md-4 col-md-offset-4">
        <div class="material-button-anim">
          <ul class="list-inline" id="options">
            <li class="option">
            <s:url var="url" value="Search.jsp">
            </s:url>
            <s:a href="%{url}">
              <button class="material-button option1" type="button">
                <span class="fa fa-home" aria-hidden="true">主页</span>
              </button>
             </s:a>
            </li>
            <li class="option">
            <s:url var="url" value="AddBook.jsp">
            </s:url>
            <s:a href="%{url}">
              <button class="material-button option3" type="button">
                <span class="fa fa-book" aria-hidden="true">添加</span>
              </button>
             </s:a>
            </li>
          </ul>
          <button class="material-button material-button-toggle" type="button">
            <span class="fa fa-plus" aria-hidden="true">点我</span>
          </button>
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
