<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/taglibs.jsp"%>

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
<%@include file="../common/common_js.jsp"%>
<script src="${ctx }/js/cfhRegister.js" type="text/javascript"></script> 
<title>注册</title>
<style>
/*银行协议*/
.masks{
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,.5);
	position: fixed;
	top: 0;
	left: 0;
	display: none;
}
.agreements,.agreementss{
	width: 100%;
	height: 70%;
	background: #fff;
	position: absolute;
	bottom: 0;
	left: 0;
}
.agreements img{
	width: 207px;
	height: 248px;	
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -124px -103px;
}

.agreementss p,.agreements p{
	font-size: 1.6rem;
	color: #616E9C;
	text-indent: 1rem;
	position: relative;
	font-weight: bold;
}
.agreementss p span,.agreements p span{
	width: 2.2rem;
	height: 2.2rem;
	background:url(${ctx}/images/close.png) no-repeat;
	display: block;
	background-size: cover;
	position: absolute;
	right: 1rem;
	top:0;
}

.agreementss1{
	display:block;
	padding: 1rem 1.5rem;
	line-height: 1.5rem;
	color: #666;
	height:80%;
	overflow:scroll;
	}

</style>
</head>
<body id="backgd">
	<!--/顶部错误提示栏开始/-->
	<span id="alart"></span>
    <!--/顶部错误提示栏结束/-->
     <img src="${ctx}/images/banner.png" style="width:100%; position:absolute; top:0; left:0;"/>
	<form  id="frm" action="" method="post" target="test" style="margin:30% 0 0 0;">
    
		<!--用户名开始-->
		<input type="text" value="用户名" name="loginName"  id="userid" style="color:#afafaf;" min="4" maxlength="20" onfocus="if(value=='用户名'){this.style.color='#4b4b4b';value=''}" onblur="if(value==''){this.style.color='#afafaf';value='用户名'};return checkinput()"  oninput="checkSueccess();"/>
        <!--/用户名结束/-->
		<p>请输入4~20位字符，支持汉字、字母、数字及"-"、"_组合"</p>

		<!--/手机号开始/-->
    	<input type="tel" name="mobileNo" maxlength="11" value="手机号" id="telnum2"  style="color:#afafaf;" onfocus="if(value=='手机号'){this.style.color='#4b4b4b';value=''}" onblur="if(value==''){this.style.color='#afafaf';value='手机号'};return checkinput()"  oninput="checkSueccess();"/>
        <!--/手机号结束/-->
        
    <p>该手机号将用于手机号登录和找回密码</p>
<!--验证码开始-->
<div class="ic ic2">
    <input type="text" name="validCode" id="yzm" maxlength="6" value="请输入短信验证码" class="yzm" style="color:#afafaf;" onfocus="if(value=='请输入短信验证码'){this.style.color='#4b4b4b';value=''}" onblur="if(value==''){this.style.color='#afafaf';value='请输入短信验证码'};return checkinput()"  oninput="checkSueccess();"/>
    <input type="button" name="btn" id="btn" class="btn_mfyzm" value="获取验证码" />
</div>
<!--验证码结束-->
<!--密码输入框开始-->
		<div class="box">
        <span id=box><input type="password" placeholder="输入登录密码" name="loginPass"  id="psw" value=""  maxlength="16" min="6" size="16" style="color:#afafaf;" onblur=""  oninput="checkSueccess();"/></span>
		<span id='clicks' class="click1"></span>
        </div>
<!--密码输入框结束-->
<p>请输入6~16位字符，字母加数字组合，字母区分大小写</p>
<%-- <c:if test="${not empty invite_code}">
	<input type="num" id="yqm" name="inviteCode" value="${invite_code}" style="color:#afafaf;" maxlength="6" onfocus="if(value=='邀请码 (非必填)'){this.style.color='#4b4b4b';value=''}" onblur="if(value==''){this.style.color='#afafaf';value='邀请码 (非必填)'}" />
	
