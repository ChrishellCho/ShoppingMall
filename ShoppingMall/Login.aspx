<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShoppingMall.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
  <h2>로그인</h2>

  <table>
    <tr>
      <td>아이디 :</td>
      <td>
        <input type="text" id="txtUserID" placeholder="Enter your ID" />
      </td>
    </tr>
    <tr>
      <td>비밀번호 :</td>
      <td>
					<input id="txtPassword" type="password" placeholder="Enter your Password" />
      </td>
    </tr>
    <tr>
      <td>
        <input id="btnLogin" type="button" value="로그인"  /></td>
      <td>
        <input id="btnCancel" type="button" value="취소" /></td>
    </tr>
  </table>
    <%--<form id="form1" runat="server">
        <div>
          <h1>로그인</h1>
          <table>
            <tr>
              <td>아이디 :</td>
              <td>
                <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valUserID" runat="server" ErrorMessage="아이디를 입력하세요" ControlToValidate="txtUserID" Display="None" SetFocusOnError="true" ValidationGroup="LoginForm"></asp:RequiredFieldValidator>
              </td>
            </tr>
            <tr>
              <td>비밀번호 :</td>
              <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valPassword" runat="server" ControlToValidate="txtPassword" Display="None" SetFocusOnError="true" ValidationGroup="LoginForm" ErrorMessage="비밀번호를 입력하세요"></asp:RequiredFieldValidator>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:Label ID="lblText" runat="server" Text=""></asp:Label>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:Button ID="btnLogin" runat="server" Text="로그인" ValidationGroup="LoginForm" OnClick="btnLogin_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="취소" OnClick="btnCancel_Click" />
              </td>
            </tr>
          </table>
        </div>
    </form>--%>
</body>
</html>
