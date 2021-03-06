<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../common/common.jsp" %>
<html>
<body>
<div id="loan_add_part4" class="container-fluid" style="padding: 50px 0px 0px 10px;width:50%;">
<form class="form-horizontal" id="loan_add_part4_form" method="post">
	<table width="100%" id="showTable">
      <tr>
          <td>
          		<span style="color: red;">*</span><span style="font-size: 24px;">债权清单</span><span style="font-size: 12px;margin-left: 20px;"></span>
          		<input style="margin-left: 820px;" type="button" class="btn btn-primary" value="上传附件" onclick="upButton('0','loanOrders');">
          		<br/><hr>
          		
          		<div id="loanOrders">
          			<c:forEach var="cusvo" items="${cusvoList }">
          				<c:if test="${cusvo.type == 0}">
          				<div id='img_${cusvo.fileName}_div' style='display : inline-block;position : relative;margin-right: 15px;'>
          					<img id='img_${cusvo.fileName }' alt='' width="100px;" height="100px;" src='${picPath}${cusvo.attachment.url }' onclick='showBig(${cusvo.snapshotId})'> 
          					<img src='${picPath}/picture/delImg.png' id='img_${cusvo.fileName }_delete'  onclick='delImg(${cusvo.snapshotId})'  style='position : absolute;top : 0px;right : 0px;width : 20px;height : 18px;'/> 
          				</div>
          				</c:if>
					</c:forEach>
				</div>
				<div id="loanOrders_name">
          			<c:forEach var="cusvo" items="${cusvoList }">
          				<c:if test="${cusvo.type == 0}">
          					<span id='img_${cusvo.fileName }_span' style='margin: 20px;'>${cusvo.attachment.fileName }</span>
          				</c:if>
					</c:forEach>
				</div>
				
				<hr style="margin-bottom: 20px;">

			  <span style="color: red;">*</span><span style="font-size: 24px;">其他</span><span style="font-size: 12px;margin-left: 20px;"></span>
          		<input style="margin-left: 820px;" type="button" class="btn btn-primary" value="上传附件" onclick="upButton('1','otherOrders');">
          		<br/><hr>

          		<div id="otherOrders">
          			<c:forEach var="cusvo" items="${cusvoList }">
          				<c:if test="${cusvo.type == 1}">
          				<div id='img_${cusvo.fileName}_div' style='display : inline-block;position : relative;margin-right: 15px;'>
          					<img id='img_${cusvo.fileName }' alt='' width="100px;" height="100px;" src='${picPath}${cusvo.attachment.url }' onclick='showBig(${cusvo.snapshotId})'>
          					<img src='${picPath}/picture/delImg.png' id='img_${cusvo.fileName }_delete'  onclick='delImg(${cusvo.snapshotId})'  style='position : absolute;top : 0px;right : 0px;width : 20px;height : 18px;'/>
          				</div>
          				</c:if>
					</c:forEach>
				</div>
				<div id="otherOrders_name">
          			<c:forEach var="cusvo" items="${cusvoList }">
          				<c:if test="${cusvo.type == 1}">
          					<span id='img_${cusvo.fileName }_span' style='margin: 20px;'>${cusvo.attachment.fileName }</span>
          				</c:if>
					</c:forEach>
				</div>

				<hr style="margin-bottom: 20px;">


          </td>
      </tr>
	</table>
	
</form>
</div>

<script type="text/javascript">

// 执行:上传附件。
function upButton(state,typeList){
//	var divNum = document.getElementById("loanOrders").getElementsByTagName("div").length;
//	if(state == 0) {
//		if(divNum>=2)
//		{
//			$.messager.alert("系统提示", "债权清单最多放2张!", "info");
//			return;
//		}
//	}
	
	$("#loan_add_part4_form").after("<div id='upload_snapshot_add' style=' padding:10px; '></div>");
	$("#upload_snapshot_add").dialog({
        resizable: false,
        title: '上传图片',
        href: '${ctx}/jsp/loanManage/loan/uploadSnapshotAdd?state='+ state + '&typeList=' + typeList + '&loanApplicationId=${loanApplicationId}' + '&isCode=1',
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
function showBig(cusId)
{
	$("#showTable").after("<div id='show_big_picture' style=' padding:10px; '></div>");
	 $("#show_big_picture").dialog({
	        resizable: false,
	        title: '大图',
	        href: '${ctx}/jsp/loanManage/loan/toShowBigPicture?cusId='+cusId,
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

function delImg(cusId,id)
{
	$.messager.confirm('确认信息','是否确认删除该张图片？',function(r){
		if(r){
			try {
            	$.post("${ctx}/jsp/loanManage/loan/delImg?cusId="+cusId,
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