</c:if>
<c:if test="${empty invite_code}">
	<input type="num" id="yqm" name="inviteCode" value="邀请码 (非必填)" style="color:#afafaf;" maxlength="6" onfocus="if(value=='邀请码 (非必填)'){this.style.color='#4b4b4b';value=''}" onblur="if(value==''){this.style.color='#afafaf';value='邀请码 (非必填)'}" />
	
</c:if> --%>
<div class="checkbox"   onclick="showProtocol()">
  		<img src="${ctx }/images/chicked.png" />
        <a class="agreement">同意<span id="agreementtext">《注册协议》</span></a>
</div>  


<input type="button" name="btn2" id="btn2" class="btnall" disabled="disabled" value="加入财富派" />
</form>
<form method="post" action="" id="toVerifiedForm">
	<input type="hidden" name="hToken" id="hToken" value="${hToken}">
	<input type="hidden" name="type" id="type" value="regist">
</form>
<iframe id="test" name="test" style="display:none;"></iframe>
 <!--弹窗开始-->
    <div id="light" class="light">
    <p>
    	<img src="${ctx }/images/iconyes.png" />
    	<span>恭喜您注册成功！</span>
    </p>
    <a href="${ctx }/finance/list" id="closebt" class="closebt">去逛逛</a>
    <a href="${ctx }/person/identityAuthenticationBy" id="closebt2" class="closebt2">身份验证</a>
    </div>
	<div id="fade" class="fade"></div>
<!--弹窗结束-->
   <div class="masks" id="masks">
        <div class="agreementss">
            <p>注册服务协议<span id="off" onclick="offProtocol()"></span></p>
            <span class="agreementss1">                       

注册服务协议<br><br>


1、财富派网站（网址为：www.caifupad.com ，以下简称“本网站”）由北京汇聚融达网络科技有限公司(以下简称“本公司”)负责运营。本注册服务协议（以下简称“本协议”）双方为本网站用户与本公司，适用于用户注册使用本网站服务的全部活动。<br>

2、本网站提醒您认真阅读本协议、充分理解各条款内容后再选择是否接受本协议。除非您接受本协议所有条款，否则无权使用本网站于本协议下所提供的服务。您一经注册或使用本网站提供的服务即视为充分理解并完全接受本协议全部条款。<br>

3、在本协议履行过程中，本网站可根据实际情况对本协议的相关条款进行修改变化。一旦本协议内容发生变动，本网站将公布最新的注册服务协议，不再向用户作个别通知。如果用户不同意本网站对本协议所做的修改，有权停止使用本网站提供的服务。如果用户继续使用本网站提供的服务，则视为接受本网站对本协议所做的修改，并应遵照修改后的协议履行应尽义务。<br><br>
一、使用限制说明<br><br>

1、在使用本网站提供的服务前，您必须先在本网站完成注册，成为本网站的用户。<br>

2、用户必须为符合中华人民共和国法律规定的具有完全民事权利和民事行为能力，能够独立承担民事责任的自然人。若用户违反前述限制注册使用本网站的，其监护人应承担所有责任。<br>

3、用户有义务确保个人资料信息的真实性、完整性和有效性，并承诺对个人资料信息及时进行更新。若经本网站判断认定用户资料存在错误、虚假、过时的嫌疑，本网站有权终止会员账户。由此产生的损失，本网站不承担任何责任。<br>

4、用户有义务提供有效的联系方式，包括但不限于手机号码、电话号码、通讯地址、常用电子邮箱、联系人信息等。联系方式发生变更时，应在3日内进行更新。因用户未提供有效联系方式，导致本网站未能提供服务时，造成的损失及法律后果，由用户自行承担。<br><br>
二、服务内容<br><br>

1、本公司为用户提供【信用咨询、评估、管理，促成用户与本公司其他用户达成交易的居间服务，还款管理等服务】，用户通过本公司居间服务与其他用户达成的所有交易项下资金的存放和划转均基于用户的合法授权，通过银行或拥有相关资质的第三方机构（以下合称“支付机构”）实现，本公司作为本网站运营商并不存放交易资金。本公司通过本网站提供的所有服务内容以最终线上呈现为准。<br>

