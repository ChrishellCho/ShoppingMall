using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ShoppingMall
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		

		protected void btnLogin_Click(object sender, EventArgs e)
		{
			string strUserID = txtUserID.Text.ToLower();
			string strPassword = txtPassword.Text;
			string strSql = String.Format($@"SELECT COUNT(UID) FROM Users WHERE UserID='{strUserID}' AND Password='{strPassword}'");

			string connectionString = WebConfigurationManager.ConnectionStrings["ShopDB"].ConnectionString;

			SqlConnection objCon = new SqlConnection(connectionString);
			objCon.Open();

			SqlCommand objCmd = new SqlCommand();

			objCmd.Connection = objCon;
			objCmd.CommandText = strSql;
			objCmd.CommandType = CommandType.Text;

			int result = Convert.ToInt32(objCmd.ExecuteScalar().ToString());

			if (result > 0)
			{
				FormsAuthentication.SetAuthCookie(txtUserID.Text, false);
				Response.Redirect("Default.aspx");
			}
			else
			{
				lblText.Text = "아이디 또는 암호가 일치하지 않습니다";
			}
		}
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("Register.aspx");
		}
	}
}