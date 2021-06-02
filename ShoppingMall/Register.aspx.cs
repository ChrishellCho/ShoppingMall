using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ShoppingMall
{
	public partial class Register : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		}

		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("Login.aspx");
		}

		protected void btnRegister_Click(object sender, EventArgs e)
		{
			string strUserID = txtUserID.Text;
			string strPassword = txtPassword.Text;
			string strUserName = txtUserName.Text;
			string strAddress = txtUserAddress.Text;
			string strIntroducer = txtIntroducer.Text;

			string connectionString = WebConfigurationManager.ConnectionStrings["ShopDB"].ConnectionString;

			string strSql = "usp_AddUser";
			SqlConnection objCon = new SqlConnection(connectionString);
			objCon.Open();

			SqlCommand objCmd = new SqlCommand();
			objCmd.Connection = objCon;
			objCmd.CommandText = strSql;
			objCmd.CommandType = CommandType.StoredProcedure;

			objCmd.Parameters.AddWithValue("@UserID", strUserID);
			objCmd.Parameters.AddWithValue("@Password", strPassword);
			objCmd.Parameters.AddWithValue("@UserName", strUserName);
			objCmd.Parameters.AddWithValue("@Introducer", strIntroducer);
			objCmd.Parameters.AddWithValue("@Address", strAddress);

			objCmd.ExecuteNonQuery();

			objCon.Close();

			Response.Redirect("Login.aspx");
		}

		protected void valUserIDLength_ServerValidate(object source, ServerValidateEventArgs args)
		{
			int len = args.Value.Length;
			if (len < 3 || len > 12)
			{
				args.IsValid = false;
			}
			else
			{
				args.IsValid = true;
			}
		}
	}
}