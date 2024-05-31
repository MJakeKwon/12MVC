<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>��ǰ �����ȸ</title>

<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
<script type="text/javascript">
	function fncGetList(currentPage){
			
	        $("#currentPage").val(currentPage)
	        $("form").attr("method","POST").attr("action","/product/listProduct").submit();
	    }
	    
	   $(function() {
		   $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		   var menu = '${param.menu}';
		   
		   $(".details-btn01").css("color", "red");
		   $(".sdetails-btn01").css("cursor", "pointer");


			$("h7").css("color" , "red");
			
			$( ".details-btn01").on("click" , function() 
					{
					   	if(menu=='manage')
					   	{
					   			self.location ="/product/updateProduct?prodNo="+$(this).parent().children('input').val()+"&menu="+menu;
					   	}else
					   		{
					   			self.location ="/product/getProduct?prodNo="+$(this).parent().children('input').val()+"&menu="+menu;
					   		}
				});
			   $(document).ready(function() {
				    $('.updateTranCode').on('click', function() {
				        var tranNo = $(this).data('tranno');
				        var tranCode = $(this).data('trancode');

				        // ������ ���𷺼� ����
				        window.location.href = "/purchase/updateTranCode?tranNo=" + tranNo + "&tranCode=" + tranCode;
				    });
				});
			
			});
	
	   
	   //==========================================================
		 
		   $(document).ready(function() {
			    $('.details-btn').on('click', function() {
			        var prodNo = $(this).data('prodno');
			        fetchProductDetails(prodNo);
			    });
			});
	   			
	  		 function fetchProductDetails(prodNo){
			      
			      $.ajax({
			            url : "/product/json/getProduct/"+prodNo,
			            method : "GET",
			            dataType:"json",
			            headers:{
			               "Accept" : "application/json",
			               "Content-Type" : "application/json"
			            },
			            success : function(JSONData, status){
			               
			               //alert("JSONData: \n"+JSONData);
			               
			               var displayValue="<h3>"
			                           +"��ǰ��ȣ : "+JSONData.product.prodNo+"<br/>"
			                           +"��ǰ�� : "+JSONData.product.prodName+"<br/>"
			                           +"��ǰ�̹��� : "+JSONData.product.fileName+"<br/>"
			                           +"��ǰ������ : "+JSONData.product.prodDetail+"<br/>"
			                           +"�������� : "+JSONData.product.manuDate+"<br/>"
			                           +"���� : "+JSONData.product.price+"<br/>"
			                           +"������� : "+JSONData.product.regDate+"<br/>"
			                           +"</h3>";
			               $("h3").remove();
			               $("#"+prodNo+"" ).html(displayValue);
			            }
			         }); 
			   }; 
		  		 
		  		 
	   
	   

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
	<div class="page-header text-info">
	       <tr>
							<td width="93%" class="ct_ttl01">
							<c:set var="title" value="${menu eq 'manage' ? '��ǰ����' : '��ǰ �����ȸ'}" />
							<h3>${title}</h3>
							</td>
						</tr>
	    </div>
	
	
	<div class="container" style="width: 98%; margin-left: 10px;">
    	<div class="row">
	        <div class="col-md-6 text-left">
	            <p class="text-primary">
	                ��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������
	            </p>
	        </div>
	        
	        <div class="col-md-6 text-right">
	            <form class="form-inline" name="detailForm" action="/product/listProduct?menu=${menu}" method="post">
	                <div class="form-group">
	                    <select class="form-control" name="searchCondition">
	                        <option value="1" ${search.searchCondition eq '1' ? 'selected' : ''}>��ǰ��</option>
	                    	<option value="2" ${search.searchCondition eq '2' ? 'selected' : ''}>��ǰ����</option>
	                    </select>
	                </div>
	                
	                <div class="form-group">
	                    <label class="sr-only" for="searchKeyword">�˻���</label>
	                    <input type="text" class="form-control" id="searchKeyword" 
	                    			name="searchKeyword" placeholder="�˻���" 
	                    				value="${!empty search.searchKeyword ? search.searchKeyword : ''}"/>
	                </div>
	                
	                <button type="submit" class="btn btn-default" id="search">�˻�</button>
	                
	                <!-- PageNavigation ���� ������ ���� ������ �κ� -->
	                <input type="hidden" id="currentPage" name="currentPage" value=""/>
	            </form>
	        </div>
	    </div>
	</div>
		
		<table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��</th>
            <th align="left">�ڼ�������</th>
            <th align="left">����</th>
            <th align="left">�����</th>
            <th align="left">�����</th>
          </tr>
        </thead>
       
		<tbody>

			<c:set var="i" value="0" /> <!-- i ���� �ʱ�ȭ -->
			<c:forEach var="product" items="${list }"> <!-- list�� �� ��ҿ� ���� �ݺ� -->
			    <c:set var="i" value="${i+1 }"/> <!-- i ���� 1 ������Ŵ -->
			    
				<tr class="ct_list_pop">
					<td align="center">${ i }</td>
					
					<td align="left">
						<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
					    <input type="button" class="details-btn01" data-prodno="${product.prodNo}" value=${product.prodName} />
					</td>
					
					<td align="left">
					    <input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
					    <input type="button" class="details-btn" data-prodno="${product.prodNo}" value="�ڼ��� ����" />
					</td>
					
					
					<td align="left">${product.price}</td>
					<td align="left">${product.regDate}</td>
					
					<c:if test="${user.role == 'admin'}">
				    <c:choose>
				        <c:when test="${product.proTranCode == '0'}">
				            <td align="left">�Ǹ���</td>
				        </c:when>
				        <c:when test="${product.proTranCode == '1'}">
				            <td align="left">�����Ϸ�
				                <%-- <a href="/purchase/updateTranCode?tranNo=${product.tranNo}&tranCode=2"> --%>
				                <button type="button" class="updateTranCode" data-tranno="${product.tranNo}" data-trancode="2" > ����ϱ� </button>
				            </td>
				        </c:when>
				        <c:when test="${product.proTranCode == '2'}">
				            <td align="left">�����</td>
				        </c:when>
				        <c:when test="${product.proTranCode == '3'}">
				            <td align="left">��ۿϷ�</td>
				        </c:when>
				    </c:choose>
				</c:if>
				
				<c:if test="${user.role != 'admin'}">
				    <c:choose>
				        <c:when test="${product.proTranCode == '0'}">
				            <td align="left">�Ǹ���</td>
				        </c:when>
				        <c:otherwise>
				            <td align="left">������</td>
				        </c:otherwise>
				    </c:choose>
				</c:if>
					
			</c:forEach>
			 </tbody>
		</table>

			
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
            
            
			

	</div>
</body>
</html>