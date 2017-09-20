<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>实体商品管理_商品审核</title>
<meta name="heading" content="商品审核"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">



	$(function(){

		//获得当前页面和总页数
		var pageNo = parseInt($("#currentPageNo").val());
		var totalPage = parseInt($("#totalPage").val());
		
		if(pageNo == 1 && pageNo == totalPage){
			$("#previous").hide();
			$("#next").hide();
		}else if(pageNo == 1 && pageNo < totalPage){
			$("#previous").hide();
			$("#next").show();
		}else if(pageNo > 1 && pageNo < totalPage){
			$("#previous").show();
			$("#next").show();
		}else if(pageNo > 1 && pageNo == totalPage){
			$("#previous").show();
			$("#next").hide();
		}
		
		$("#next").click(function(){
			pageNo++;
			$("#pageNo").val(pageNo);
			$("#form1").submit();
		});
		$("#previous").click(function(){
			pageNo--;
			$("#pageNo").val(pageNo);
			$("#form1").submit();
		});
		$("#firstPage").click(function(){
			
			$("#pageNo").val(1);
			$("#form1").submit();
		});
		$("#lastPage").click(function(){
			
			$("#pageNo").val(totalPage);
			$("#form1").submit();
		});
		
		$("#selectPage").change(function(){
			var page = $(this).val();
			$("#pageNo").val(page);
			$("#form1").submit();
		});
		
		$("#selectPage").val(pageNo);
		
		
		
		/* //获得总记录数
    	var totalCount = parseInt($("#totalCount").val());
    	//获得当前页
    	var currentPageNo = parseInt($("#currentPageNo").val());
    	//总页数
    	var totalPage = parseInt($("#totalPage").val()); */
    	
    	<%-- <span class="r page">
        <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
        <input type="hidden" value="${page.totalCount}" id="totalCount" name="totalCount" />
        <input type="hidden" value="${page.pageNo}" id="currentPageNo" name="currentPageNo" />
        <input type="hidden" value="${page.pageNum}" id="totalPage" name="totalPage" />
                共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var>
        <a href="javascript:void(0);" id="previous"  title="上一页">上一页</a>
        <a href="javascript:void(0);" id="next"  title="下一页">下一页</a>
    </span> --%>
    	
    	/* //设置总记录数
    	$("#pagePiece").html(totalCount);
    	//设置当前页和总页数
    	
    	$("#pageTotal").html(currentPageNo+"/"+totalPage);
    	//如果当前页是第一页并且总记录数小于每页的记录数
    	if(currentPageNo <= 1 && totalCount < 5){
    		$("#previous").hide();
    		$("#next").hide();
    		//如果当前页是第一页并且总记录数大于每页的记录数
    	}else if(currentPageNo <= 1 && totalCount >= 5){
    		$("#next").show();	
    		$("#previous").hide();
    		//如果当前页是最后一页并且总页数是只有一页
    	}else if(currentPageNo >= totalPage && totalPage == 1){
    		$("#next").hide();
    		$("#previous").hide();
    		//如果当前页是最后一页并且总页数是不只一页
    	}else if(currentPageNo >= totalPage && totalPage != 1){
    		$("#next").hide();
    		$("#previous").show();
    	}
    	//点击下一页对表单的提交
    	$("#next").click(function(){
    		if(currentPageNo < totalPage){
    			$("#pageNo").val(currentPageNo+1);
    		}else{
    			$("#pageNo").val(currentPageNo);
    		}
    		$("#form1").submit();
    	});
    	//点击上一页对表单的提交
    	$("#previous").click(function(){
    		if(currentPageNo > 1){
    			$("#pageNo").val(currentPageNo-1);
    		}else{
    			$("#pageNo").val(currentPageNo);
    		}
    		$("#form1").submit();
    	});
    	
    	$("a[pass]").click(function(){
    		var itemId = $(this).attr("itemId");
    		if(confirm("确认要通过吗？")){
    			window.location.href = "${path}/item/updateStatus.do?itemId="+itemId+"&auditStatus=1"
    		}
    	});
    	$("a[nopass]").click(function(){
    		var itemId = $(this).attr("itemId");
    		if(confirm("确认要不通过吗？")){
    			window.location.href = "${path}/item/updateStatus.do?itemId="+itemId+"&auditStatus=2"
    		}
    	}); */
    	
    	
    	
	});

	/* $(document).ready(function(){
    	 var obj=null;
    	$("a[group]").click(function(){
    		$("#errorInfoAdd").html("<label>&nbsp;</label>");
		    $("#itemNote").val("");
		    tipHide("#errorInfoAdd");
			tipShow('#addItemNote');
			var d=$("#addItemNote h2").attr("title","商品审核").html("商品审核");
    		obj=$(this);
		});
    	$("input[id='confirmDivOk']").click(function(){
            var form = document.getElementById("form1");
            form.action = objDelUrl + "?itemId=" + objItemId;
            form.submit();
        })
    	$("input[id='addItemNoteConfirm']").click(function(){
    		if(obj==null){
    			return;
    		}
    		var value=obj.attr("group");
			var itemId=value.split(",")[0];
			var auditStatus=value.split(",")[1];
			var itemNote=$("#itemNote").val();
			if(itemNote.length>90){
				tipShow("#errorInfoAdd");
				$("#errorInfoAdd").html("<label>&nbsp;</label>操作备注不能大于90个字符");
				return;
			}
			var ajaxData="itemId="+itemId+"&auditStatus="+auditStatus+"&itemNote="+itemNote;
	        $.ajax({
	        	type:"post",
	         	url:"${base}/item/updateItem.do",
	         	data:(ajaxData),
	         	success:function(responseText){
	            	var result=eval("("+responseText+")");
	             	if(result._status=="true"){
	             		alert("操作成功");
	             		window.location.href=window.location.href;
	             	}else{
	             		alert(result._mes);
	             	}
	             	tipHide('#addItemNote');
	        	}
	        });
    	});
    	
    	
    });
    
    function orderBy(orderBy,orderByStatus){
        $("#orderBy").val(orderBy);//代表按那个字段排序
        $("#orderByStatus").val(orderByStatus);//代表排序方式，即升序还是降序
        goSearch('#form1','#userSearch');
    }

    $(document).ready(function(){
        searchText('#searchText','#userSearch',40);
        pageInitialize('#form1','#userSearch');
        $('#goSearch').click(function(){        	
            $("#pageNo").val(1);
            goSearch('#form1','#userSearch');
        });
    });

    function singleDel(itemId) {
        var delChkUrl = $("#deleteCheckAction").val();
        
        var options = {
                beforeSubmit: showDeleteCheckRequest,
                success:      showDeleteCheckResponse,
                type:         'post',
                dataType:     "script",
                data:{
                    'itemId':itemId
                },
                url:          delChkUrl
        };
        $('#form1').ajaxSubmit(options);
    }

    function showDeleteCheckRequest(formData, jqForm, options) {
        return true;
    }

    function showDeleteCheckResponse(responseText, statusText, xhr, $form) {
        responseText = $.parseJSON(responseText);
        var status = responseText[0].deleteAble;
        if (status == "true") {
            var itemId = responseText[0].itemId;
            var delUrl = $("#deleteAction").val();
            tipShow('#confirmDiv');
            objItemId = itemId;
            objDelUrl = delUrl;
        } else if (status == "false") {
            alert(responseText[0]._mes);
        } else {
            alert("删除失败！");
        }

    } */
    
    
    
    //上下架状态回显
    $(document).ready(function(){
        if($("#auditStatus").val()=='0'){
            $("#label1") .attr("class","here");
        }
        else if($("#auditStatus").val()==2){
            $("#label2") .attr("class","here");
        }
       else  if($("#auditStatus").val()==1){
            $("#label3") .attr("class","here");
        }
        else $("#label4") .attr("class","here");
    });

