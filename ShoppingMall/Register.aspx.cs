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
using System.Web.Services;

namespace ShoppingMall
{

	public static class Global
	{
		public static string IdCheck;
	}

	public partial class Register : System.Web.UI.Page
	{

		protected void Page_Load(object sender, EventArgs e)
		{

		}


		// ID 중복체크
		protected void btnIDCheck_Click(object sender, EventArgs e)
		{
			string strJs = @"
			<script language='javascript'>
			window.open('./CheckID.aspx','','width=400,height=200');
			</script>";

			Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "checkID", strJs);

		}

		// ID 길이 확인
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

		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("Default.aspx");
		}

		protected void btnRegister_Click(object sender, EventArgs e)
		{
			// ID 중복체크 여부 확인
			// 체크 안됐을 때
			if (Global.IdCheck != "checked")
			{
				string script = "alert('ID중복체크가 필요합니다.')";
				Guid guidKey = Guid.NewGuid();
				Page.ClientScript.RegisterStartupScript(typeof(Page), guidKey.ToString(), script, true);
			}
			// 체크 되었을 때 DB에 정보 저장
			else
			{
				string strUserID = txtUserID.Text;
				string strPassword = txtPassword.Text;
				string strUserName = txtUserName.Text;
				int intPostcode = int.Parse(txtPostcode.Text);
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
				objCmd.Parameters.AddWithValue("@Postcode", intPostcode);
				objCmd.Parameters.AddWithValue("@Address", strAddress);

				objCmd.ExecuteNonQuery();

				objCon.Close();

				Response.Redirect("Login.aspx");
			}

		}

	}
}