2、用户同意，其在本网站上按交易流程所确认的状态，将成为本网站进行相关操作的唯一依据。因用户未能及时对交易状态进行修改、确认而造成的损失由用户自行负责，本网站不承担任何责任。<br>

3、用户承诺，其通过本网站上传或发布的任何资料信息均真实有效。如因违背上述承诺，造成的任何法律后果，用户都将自行承担责任。此外，用户有义务及时更新个人信息资料。如因未及时更新个人信息资料，导致本网站无法正常提供服务时，本网站不承担任何责任，所有后果应由用户个人承担。<br>

4、本公司提供的各种交易信息及资料仅供用户参考，用户应考虑实际情况独立判断并作出交易决策。用户应知悉投资风险，交易发生后产生的一切风险均由用户自行承担。此外，如果本网站发现了因系统故障或其他任何原因导致的处理错误，本网站都有权纠正该错误，用户有义务根据本网站有关纠正错误的通知进行相应操作。<br>

5、本公司为用户提供借款回收的管理服务。为了更有效地追偿用户的本金、利息等资金，本公司存在与借款人协商减免违约金的情况，用户对此应理解并授权本公司进行减免违约金的操作。由此给出借人造成损失的，本公司不承担任何责任。<br>

6、本公司为用户提供银行卡认证、充值、取现、代收/代付、查询、通知等客户服务。用户确认本公司并非银行或金融机构，无法提供“即时”金额转账服务。对资金到账延迟及由此产生的收益损失，本公司不承担任何责任。<br><br>
三、风险提示<br><br>

1、用户了解并认可，通过本网站进行的交易并不能规避风险。本网站无义务为交易后产生的风险承担责任。<br>

2、本网站不对任何用户的任何交易提供任何明示或默认的保证。用户应知悉交易存在的风险，并在独立判断后作出交易决策。交易产生的风险由用户自行承担。<br>

3、本网站不能对用户发布的信息进行控制，本网站没有义务为该信息承担证明义务。本网站不能完全保证平台内容的真实性、准确性和完整性，所有信息仅为参考。<br><br>
四、服务费<br><br>

用户注册使用本网站提供的服务，本公司有权向用户收取服务费用，具体服务费用以本网站公告或具体签署的电子协议为准。用户承诺按照相关具体的电子协议或其他形式的约定向本网站支付服务费用，并同意本网站有权自其有关账户中直接扣划服务费用。用户通过本网站与其他方签订协议的，用户按照签署的协议约定向其他方支付费用。<br><br>
五、用户账户安全承诺<br><br>

成功注册为本网站用户后，用户应当妥善保管自己的用户名和密码，不得将用户名或账户转让、赠与或授权给第三方使用，因密码被遗忘、被第三方破解，使用的计算机被入侵等原因造成的交易风险均由用户自行承担。用户在此确认使用其用户的用户名和密码登录本网站及由用户在本网站的用户账户下发出的一切指令均视为用户本人的行为和真实意思表示，该等指令不可逆转，由此产生的一切责任和后果由用户本人承担，本公司、本网站不承担任何责任。<br><br>
六、用户守法承诺<br><br>

1、用户不得利用本网站从事任何违法违规活动，用户在此承诺合法使用本网站提供的服务，遵守中国现行法律、法规、规章、规范性文件的规定。若用户违反上述规定，所产生的一切法律责任和后果与本公司、本网站无关，由用户自行承担，如因此给本公司、本网站造成损失的，由用户赔偿本公司、本网站的损失。本公司保留将用户违法违规行为及有关信息资料进行公示、计入用户信用档案、按照法律法规的规定提供给有关政府部门或按照有关协议约定提供给第三方的权利。<br>