</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"><</samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<span class="gray" title="商品审核">商品审核</span></div>

    <h2 class="h2_ch"><span id="tabs" class="l">
        <a id="label4" href="${path}/item/listAudit.do?showStatus=1"   title="全部实体商品" class="nor">全部</a>
        <a id="label1" href="${path}/item/listAudit.do?auditStatus=0&showStatus=1" title="待审核实体商品" class="nor">待审核</a>
        <a id="label2" href="${path}/item/listAudit.do?auditStatus=2&showStatus=1"  title="审核不通过实体商品" class="nor">审核不通过</a>
        <a id="label3" href="${path}/item/listAudit.do?auditStatus=1&showStatus=1"   title="已审核实体商品" class="nor">已审核</a>
    </span></h2>

<form id="form1" name="form1" action="${path}/item/listItem.do" method="post">
   <input id="auditStatus" type="hidden" name="auditStatus" value="${qc.auditStatus }">
    <div class="sch">
        <p>搜索：
        <select id="brandId" name="brandId">
        	<option value="">请选择品牌</option>
            <c:forEach items="${brandList }" var="brand">
            	<option value="${brand.brandId }" <c:if test="${qc.brandId == brand.brandId }">selected</c:if> >${brand.brandName }</option>
            </c:forEach>
        </select>
        <select id="auditStatus" name="auditStatus" >
        	<option value="" selected>全部审核状态</option>
        	<option value="0" <c:if test="${qc.auditStatus == 0 }">selected</c:if> >待审核</option>
        	<option value="1" <c:if test="${qc.auditStatus == 1 }">selected</c:if>>通过</option>
        	<option value="2" <c:if test="${qc.auditStatus == 2 }">selected</c:if>>不通过</option>
        </select>
        <input type="text" id="searchText" value="${qc.itemName }" name="itemName" title="请输入商品名称" class="text20 medium gray" />
        <input type="submit" id="goSearch" class="hand btn60x20" value="查询" />
    </p></div>

    <div class="page_c">
        <span class="l">
        </span>
        <span class="r inb_a">
            <a href="${path}/item/toAddItem.do" class="btn80x20" title="添加商品">添加商品</a>
        </span>
    </div>

	<table cellspacing="0" summary="" class="tab" id="myTable">
		<thead>
			<tr>
				<th>商品编号</th>
	            <th class="wp">商品名称</th>
	            <th>图片</th>
				<th>新品</th>
				<th>推荐</th>
				<th>特价</th>
	            <th>上下架</th>
	            <th>审核状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list }" var="item">
			<tr>
				<td>${item.itemNo }</td>
                <td >${item.itemName }</td>
                <td><img alt="" src="${file_path }${item.imgs}" width="50" height="50"></td>
				
				<td>
					<c:if test="${item.isNew == 1 }"><span class="is" ></span></c:if>
					<c:if test="${item.isNew == 0 }"><span class="not" ></span></c:if>
				</td>
				<td>
					<c:if test="${item.isGood == 1 }"><span class="is" ></span></c:if>
					<c:if test="${item.isGood == 0 }"><span class="not" ></span></c:if>
					
				</td>
				<td>
					<c:if test="${item.isHot == 1 }"><span class="is" ></span></c:if>
					<c:if test="${item.isHot == 0 }"><span class="not" ></span></c:if>
					
				</td>
                <td>
                	<c:if test="${item.showStatus == 0 }"><span class="is" ></span></c:if>
					<c:if test="${item.showStatus == 1 }"><span class="not" ></span></c:if>
					
                </td>
                <td>
                	
					<c:if test="${item.auditStatus == 0 }">待审核</c:if>
					<c:if test="${item.auditStatus == 1 }">通过</c:if>
					<c:if test="${item.auditStatus == 2 }">不通过</c:if>
					
                </td>
               
				<td>
							<a href="/ecps-console/shop/item/viewItem.jsp" title="查看">查看</a>
					  	
					  		
					  		<c:if test="${item.auditStatus == 2 }">
					  			<a href="/ecps-console/ecps/console/item/editItem.do?type=1&itemId=2384">编辑</a>
					  		</c:if>
					  		<c:if test="${item.auditStatus == 0 }">
					  			<a href="javascript:void(0);">通过</a>
					  			<a href="javascript:void(0);">不通过</a>
					  		</c:if>
					  		
					  		
					  			
					  			
				</td>
			</tr>
		</c:forEach>
		
		
			

		
			
			

		
			
			</tbody>
			<tr>
				<td colspan="13" align="right">
                选择：<a href="javascript:void(0);" title="全选" onclick="checkAllIds();">全选</a>
                <samp>-</samp> <a href="javascript:void(0);" title="取消" onclick="uncheckAllIds();">取消</a>
				</td>
			</tr>
	</table>
    
	<div class="page_c">
        <span class="l inb_a">
        </span>
        <span class="r page">
            <input type="hidden" id="pageNo" name="pageNo" />
            <input type="hidden" value="${page.totalCount}" id="totalCount" name="totalCount" />
            <input type="hidden" value="${page.pageNo}" id="currentPageNo" name="currentPageNo" />
            <input type="hidden" value="${page.totalPage}" id="totalPage" name="totalPage" />
                    共<var id="pagePiece" class="orange">${page.totalCount }</var>条<var id="pageTotal">${page.pageNo }/${page.totalPage }</var>
            <a href="javascript:void(0);" id="firstPage"  >首页</a>
            <a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a>
            <a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a>
            <select id="selectPage">
            	<c:forEach begin="1" end="${page.totalPage }" var="myPage">
            		<option value="${myPage }">第${myPage }页</option>
            	</c:forEach>
            </select>
            <a href="javascript:void(0);" id="lastPage"  >尾页</a>
        </span>
    </div>
</form>

</div></div>
 </body>