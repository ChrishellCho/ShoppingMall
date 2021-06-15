using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI.HtmlControls;


namespace ShoppingMall
{
	public partial class CheckID : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btnCheck_Click(object sender, EventArgs e)
		{
			string id = txtUserID.Text;

			string connectionString = WebConfigurationManager.ConnectionStrings["ShopDB"].ConnectionString;

			SqlConnection objCon = new SqlConnection(connectionString);
			objCon.Open();


			SqlCommand objCmd = new SqlCommand();
			objCmd.Connection = objCon;
			objCmd.CommandText = $@"SELECT UserID FROM Users WHERE UserID = '{id}'";
			objCmd.CommandType = CommandType.Text;

			SqlDataReader objDr = objCmd.ExecuteReader();

			if (objDr.Read())
			{
				this.lblMsg.Text = "사용하실 수 없습니다.";
			}
			else
			{
				this.lblMsg.Text = "사용하실 수 있습니다.";
				// 사용할 수 있는 id에 경우에만 '사용하기'버튼 보이기
				btnUseID.Attributes["style"] = "visibility:visible";
			}
			objDr.Close(); objCon.Close();
		}
	}
}