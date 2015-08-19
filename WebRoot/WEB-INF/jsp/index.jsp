<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>WTU商城</title>
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
			function findbykey(){
		       var content = document.getElementById("key").value;//绝对路径
				window.location.href = "${pageContext.request.contextPath }/product_findByKey.action?key="+content+"&page=1";
			}
		</script>
</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="${ pageContext.request.contextPath }/index.action">
			<img src="${pageContext.request.contextPath}/images/logo.jpg" width="170" />
			</a>
		</div>
	</div>
	<div class="span9">
         <div class="headerAd">
					<img src="${pageContext.request.contextPath}/images/header.jpg" width="320" height="50"  title="正品保障">
         </div>	
	 
	 </div>
	
	<%@ include file="menu.jsp" %>
	
	<input type="text" name="key"   id="key" value="搜索商品" onfocus="javascript:if(this.value=='搜索商品')this.value='';">
    <input type="button" value="搜索" onclick="findbykey()"/> 

</div>	

<div class="container index">
		

		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
					<div class="title">
						<strong>热门商品</strong>
						<!-- <a  target="_blank"></a> -->
					</div>
					<ul class="tab">
							
							<li>
								<a  target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
					</ul>

						<ul class="tabContent" style="display: block;"><!-- block模块化 -->
							<s:iterator var="p" value="hList">                                                                                <!-- _blank"在新窗口中打开链接 -->
									<li>
										<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"><img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>"  style="display: block;"></a><!-- _blank在新窗口中打开链接 -->
									</li>
							</s:iterator>
							
						</ul>
					
			</div>
		</div>
		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
					<div class="title">
						<strong>最新商品</strong>
						<a  target="_blank"></a>
					</div>
					<ul class="tab">
							
							<li>
								<a  target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
					</ul>
					
						 <ul class="tabContent" style="display: block;">
								<s:iterator var="p" value="nList">
									<li>
										<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"><img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>" data-original="http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg" style="display: block;"></a>									</li>
									</li>
							   </s:iterator>	
						</ul>
					
			</div>
		</div>
		
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="${pageContext.request.contextPath}/images/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
</div>	</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a>关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
						|
					</li>
					<li>
						<a>招贤纳士</a>
						|
					</li>
					<li>
						<a>法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a>服务声明</a>
						|
					</li>
					<li>
						<a>广告声明</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2015 tsinghua版权所有</div>
	</div>
</div>
</body>
</html>