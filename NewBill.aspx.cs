using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services;

public partial class BloodDonation_NewBill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Page load logic (if any)
    }

    [WebMethod]
    public static Dictionary<string, object> BillInfo(string CaseNo)
    {
        string connectionString = @"Data Source=MIR;Initial Catalog=db1;Integrated Security=True";
        Dictionary<string, object> result = new Dictionary<string, object>();

        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = @"SELECT PR.F_NAME, PR.M_NAME, PR.L_NAME, PR.DOB, PR.REG_DATE, PR.SEX, PT.MemoNo, PT.TreatmentDate, SUM(CONVERT(decimal, PT.COST, 2)) AS total_cost
                                 FROM [db1].[dbo].[PAT_REGISTRATION] PR
                                 JOIN [db1].[dbo].[Pat_Treatment] PT ON PR.CaseNo = PT.CaseNo
                                 WHERE PR.CaseNo = @CaseNo
                                 GROUP BY PR.F_NAME, PR.M_NAME, PR.L_NAME, PR.DOB, PR.REG_DATE, PR.SEX, PT.MemoNo, PT.TreatmentDate";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CaseNo", CaseNo);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        List<Patient> patients = new List<Patient>();
                        while (reader.Read())
                        {
                            Patient patient = new Patient
                            {
                                CaseNo = CaseNo,
                                F_NAME = reader["F_NAME"].ToString(),
                                M_NAME = reader["M_NAME"].ToString(),
                                L_NAME = reader["L_NAME"].ToString(),
                                DOB = reader["DOB"].ToString(),
                                REG_DATE = reader["REG_DATE"].ToString(),
                                SEX = reader["SEX"].ToString(),
                                MemoNo = reader["MemoNo"].ToString(),
                                TreatmentDate = reader["TreatmentDate"].ToString(),
                                total_cost = reader["total_cost"].ToString()
                            };
                            patients.Add(patient);
                        }
                        result.Add("patients", patients);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Log the exception for debugging purposes
            Console.WriteLine("Error: " + ex.Message);
            // Return an error message to the client
            throw new Exception("Error: " + ex.Message);
        }
        return result;
    }

    public class Patient
    {
        public string CaseNo { get; set; }
        public string F_NAME { get; set; }
        public string M_NAME { get; set; }
        public string L_NAME { get; set; }
        public string DOB { get; set; }
        public string REG_DATE { get; set; }
        public string SEX { get; set; }
        public string MemoNo { get; set; }
        public string TreatmentDate { get; set; }
        public string total_cost { get; set; }
    }
}
