<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShoppingMall.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            메인 페이지

        </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">HyperLink</asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server">HyperLink</asp:HyperLink>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> 님 반갑습니다 <br />
                <asp:LinkButton ID="LinkButton1" runat="server">로그아웃</asp:LinkButton>
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
