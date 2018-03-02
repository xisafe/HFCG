<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../common/common.jsp" %>
<html>
<body>
<div id="pledge_add_part2" class="container-fluid" style="padding: 50px 0px 0px 10px;width:50%;">
<form class="form-horizontal" id="pledge_add_part2_form" method="post">
<input type="hidden" name="loanApplicationId" id="loanApplicationId" value="${loanApplicationId }">
	<table width="100%" id="showTable">
      <tr>
          <td>
          		<!-- 法人身份证 -->
          		<span style="font-size: 24px;">法人身份证</span>
          		<input style="margin-left: 820px;" type="button" class="btn btn-primary" value="上传附件" onclick="upButton('0','legalIdentityCard');">
          		<br/><hr>
          		<div id="legalIdentityCard">
					
				</div>
				<div id="legalIdentityCard_name">
					
				</div>
				<hr style="margin-bottom: 20px;">
				
				<!-- 法人征信报告 -->
				<span style="font-size: 24px;">法人征信报告</span>
          		<input style="margin-left: 820px;" type="button" class="btn btn-primary" value="上传附件" onclick="upButton('1','legalPersonPledgeReport');">
          		<br/><hr>
          		<div id="legalPersonPledgeReport">
				
				</div>
				<div id="legalPersonPledgeReport_name">
					
				</div>
				<hr style="margin-bottom: 20px;">
				
				<!-- 司法查询 -->
				<span style="font-size: 24px;">司法查询</span>
          		<input style="margin-left: 820px;" type="button" class="btn btn-primary" value="上传附件" onclick="upButton('2','judicialInquiry');">
          		<br/><hr>
          		<div id="judicialInquiry">
					
				</div>
				<div id="judicialInquiry_name">
					
				</div>
				<hr style="margin-bottom: 20px;">
				
				<!-- 合同协议 -->
				<span style="font-size: 24px;">合同协议</span>
          		<input style="margin-left: 820px;" type="button" class="btn btn-primary" value="上传附件" onclick="upButton('3','contractAgreement');">
          		<br/><hr>
          		<div id="contractAgreement">
					
				</div>
				<div id="contractAgreement_name">
					
				</div>
				<hr style="margin-bottom: 20px;">
				
				<!-- 项目资料 -->
				<span style="font-size: 24px;">项目资料</span>
          		<input style="margin-left: 820px;" type="button" class="btn btn-primary" value="上传附件" onclick="upButton('4','projectData');">
          		<br/><hr>
          		<div id="projectData">
					
				</div>
				<div id="projectData_name">
					
				</div>
				<hr style="margin-bottom: 20px;">
				
				<!-- 实地尽调 -->
				<span style="font-size: 24px;">实地尽调</span>
          		<input style="margin-left: 820px;" type="button" class="btn btn-primary" value="上传附件" onclick="upButton('5','fieldAdjustment');">
          		<br/><hr>
          		<div id="fieldAdjustment">
					
				</div>
				<div id="fieldAdjustment_name">
					
				</div>
				<hr style="margin-bottom: 20px;">
				
				<!-- 其它 -->
				<span style="font-size: 24px;">其它</span>
          		<input style="margin-left: 820px;" type="button" class="btn btn-primary" value="上传附件" onclick="upButton('6','other');">
          		<br/><hr>
          		<div id="other">
					
				</div>
				<div id="other_name">
					
				</div>
				<hr style="margin-bottom: 20px;">
				
				

          </td>
      </tr>
	</table>
	
</form>
</div>

<script type="text/javascript">

//执行:上传附件。
function upButton(state,typeList){
	var loanApplicationId = $("#loanApplicationId").val();
	
	$("#pledge_add_part2_form").after("<div id='upload_snapshot_add' style=' padding:10px; '></div>");
	$("#upload_snapshot_add").dialog({
        resizable: false,
        title: '上传图片',
        href: '${ctx}/jsp/enterprise/loan/loanUploadSnapshotAdd?state='+ state + '&typeList=' + typeList + '&loanApplicationId=' + loanApplicationId + '&isCode=1&loanType=6',
        width: 400,
        height: 420,
        modal: true,
        top: 100,
        left: 200,
        buttons: [
            {
                text: '提交',
                iconCls: 'icon-ok',
                handler: function () {
                    $("#upload_snapshot_add").contents().find("#upload_snapshot_add_form").submit();
                }
            },
            {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $("#upload_snapshot_add").dialog('close');
                }
            }
        ],
        onClose: function () {
            $(this).dialog('destroy');
        }
    });
}

// 显示大图片
function showBig(cusId){
	$("#showTable").after("<div id='show_big_picture' style=' padding:10px; '></div>");
	 $("#show_big_picture").dialog({
	        resizable: false,
	        title: '大图',
	        href: '${ctx}/jsp/enterprise/loan/toLoanShowBigPicture?cusId='+cusId,
	        width: 400,
	        height: 420,
	        modal: true,
	        top: 100,
	        left: 200,
	        
	        onClose: function () {
	            $(this).dialog('destroy');
	        }
	    });
}

// 删除图片
function delImg(cusId,id){
	$.messager.confirm('确认信息','是否确认删除该张图片？',function(r){
		if(r){
			try {
            	$.post("${ctx}/jsp/enterprise/loan/delLoanImg?cusId="+cusId,
                    	function(data){
                    		if(data.result == "success"){
                    			$.messager.alert("系统提示", "操作成功!", "info");
                    			 var myDiv = document.getElementById("img_"+data.divId+"_div");
                    			 var mySpan = document.getElementById("img_"+data.divId+"_span");
                    			    if (myDiv != null)
                    			    	myDiv.parentNode.removeChild(myDiv);
                    			    if (mySpan != null)
                    			    	mySpan.parentNode.removeChild(mySpan); 
                    		}
                    		if(data.result == "error"){
                    			$.messager.alert("系统提示", "操作失败!", "info");
                    			return;
                    		}
            	  		});
            } catch (e) {
                alert("删除失败！"+e);
                return;
            }
		} 
	});
}
</script>
</body>
</html>