2、如用户在本网站的某些行为或言论不合法、违反有关协议约定、侵犯本公司的利益等，本公司有权基于独立判断直接删除用户在本网站上作出的上述行为或言论，有权中止、终止、限制用户使用本网站服务，而无需通知用户，亦无需承担任何责任。如用户因此而给本公司及本网站造成损失的，应当赔偿本公司及本网站的损失。<br><br>
七、不保证条款<br><br>

本网站提供的服务中不含有任何明示、暗示的，对任何用户、任何交易的真实性、准确性、可靠性、有效性、完整性等的任何保证和承诺，用户需根据自身风险承受能力，衡量本网站披露的交易内容及交易对方的真实性、可靠性、有效性、完整性，用户因其选择使用本网站提供的服务、参与的交易等而产生的直接或间接损失均由用户自己承担，包括但不限于资金损失、利润损失、营业中断等。本公司及其股东、创始人、全体员工、代理人、关联公司、子公司、分公司均不对以上损失承担任何责任。<br>

2、基于互联网的特殊性，本公司无法保证本网站的服务不会中断，对于包括但不限于本公司、本网站及相关第三方的设备、系统存在缺陷，计算机发生故障、遭到病毒、黑客攻击或者发生地震、海啸等不可抗力而造成服务中断或因此给用户造成的损失，本公司不承担任何责任，有关损失由用户自己承担。<br>

3、与本网站用户资金相关的服务均由支付机构提供，用户应依照支付机构规则进行相关账户的开设和使用，用户有义务妥善保管账户及密码并采取合理的措施保护资产安全，本公司无法保证提供资金相关服务的支付机构的服务内容和质量，亦无法保证用户与支付机构之间协议事项的无瑕疵执行，如因用户未能尽到审慎保管义务或支付机构原因造成交易不能实现甚至资产损失，本公司不承担任何责任，由相关责任方承担。<br><br>
八、责任范围<br><br>

1、本网站不对用户的投资收益做任何保证。用户需根据自身风险承受能力及本网站发布信息的可靠程度独立判断，做出交易决策。交易后产生的任何损失均由用户自行承担。<br>

2、与本公司合作的第三方机构向用户提供的服务由第三方机构自行负责，本公司不对此等服务承担任何责任。<br>

3、本网站的内容可能涉及第三方所有的信息或第三方网站，该等信息或第三方网站的真实性、可靠性、有效性等由相关第三方负责，用户对该等信息或第三方网站自行判断并承担风险，与本网站、本公司无关。<br>

4、无论如何，本公司对用户承担的违约赔偿（如有）总额不超过向用户收取的服务费用总额。<br>

5、用户由本网站任何工作人员处取得的建议、说明，均不构成本网站对服务的承诺和保证。由此产生的法律后果，本网站不承担任何责任。<br><br>
九、用户资料的使用与披露<br><br>

1、用户同意，本网站可从公开及私人资料中收集用户的额外信息，以更好地掌握用户的实际情况，为用户量身订做合适的服务。<br>

2、本网站对于用户提供的、本公司自行收集的及其他用户个人信息享有使用和披露的权利。本公司基于履行协议、提供服务、解决争议、保障交易安全等目的使用用户个人信息资料时，无需告知用户。<br>

3、用户（包括但不限于本网站注册的融资人及投资人）在此同意，对于用户在本网站注册之后进行任何违法、违规及违反本网站管理规定的行为，本网站均有权在本网站或委托第三方机构进行发布与披露，本网站对发布与披露方式、内容均不承担任何责任。<br>

4、用户授权本公司基于履行有关协议、解决争议、调停纠纷、保障本网站用户交易安全的目的等使用用户的个人资料（包括但不限于用户自行提供的以及本公司信审行为所获取的其他资料）。本公司有权调查多个用户以识别问题或解决争议， 特别是本公司可审查用户的资料以区分使用多个用户名或别名的用户。<br>

