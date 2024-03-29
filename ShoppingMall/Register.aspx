﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ShoppingMall.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<script src="D:\GITHUB\ShoppingMall\ShoppingMall\address.js"></script>
	<title></title>

</head>
<body>

	<h2>회원가입</h2>
	<div class="container">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input id="txtUserID" type="text" placeholder="Enter your ID" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input id="txtPassword" type="text" placeholder="Enter your password" /></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input id="txtPasswordConfirm" type="text" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input id="txtUserName" type="text" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" id="sample3_postcode" placeholder="우편번호" />
					<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기" /><br />
					<input type="text" id="sample3_address" placeholder="주소" /><br />
					<input type="text" id="sample3_detailAddress" placeholder="상세주소" />
					<input type="text" id="sample3_extraAddress" placeholder="참고항목" /></td>
			</tr>
			<tr>
				<td>추천인</td>
				<td>
					<input id="txtIntroducer" type="text" /></td>
			</tr>
		</table>

	</div>

	<%--<script>
		function OpenCheckID() {
			window.open('./CheckID.aspx?txtUserID=<%= txtUserID.ClientID %>', '', 'width=400,height=200');
			return false;
		}
	</script>
	<form id="form1" runat="server">
		<div>
			<h1>회원가입</h1>
			<table>

				<tr>
					<td class="auto-style1">아이디 :</td>
					<td class="auto-style1">
						<asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator ID="valUserID" runat="server" ErrorMessage="ID를 입력하세요" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtUserID"></asp:RequiredFieldValidator>
						<asp:CustomValidator ID="valUserIDLength" runat="server" ErrorMessage="ID는 3자 이상 12자 이하로 입력하세요" ControlToValidate="txtUserID" Display="None" SetFocusOnError="True" OnServerValidate="valUserIDLength_ServerValidate"></asp:CustomValidator>
						<asp:Button ID="btnIDCheck" runat="server" Text="아이디중복체크" OnClick="btnIDCheck_Click" OnClientClick="return OpenCheckID()" />
						<asp:Label ID="lblCheckResult" runat="server" Text=""></asp:Label>
					</td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td>
						<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
						<asp:RequiredFieldValidator ID="valPassword" runat="server" ErrorMessage="비밀번호를 입력하세요" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인 :</td>
					<td>
						<asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password"></asp:TextBox>
						<asp:CompareValidator ID="valPasswordConfirm" runat="server" ControlToCompare="txtPassword" ErrorMessage="비밀번호가 일치하지 않습니다" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPasswordConfirm"></asp:CompareValidator>
					</td>
				</tr>
				<tr>
					<td class="auto-style1">이름 : </td>
					<td class="auto-style1">
						<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator ID="valUserName" runat="server" ErrorMessage="이름을 입력하세요" ControlToValidate="txtUserName" Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td>
						<input type="text" id="sample2_postcode" placeholder="우편번호">
<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample2_address" placeholder="주소"><br>
<input type="text" id="sample2_detailAddress" placeholder="상세주소">

					</td>
				</tr>
				<tr>
					<td>추천인 :</td>
					<td>
						<asp:TextBox ID="txtIntroducer" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator ID="valIntroducer" runat="server" ErrorMessage="추천인을 입력하세요" ControlToValidate="txtIntroducer" Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td>
						<asp:Button ID="btnCancel" runat="server" Text="취소" OnClick="btnCancel_Click" />
					</td>
					<td>
						<asp:Button ID="btnRegister" runat="server" Text="회원가입" OnClick="btnRegister_Click" />
					</td>

				</tr>
			</table>
		</div>
	</form>--%>
</body>
</html>
