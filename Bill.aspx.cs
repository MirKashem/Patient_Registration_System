
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;

public partial class BloodDonation_Bill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string caseNo = Request.QueryString["CaseNo"];

        
        string memoNo = Request.QueryString["MemoNo"];

        
        Session["MemoNo"] = memoNo;

        
        if (!string.IsNullOrEmpty(caseNo))
        {
            CaseNo.Value = caseNo;
        }
        else
        {
            
            Response.Write("CaseNo is missing");
        }
    }

    // Web method to fetch patient information
    [WebMethod(EnableSession = true)]
    public static Dictionary<string, object> Info(string CaseNo)
    {
        string MemoNo = HttpContext.Current.Session["MemoNo"].ToString();
        // Database connection string
        string connectionString = @"Data Source=MIR;Initial Catalog=db1;Integrated Security=True";

        // Dictionary to hold the result
        Dictionary<string, object> result = new Dictionary<string, object>();

        try
        {
            // Establishing connection to the database
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                
                string query = @"SELECT PR.F_NAME, PR.M_NAME, PR.L_NAME, PR.DOB, PR.REG_DATE, PR.SEX, PR.CONSULT_DATE, PT.TREATMENT_NAME, PT.COST, CONVERT(VARCHAR(10), PT.TreatmentDate, 120) AS TreatmentDate, PT.qty 
                 FROM [db1].[dbo].[PAT_REGISTRATION] PR 
                 JOIN [db1].[dbo].[Pat_Treatment] PT ON PR.CaseNo = PT.CaseNo 
                 WHERE PT.MemoNo = @MemoNo";


                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CaseNo", CaseNo);
                    cmd.Parameters.AddWithValue("@MemoNo", MemoNo);


                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        List<Patient> patients = new List<Patient>();
                        decimal totalCost = 0;

                        // Iterate through the result set
                        while (reader.Read())
                        {
                            Patient patient = new Patient
                            {
                                CaseNo = CaseNo,
                                MemoNo = MemoNo,
                                F_NAME = reader["F_NAME"].ToString(),
                                M_NAME = reader["M_NAME"].ToString(),
                                L_NAME = reader["L_NAME"].ToString(),
                                DOB = reader["DOB"].ToString(),
                                REG_DATE = reader["REG_DATE"].ToString(),
                                SEX = reader["SEX"].ToString(),
                                CONSULT_DATE = reader["CONSULT_DATE"].ToString(),
                                TREATMENT_NAME = reader["TREATMENT_NAME"].ToString(),
                                COST = reader["COST"].ToString(),
                                TreatmentDate = reader["TreatmentDate"].ToString(),
                                qty = reader["qty"].ToString()
                            };

                            patients.Add(patient);
                            totalCost += Convert.ToDecimal(patient.COST);
                        }

                        // Add patients and total cost to the result dictionary
                        result.Add("patients", patients);
                        result.Add("totalCost", totalCost);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Log the exception
            Console.WriteLine("Error: " + ex.Message);
            // Rethrow the exception to return it to the client
            throw;
        }

        // Return the result dictionary
        return result;
    }

    // Define the Patient class
    public class Patient
    {
        public string CaseNo { get; set; }
        public string MemoNo { get; set; }
        public string F_NAME { get; set; }
        public string M_NAME { get; set; }
        public string L_NAME { get; set; }
        public string DOB { get; set; }
        public string REG_DATE { get; set; }
        public string SEX { get; set; }
        public string CONSULT_DATE { get; set; }
        public string TREATMENT_NAME { get; set; }
        public string COST { get; set; }
        public string TreatmentDate { get; set; }
        public string qty { get; set; }
    }
}
