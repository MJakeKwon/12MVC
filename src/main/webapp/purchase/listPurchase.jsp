<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<style>
	  body {
            padding-top :40px;
        }
    </style>

<script type="text/javascript">
	function fncGetList() {
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">
	
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/listUser" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">���� �����ȸ</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${resultPage.totalCount}�Ǽ�, ���� ${resultPage.currentPage} ������
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">ȸ��ID</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">ȸ����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��ȭ��ȣ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����Ȳ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>

			
			
			<c:choose>
				<c:when test="${resultPage.totalCount ==0}">
					<tr class="ct_list_pop"> 
				<td align="center" colspan="100%">���� ������ �����ϴ�.</td>
					</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				</c:when>
				<c:otherwise>
					<c:set var="no" value="${list.size()}"/>
					<c:forEach var="purchase" items="${list}" varStatus="status">
						<tr class="ct_list_pop">
						<td align="center"><a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${no-status.index}</a>
						</td>
						<td></td>
						<td align="left"><a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a></td>
						<td></td>
						<td align="left">${purchase.receiverName}</td>
						<td></td>
						<td align="left">${purchase.receiverPhone}</td>
						<td></td>
						<td align="left">
							<c:choose>
								<c:when test="${purchase.tranCode eq '1'}">
								���ſϷ� // ��� �غ����Դϴ�.
								</c:when>
								<c:when test="${purchase.tranCode eq '2'}">
									�����Ͻ� ��ǰ�� ������Դϴ�.
								</c:when>
								<c:when test="${purchase.tranCode eq '3'}">
									[��ǰ ���� �Ϸ�] == ��ǰ �ŷ��� �������ϴ�.
								</c:when>						
							</c:choose>
						</td>
						<td></td>
						<td align="left">
							<c:if test ="${purchase.tranCode eq '2' }">
								<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=3"/>
								���� ����(���� Ȯ��)
								</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</table>
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
				<tr>
					<td align="center">
						<c:forEach begin="1" end="${resultPage.totalCount}" var="i">
							<a href="/purchase/listPurchase?page=${i}">${i}</a> 
						</c:forEach>
					</td>
				</tr>
			</table>
			<!--  ������ Navigator �� -->
		</form>

	</div>

</body>
</html>