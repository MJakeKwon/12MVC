<!-- ��ǰ ��� ��ǰ ���� ���� ����-->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<title>��ǰ���</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
<!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	
		body {
            padding-top : 50px;
        }
	    .input-group-addon {
	        cursor: pointer; /* �޷� �����ܿ� ���콺 ���� �� Ŀ�� ���� */
	        border: none; /* �׵θ� ���� */
	        background: transparent; /* ���� ���� */
	    }
        
    </style>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>

<script type="text/javascript">

	function fncAddProduct() {
		
		var name =$("#prodName").val();
		var detail = $("#prodDetail").val();
		var manuDate = $("#manuDate").val();
		var price = $("#price").val();
		
		if(name == null || name.length<1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		
		$("form").attr("method","POST").attr("action","/product/addProduct").submit();
	}
	
	$(function(){
		
		$("#registerButton").on("click", function(){
			console.log("��� ��")
			fncAddProduct();
		});
		
        $("#cancelButton").on("click", function() {
			history.go(-1);
		});
		
		$("#calendar").on("click",function(){
            show_calendar('document.forms[0].manuDate', document.forms[0].manuDate.value);
		});
	});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
   	<div class="page-header text-center">
	       <h3 class=" text-info">��ǰ���</h3>
    </div>
   	
	   <form class="form-horizontal" method="POST" action="/product/addProduct" enctype="multipart/form-data">
   		
   		 <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${prodName}" >
		    </div>
		  </div>
		  
	  	<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		        <input type="text" class="form-control" id="prodDetail" name="prodDetail"
		               value="${prodDetail}">
		    </div>
		</div>
   		
	  	<div class="form-group">
	    	<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
	    	        <div class="input-group">
		        		<input type="text" class="form-control" id="manuDate" name="manuDate"	value="${manuDate}"  readonly="readonly">
	        		  	<span class="input-group-addon">
               				<img id ="calendar" src="../images/ct_icon_date.gif" width="15" height="15" />
               			</span>
   	      		 </div>
		    </div>
		</div>
		
		<div class="form-group">
	    	<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    	<div class="col-sm-4">
	        		<input type="text" class="form-control" id="price" name="price"
		               value="${price}" >
	            </div>
	    </div>   
		   
		    <div class="form-group">
		        <label for="uploadFile" class="col-sm-3 control-label">��ǰ�̹���</label>
		        <div class="col-sm-6">
		            <input type="file" class="form-control" id="uploadFile" name="uploadFile" multiple>
		        </div>
		    </div>
		    
	    <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="registerButton">��&nbsp;��</button>
			  <button type="button" class="btn btn-primary" id="cancelButton">��&nbsp;��</button>
		    </div>
		</div>
		
   	</form>
	
</body>
</html>