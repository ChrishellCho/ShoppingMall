﻿using System;
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

		protected void btnIDCheck_Click(object sender, EventArgs e)
		{
			string id = txtUserID.Text;

			string connectionString = WebConfigurationManager.ConnectionStrings["ShopDB"].ConnectionString;

			SqlConnection conn = new SqlConnection(connectionString);
			conn.Open();
			string IdCheckSql = $@"SELECT COUNT (*) FROM Users WHERE UserID = '{id}'";

			SqlCommand cmd = new SqlCommand(IdCheckSql, conn);
			int CountResult = (int)cmd.ExecuteScalar();

			Console.WriteLine(CountResult);

			if (CountResult == 1)
			{
				lblCheckResult.Text = "이미 존재하는 ID입니다.";
				txtUserID.Text = "";
			}
			else
			{
				lblCheckResult.Text = "사용할 수 있는 ID입니다.";
				Global.IdCheck = "checked";
			}
			conn.Close();

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

		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("Default.aspx");
		}	

		protected void btnRegister_Click(object sender, EventArgs e)
		{	

			if (Global.IdCheck != "checked"){
				string script = "alert('ID중복체크가 필요합니다.')";
				Guid guidKey = Guid.NewGuid(); 
				Page.ClientScript.RegisterStartupScript(typeof(Page), guidKey.ToString(), script, true);
			}
			else {
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