5、为避免恶意用户通过本网站从事欺诈、非法或其他刑事犯罪活动，保护本网站的正常用户合法权益，用户授权本公司可通过人工或自动程序对用户的个人资料进行评价和衡量。<br>

6、本网站采用行业标准和惯例保护用户的个人信息。本网站不会将用户信息恶意出售或免费共享给任何第三方。鉴于技术限制，本网站无法确保用户的个人信息完全不被泄露。<br>

7、本网站有义务根据有关法律要求向司法机关和政府部门提供用户的个人资料。<br>

8、若用户未能按照其与本公司及本网站其他用户签订的协议等法律文本的约定履行应尽义务，本公司有权披露用户个人信息及违约事实。本网站有权将上述信息写入网站黑名单，且与任何第三方进行数据共享，以供网站及第三方审核、催收之用。由此给用户造成的任何损失，本网站不承担法律责任。<br><br>
十、知识产权条款<br><br>

本网站中的所有内容均属于本公司所有，包括但不限于文本、数据、文章、设计、源代码、软件、图片、照片、音频、视频及其他全部信息。本网站内容受中国知识产权法律法规及各国际版权公约的保护。<br>

未经本公司事先书面同意，用户承诺不以任何形式复制、模仿、传播、出版、公布、展示本网站内容，包括但不限于电子的、机械的、复印的、录音录像的方式和形式等。用户承认本网站内容是属于本公司的财产。<br>

未经本公司书面同意，用户不得将本网站包含的资料等任何内容发布到任何其他网站或者服务器。任何未经授权对本网站内容的使用均属于违法行为，本公司有权追究用户的法律责任。<br><br>
十一、违约责任<br><br>

如一方发生违约行为，守约方可以书面通知方式要求违约方在指定的时限内停止违约行为，并就违约行为造成的损失要求违约方进行赔偿.<br><br>
十二、争议解决<br><br>

1、本服务协议的签订、效力、履行、终止、解释和争端解决受中国法律法规的管辖。<br>

2、因本协议发生任何争议或与本协议有关的争议，首先应由双方友好协商解决，协商不成的，任何一方有权将纠纷提交至本公司所在地有管辖权的人民法院诉讼解决。<br><br>
十三、 通知<br><br>

用户同意本公司以以下合理的方式向用户送达各类通知：<br>

1、公示的文案；<br>

2、站内消息、推送消息；<br>

3、根据您预留于本网站的联系方式发出的电子邮件、短信、函件等。<br><br>
十四. 其他条款<br><br>

1、本协议由用户与本网站共同签订，适用于用户在本网站的一切活动。协议内容包括但不限于协议正文条款，已发布的或将来可能发布的各类规则，都应视为协议不可分割的一部分，与协议正文条款享有同等法律效力。<br>

2、本协议不涉及本网站用户间产生的法律关系及法律纠纷。但用户应同意全面接受本网站与其他用户签订的任何协议，并承诺按照该协议承担相应的责任和义务。用户间的纠纷及争议需要本网站提供相应资料时，本网站仅接受来自司法机关的请求。<br>

3、本协议自用户同意勾选并成功注册为本网站用户之日起生效，除非本网站终止本协议或者用户丧失本网站用户资格，否则本协议始终有效。出于运行和交易安全的需要，本公司可以暂时停止提供或者限制本服务部分功能，或提供新的功能，在任何功能减少、增加或者变化时，只要用户仍然使用本公司服务，表示用户仍然同意本协议或者变更后的协议。<br>

4、本协议终止并不免除用户根据本协议或其他有关协议、规则已经发生的行为或达成的交易项下所应承担的义务和责任。<br>

5、本公司对于用户的某一违约行为放弃行使本协议规定的权利的，不得视为对用户的其他违约行为放弃主张本协议项下的权利。<br>

6、本协议部分条款被认定为无效时，不影响本服务协议其他条款的效力。<br>

7、本协议中的“本网站”、“本公司”均指北京汇聚融达网络科技有限公司。<br>
</span>
        </div>
    </div>
   
</body>
</html>