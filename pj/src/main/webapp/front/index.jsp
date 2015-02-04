<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>金风科技供应链电子商务网</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
<style type="text/css">
	html,body {
		margin: 0px;padding: 0px;background-color: #F0F0F0;font-size: 12px;color: 333;
	}
	.center{width: 1000px;margin: auto;}
	.carousel-indicators {
		  bottom: -1px;
		  left: 32px;
		}
	.carousel-indicators li {
	  background-color: #366AC9;
	  border: 1px solid #366AC9;
	  width: 10px;
	  height: 10px;
	}
	.carousel-indicators .active {
	  border: 1px solid #fff;
	   margin: 1px;
	  width: 10px;
	  height: 10px;
	}
    .carousel .item {
        height: 350px;//固定高度
    }
    .carousel img{
        width: 100%;//图片自适应
    }
    .carousel {
		 width: 690px;//图片自适应
         height: 350px;
         float: left;
     }
    .login{
    	width: 292px;
    	height: 350px;
    	background-color: #FFF;
    	float: right;
    }
    body{background: url("../static/images/top_bg.png") repeat-x;}
    .top{width:1000px;height:110px;margin: auto;padding: 30px}
    .now{float: right;margin: 18px 10px 0px 0px}
    .c_1{width: 1000px;height: 350px;}
    .login_top{
    	height:46px;
    	background-image: url("../static/images/login_top.png");
    }
    .login_txt{color: #fff;margin-left: 50px;font-weight:600;line-height: 47px;font-size: 13px;}
    .language_txt{color: #fff;margin-right: 0px;line-height: 47px;font-size: 13px;float: right;cursor: pointer;}
    .place{margin-right: 10px;line-height: 47px;font-size: 13px;width:17px;float: right;cursor: pointer;}
    .login_mid{width: 236px;margin: auto;}
    .username{height: 35px;background-image: url("../static/images/username.png");margin-top: 10px;}
    .username input,.password input{width: 197px;float: right;border: none;height: 31px;margin-top: 1px;margin-right: 1px}
    .password{height: 35px;background-image: url("../static/images/password.png");margin-top: 10px;}
    .username_txt{margin-top: 30px;color: #999;font-size: 12px}
    .password_txt{margin-top: 10px;color: #999;font-size: 12px}
    .logint_btn{width: 241px;height: 44px;background-image:url("../static/images/login_btn_none.png");cursor: pointer;margin-top: 40px}
	.regist{cursor:pointer;float: right;font-size: 12px;color: #0068B7;margin-top: 20px; text-decoration: none}
	.show_detail{cursor:pointer;float: right;margin-right: 50px;}
	.regist:link,.show_detail:link{ color: #0068B7;  text-decoration: none}
	.regist:visited,.show_detail:visited { color: #0068B7;  text-decoration: none}
	.regist:hover,.show_detail:hover{color: #FF7201; text-decoration: underline;}
	.regist:active,.show_detail:active { color: #ff7f24; text-decoration: underline;}
	.c_2{
    	width: 1000px;
    	height: 240px;
    	margin: 30px auto 0px auto;
    }
    .c_2_top{height: 40px;background-image: url("../static/images/titles.png");}
    .c_2_mid{height: 200px;background-color: #fff;}
    .news{float: left;margin: 15px 0px 0px 13px;}
    .notice{float: left;margin: 25px 0px 0px 50px;}
    .rules{float: left;margin: 25px 0px 0px 60px;}
    .notice ul,.rules ul{padding: 0px}
    .notice  li,.rules li{list-style-type:none;padding-left: 10px;line-height: 25px;background:url("../static/images/li.png") no-repeat left;width: 280px}
    .notice li span,.rules li span{color: #999999;float: right;}
    .notice ul li a:link,.rules ul li a:link{ color: #333333;  text-decoration: none}
	.notice ul li a:visited,.rules ul li a:visited { color: #333333;  text-decoration: none}
	.notice ul li a:hover,.rules ul li a:hover{color: #FF7201; text-decoration: underline;}
	.notice ul li a:active,.rules ul li a:active { color: #ff7f24; text-decoration: underline;}
    .news div{width: 297px;line-height: 25px;padding-top: 10px}
    .bottom{background: url("../static/images/bottom_rep.png") repeat-x; width: 100%;height: 111px;margin-top: 60px}
    .bottom_cont{width: 1000px;margin: auto;height: 111px}
    .bottom_cont div{padding-top:50px;height:118px;width: 912px;margin: auto;float: left}
    .bottom_cont p{color: #5E82A8;font-size: 12px;line-height:16px;margin: auto;width: 745px;text-align: center;}
</style>
</head>
<body>
	<div class="top">
		<img alt="金凤科技" src="../static/images/logo.png">
		<span class="now"></span>
	</div>
	<div class="center">
		<div class="c_1">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			  </ol>
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <img  alt="First slide [900x500]" src="../static/images/img1.png" data-holder-rendered="true">
			      <div class="carousel-caption">
			      </div>
			    </div>
			    <div class="item">
			      <img  alt="Second slide [900x500]" src="../static/images/img2.png" data-holder-rendered="true">
			   	   <div class="carousel-caption">
			      </div>
			    </div>
			  </div>
			  <!-- Controls
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			   -->
			</div>
			<div class="login">
				<div class="login_top">
					<span class="login_txt">登录</span>
					<span class="place">&nbsp;</span>
					<span class="language_txt">中文</span>
				</div>
				<div class="login_mid">
					<div class="username_txt">用户名:</div>
					<div class="username">
						<input type="text" class="form-control" name="username" id="username">
					</div>
					<div  class="password_txt">口令:</div>
					<div class="password">
						<input type="password" class="form-control" name="password" id="password">
					</div>
					<div class="logint_btn" ></div>
					<a href="#" class="regist">供应商注册</a>
				</div>
			</div>
		</div>
		<div class="c_2">
			<div class="c_2_top"></div>
			<div class="c_2_mid">
				<div class="news">
					<img alt="" width="297" height="82" src="../static/images/news_exam_19.png">
					<div >
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为适应风电市场的快速增长及满足客户多元化的需求，金风科技根据不同的地理气候条件，进行差异化设计，形成了...
						<a class="show_detail">[查看详情]</a>
					</div>
				</div>
				<div class="notice">
					<ul>
						<li><a href="#">中央深化改革元年工作述评</a><span>2014-02-03</span></li>
						<li><a href="#">中央深化改革元年工作述评</a><span>2014-02-03</span></li>
						<li><a href="#">中央深化改革元年工作述评</a><span>2014-02-03</span></li>
						<li><a href="#">中央深化改革元年工作述评</a><span>2014-02-03</span></li>
						<li><a href="#">中央深化改革元年工作述评</a><span>2014-02-03</span></li>
						<li><a href="#">中央深化改革元年工作述评</a><span>2014-02-03</span></li>
					</ul>
				</div>
				<div class="rules">
					<ul>
						<li><a href="#">关于对已注册供应商进行年检的通知</a> </li>
						<li><a href="#">中央深化改革元年工作述评</a></li>
						<li><a href="#">关于对已注册供应商进行年检的通知</a> </li>
						<li><a href="#">关于对已注册供应商进行年检的通知</a> </li>
						<li><a href="#">关于对已注册供应商进行年检的通知</a> </li>
						<li><a href="#">中央深化改革元年工作述评</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom">
		<div class="bottom_cont">
			<div>
				<p>COPYRIGHT © GOLDWIND.CN,ALL RIGHT RESERVED  新ICP备11003499 金风科技版权所有   联系电话：010-643213123-213</p>
				<p>公司地址：北京市大兴区亦庄开发区康定街18号  北京金风科技    技术支持：东软慧聚软件有限公司</p>
				<p>友情链接  |  友情链接 |  友情链接 |  友情链接 |  友情链接 |  友情链接 </p>
			</div>
 			<img alt="" src="../static/images/2wei_10.png" style="float: right;">
		</div>
	</div>
</body>
<script type="text/javascript">
function getTime(){
	var date=new Date();
	var month=(date.getMonth()+1);
	var day=date.getDate();
	var hour=date.getHours();
	var mi=date.getMinutes();
	if(month<10)month="0"+month;
	if(day<10)day="0"+day;
	if(hour<10)hour="0"+hour;
	if(mi<10)mi="0"+mi;
	$(".now").html(date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+mi);
	setTimeout("getTime()",60000 )
}
getTime();
</script>
</html>