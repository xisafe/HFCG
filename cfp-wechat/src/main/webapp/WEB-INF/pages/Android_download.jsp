<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    pageContext.setAttribute("basePath", basePath);
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />    
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="format-detection" content="telephone=no"/>
<meta name="msapplication-tap-highlight" content="no" />
<title>下载</title>
<style>
  html,body{
    width: 100%;
    height: 100%;
    margin: 0
  }
  body{
    background: #e8f8ff url(${ctx}/images/Android_index.jpg) no-repeat top;
    background-size:contain;
  }
</style>
</head>
<html>
<body>
    
</body>
<script type="text/javascript">
	window.onload=function(){
		//window.location.href="http://10.70.12.114:8081/cfp-wechat/js/app-weixin-release.apk";
		/* var ua = window.navigator.userAgent.toLowerCase(); 
		var userAgent = navigator.userAgent;
		if (userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") < 1) {
        	alert("safiri");
        	return;
    	}else{
    		
    		return;
    	}
		if(ua.match(/MicroMessenger/i) != 'micromessenger'){ 
			document.body.style.background="#fff"; 
			window.location.href="http://101.201.221.238/file_dir/app-weixin-release.apk";
		}  */
var browser = {
versions: function() {
var u = navigator.userAgent, app = navigator.appVersion;
return {//移动终端浏览器版本信息 
trident: u.indexOf('Trident') > -1, //IE内核
presto: u.indexOf('Presto') > -1, //opera内核
webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
mobile: !!u.match(/AppleWebKit.*Mobile.*/) || !!u.match(/AppleWebKit/), //是否为移动终端
ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
iPad: u.indexOf('iPad') > -1, //是否iPad
webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
};
}(),
language: (navigator.browserLanguage || navigator.language).toLowerCase()
}
 
if (browser.versions.ios || browser.versions.iPhone || browser.versions.iPad) {
	window.location.href="https://itunes.apple.com/us/app/ma-yi-cai-fu-pai/id1064835882?mt=8";
	/* document.body.style.background="#fff"; 
	alert("您是苹果手机用户，请到官方商店搜索\"蚂蚁财富派\"，即将推出。"); */
}
else if (browser.versions.android) {
var ua = window.navigator.userAgent.toLowerCase(); 
if(ua.match(/MicroMessenger/i) != 'micromessenger'){ 
			document.body.style.background="#fff";
            window.location.href="http://a.app.qq.com/o/simple.jsp?pkgname=com.caifupad&from=singlemessage";
		} 
}
	}
</script>
</html>