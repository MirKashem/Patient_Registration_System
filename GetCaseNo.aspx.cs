using System;
using System.Data.SqlClient;
using System.Web.Services;

public partial class BloodDonation_GetCaseNo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public class Patient
    {
        public string CaseNo { get; set; }
        public string REG_DATE { get; set; }
        public string P_TAG { get; set; }
        public string F_NAME { get; set; }
    }

    [WebMethod]
    public static Patient PatInfo()
    {
        Patient patientDetails = new Patient();
        try
        {
            string connectionString = @"Data Source=MIR;Initial Catalog=db1;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT TOP 1 CaseNo, REG_DATE, P_TAG, F_NAME FROM PAT_REGISTRATION ORDER BY CaseNo DESC;";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        patientDetails.CaseNo = reader["CaseNo"].ToString();
                        patientDetails.REG_DATE = reader["REG_DATE"].ToString();
                        patientDetails.P_TAG = reader["P_TAG"].ToString();
                        patientDetails.F_NAME = reader["F_NAME"].ToString();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Log or handle the exception as needed
            throw ex; // You can modify this to return an error message instead of throwing an exception
        }
        return patientDetails;
    }
}
