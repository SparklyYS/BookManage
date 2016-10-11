<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
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
	top: -750; left: 325; bottom: 0; right: 0;
}


body {
    padding-top: 50px;
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



button {
  margin: 20px 0;
  line-height: 34px;
  position: relative;
  cursor: pointer;
  user-select: none;
  outline:none !important;
  width:100%;
}

button:active {

  outline:none;
}

button.ribbon {
  
  outline:none;
  outline-color: transparent;
}
button.ribbon:before, button.ribbon:after {
  top: 5px;
  z-index: -10;
}
button.ribbon:before {
  border-color: #53dab6 #53dab6 #53dab6 transparent;
  left: -25px;
  border-width: 17px;
}
button.ribbon:after {
  border-color: #53dab6 transparent #53dab6 #53dab6;
  right: -25px;
  border-width: 17px;
}

button:before, button:after {
  content: '';
  position: absolute;
  height: 0;
  width: 0;
  border-style: solid;
  border-width: 0;
  outline:none;
}

button.btn-default:before {
  border-color: #757575 #757575 #757575 transparent;
    }
    button.btn-default:after {
  border-color: #757575 transparent #757575 #757575;
    }
    
    
    
    button.btn-primary:before {
  border-color: #2e6da4 #2e6da4 #2e6da4 transparent;
    }
    button.btn-primary:after {
  border-color: #2e6da4 transparent #2e6da4 #2e6da4;
    }
    
    
    button.btn-success:before {
  border-color: #398439 #398439 #398439 transparent;
    }
    button.btn-success:after {
  border-color: #398439 transparent #398439 #398439;
    }
    
    
    button.btn-info:before {
  border-color: #269abc #269abc #269abc transparent;
    }
    button.btn-info:after {
  border-color: #269abc transparent #269abc #269abc;
    }
    
    
    button.btn-warning:before {
  border-color: #d58512 #d58512 #d58512 transparent;
    }
    button.btn-warning:after {
  border-color: #d58512 transparent #d58512 #d58512;
    }
    
    
    button.btn-danger:before {
  border-color: #ac2925 #ac2925 #ac2925 transparent;
    }
    button.btn-danger:after {
  border-color: #ac2925 transparent #ac2925 #ac2925;
    }
	


.timeline {
  list-style: none;
  padding: 20px 0 20px;
  position: relative;
}
.timeline:before {
  top: 0;
  bottom: 0;
  position: absolute;
  content: " ";
  width: 3px;
  background-color: #eeeeee;
  left: 50%;
  margin-left: -1.5px;
}
.timeline > li {
  margin-bottom: 20px;
  position: relative;
  width: 50%;
  float: left;
  clear: left;
}
.timeline > li:before,
.timeline > li:after {
  content: " ";
  display: table;
}
.timeline > li:after {
  clear: both;
}
.timeline > li:before,
.timeline > li:after {
  content: " ";
  display: table;
}
.timeline > li:after {
  clear: both;
}
.timeline > li > .timeline-panel {
  width: 95%;
  float: left;
  border: 1px solid #d4d4d4;
  /*border-radius: 2px;*/
  /*padding: 20px;*/
  position: relative;
  -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}

.timeline > li > .timeline-panel:before {
  position: absolute;
  top: 26px;
  right: -15px;
  display: inline-block;
  border-top: 15px solid transparent;
  border-left: 15px solid #ccc;
  border-right: 0 solid #ccc;
  border-bottom: 15px solid transparent;
  content: " ";
}
.timeline > li > .timeline-panel:after {
  position: absolute;
  top: 27px;
  right: -14px;
  display: inline-block;
  border-top: 14px solid transparent;
  border-left: 14px solid #fff;
  border-right: 0 solid #fff;
  border-bottom: 14px solid transparent;
  content: " ";
}
.timeline > li > .timeline-badge {
  color: #fff;
  width: 24px;
  height: 24px;
  line-height: 50px;
  font-size: 1.4em;
  text-align: center;
  position: absolute;
  top: 16px;
  right: -12px;
  /*background-color: #999999;*/
  z-index: 100;
  /*
  border-top-right-radius: 50%;
  border-top-left-radius: 50%;
  border-bottom-right-radius: 50%;
  border-bottom-left-radius: 50%;
  */
}
.timeline > li.timeline-inverted > .timeline-panel {
  float: right;
}
.timeline > li.timeline-inverted > .timeline-panel:before {
  border-left-width: 0;
  border-right-width: 15px;
  left: -15px;
  right: auto;
}
.timeline > li.timeline-inverted > .timeline-panel:after {
  border-left-width: 0;
  border-right-width: 14px;
  left: -14px;
  right: auto;
}
.timeline-badge > a {
  color: #C5C7C5 !important;
}
.timeline-badge a:hover {
  color: #000 !important;
}
.timeline-title {
  margin-top: 0;
  color: inherit;
}
.timeline-body > p,
.timeline-body > ul {
    padding:20px;
    margin-bottom: 0;
}
.timeline-body > p + p {
  margin-top: 5px;
}
.timeline-footer{
    padding:20px;
    background-color:#f4f4f4;
}
.timeline-footer > a{
    cursor: pointer;
    text-decoration: none;
}
.tooltip{

    position:absolute;
    z-index:1020;
    display:block;
    visibility:visible;
    padding:5px;
    font-size:11px;
    opacity:0;
    filter:alpha(opacity=0);
    
}
.tooltip.in{
    /*opacity:0;
    filter:alpha(opacity=80);*/
    
}
.tooltip.top{
    margin-top:-2px;
}
.tooltip.right{
    margin-left:2px;
}
.tooltip.bottom{
    margin-top:2px;
}
.tooltip.left{
    margin-left:-2px;
}
.tooltip.top .tooltip-arrow{
    bottom:0;
    left:0;
    margin-left:0;
    border-left:0 solid transparent;
    border-right:5px solid transparent;
    border-top:0 solid #000;
}
.tooltip.left .tooltip-arrow{
    bottom:0;
    left:0;
    margin-left:0;
    border-left:0 solid transparent;
    border-right:5px solid transparent;
    border-top:0 solid #000;
}
.tooltip.bottom .tooltip-arrow{
    bottom:0;
    left:0;
    margin-left:0;
    border-left:0 solid transparent;
    border-right:5px solid transparent;
    border-top:0 solid #000;
}
.tooltip.right .tooltip-arrow{
    bottom:0;
    left:0;
    margin-left:0;
    border-left:0 solid transparent;
    border-right:5px solid transparent;
    border-top:0 solid #000;
}
.tooltip-inner{
    width:200px;
    padding:3px 8px;
    color:#fff;
    text-align:center;
    text-decoration:none;
    background-color:#313131;
    -webkit-border-radius:0px;
    -moz-border-radius:0px;
    border-radius:0px;
}
.tooltip-arrow{
    position:absolute;
    width:0;
    height:0;
}
.timeline > li.timeline-inverted{
  float: right; 
  clear: right;
  margin-top: 30px;
  margin-bottom: 30px;
}
.timeline > li:nth-child(2){
  margin-top: 60px;
}
.timeline > li.timeline-inverted > .timeline-badge{
  left: -12px;
}

@media (max-width: 767px) {
    ul.timeline:before {
        left: 40px;
    }

    ul.timeline > li {
      margin-bottom: 20px;
      position: relative;
      width:100%;
      float: left;
      clear: left;
    }
    ul.timeline > li > .timeline-panel {
        width: calc(100% - 90px);
        width: -moz-calc(100% - 90px);
        width: -webkit-calc(100% - 90px);
    }

    ul.timeline > li > .timeline-badge {
        left: 28px;
        margin-left: 0;
        top: 16px;
    }

    ul.timeline > li > .timeline-panel {
        float: right;
    }

        ul.timeline > li > .timeline-panel:before {
            border-left-width: 0;
            border-right-width: 15px;
            left: -15px;
            right: auto;
        }

        ul.timeline > li > .timeline-panel:after {
            border-left-width: 0;
            border-right-width: 14px;
            left: -14px;
            right: auto;
        }
    
.timeline > li.timeline-inverted{
  float: left; 
  clear: left;
  margin-top: 30px;
  margin-bottom: 30px;
}

.timeline > li.timeline-inverted > .timeline-badge{
  left: 28px;
}
}
</style>
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<form method="post" action="AddBook.action" name="form">
    <div class="page-header text-center">
        <h1 id="timeline">新增图书</h1>
    </div>
    <ul class="timeline">
        <li>
          <div class="timeline-badge primary"><a><i class="glyphicon glyphicon-record" rel="tooltip" title="11 hours ago via Twitter" id=""></i></a></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h3 align="center">图书信息</h3>
            </div>
            <div class="timeline-body">
                <div class="panel-body form-horizontal payment-form">
                    <div class="form-group">
                        <label for="concept" class="col-sm-3 control-label">ISBN</label>
                        <div class="col-sm-9">
                            <s:textfield class="form-control" name="BookInfo.ISBN" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">书名</label>
                        <div class="col-sm-9">
                            <s:textfield class="form-control" name="BookInfo.Title" />
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">作者</label>
                        <div class="col-sm-9">
                        	<s:textfield class="form-control" name="AuthorName" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-3 control-label">出版社</label>
                        <div class="col-sm-9">
                        	<s:textfield class="form-control" name="BookInfo.Publisher" />
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="date" class="col-sm-3 control-label">出版日期</label>
                        <div class="col-sm-9">
                        	<s:textfield class="form-control" name="PublishDate" />
                        </div>
                    </div>
					<div class="form-group">
                        <label for="status" class="col-sm-3 control-label">售价</label>
                        <div class="col-sm-9">
                            <s:textfield class="form-control" name="Price" />
                        </div>
                    </div> 
                </div>
            </div>
           
          </div>
        </li>
        
        <li  class="timeline-inverted">
          <div class="timeline-badge primary"><a><i class="glyphicon glyphicon-record invert" rel="tooltip" title="11 hours ago via Twitter" id=""></i></a></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h3 align="center">作者信息</h3>
              
            </div>
            <div class="timeline-body">
			                  <div class="panel-body form-horizontal payment-form">
                    <div class="form-group">
                        <label for="concept" class="col-sm-3 control-label">作者</label>
                        <div class="col-sm-9">
                            <s:textfield class="form-control" name="AuthorInfo.Name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="date" class="col-sm-3 control-label">年龄</label>
                        <div class="col-sm-9">
                            <s:textfield class="form-control" name="AuthorInfo.Age" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-3 control-label">国籍</label>
						<div class="col-sm-9">
							<s:textfield class="form-control" name="AuthorInfo.Country" />
						</div>
					</div> 					
                </div>
            </div>
            
          </div>
        </li>
        <li class="clearfix" style="float: none;"></li>
    </ul>
	
	<div class="col-md-3 ">
	  
	<button type="submit" class="btn btn-primary ribbon">提交</button>
	</div>
</div>
	</form>

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