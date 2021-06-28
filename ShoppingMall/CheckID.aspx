<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckID.aspx.cs" Inherits="ShoppingMall.CheckID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
</head>
<body>
	<script>
		function CloseForm() {
			opener.document.getElementById('<%= Request["txtUserID"]%>').value = document.getElementById('<%= txtUserID.ClientID %>').value;
			window.close();
		}

	</script>
	<form id="form1" runat="server">
		<div>
			<h3>아이디 중복 검사</h3>
			<asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
			<asp:Button ID="btnCheck" runat="server" Text="검사" OnClick="btnCheck_Click" />
			<input id="btnUseID" type="button" value="사용하기" onclick="CloseForm();" runat="server" style="visibility: hidden" /><br />
			<asp:RequiredFieldValidator ID="valUserID" runat="server" ErrorMessage="아이디를 입력하세요" ControlToValidate="txtUserID" SetFocusOnError="true"></asp:RequiredFieldValidator>
			<br />
			<asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
			<script>
				<% 
				if (!Page.IsPostBack) // 처음 로드할 때에만 부모창에 있는 값을 가져오기
				{
				%>
				document.getElementById('<%= txtUserID.ClientID %>').value =
					opener.document.getElementById('<%= Request["txtUserID"] %>').value;
				<%
				}
				%>
			</script>
		</div>
	</form>
</body>
</html>
