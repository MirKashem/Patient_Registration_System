using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class BloodDonation_LogIn : System.Web.UI.Page
{

    SqlConnection cn = new SqlConnection(@"Data Source=MIR;Initial Catalog=db1;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void b1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("SELECT username, password from admin_login where username=@username and password=@password",cn);
        cmd.Parameters.AddWithValue("@username", uname.Text);
        cmd.Parameters.AddWithValue("@password", pass.Text);
        cn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["id"] = uname.Text; 
            Response.Redirect("patDataView.aspx");
            uname.Text = "";
            pass.Text = ""; 
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Invalid username or password');", true);
        }
        cn.Close();
    }

}