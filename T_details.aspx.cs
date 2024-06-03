using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

public partial class BloodDonation_T_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public class Treatment
    {
        public string CaseNo { get; set; }
        public string F_NAME { get; set; }
        public string M_NAME { get; set; }
        public string L_NAME { get; set; }
    }

    [WebMethod]
    public static Treatment T_info(string CaseNo)
    {
        Treatment det = new Treatment();
        try
        {
            string connectionString = @"Data Source=MIR;Initial Catalog=db1;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select CaseNo,F_NAME, M_NAME, L_NAME from PAT_REGISTRATION where CaseNo = @CaseNo", con))
                {
                    cmd.Parameters.AddWithValue("@CaseNo", CaseNo);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            det.CaseNo = reader["CaseNo"].ToString();
                            det.F_NAME = reader["F_NAME"].ToString();
                            det.M_NAME = reader["M_NAME"].ToString();
                            det.L_NAME = reader["L_NAME"].ToString();
                        }
                        else
                        {
                            det = null;
                        }
                    }
                }
            }

        }
        catch (Exception ex)
        {
            string err = ex.Message;

        }
        return det;
    }

    [WebMethod]
    public static List<string> GetTreatmentNames(string prefix)
    {
        List<string> treatmentNames = new List<string>();

        using (SqlConnection connection = new SqlConnection(@"Data Source=MIR;Initial Catalog=db1;Integrated Security=True"))
        {
            string query = "SELECT T_NAME FROM Pat_Treatment_Master WHERE T_NAME LIKE @Prefix";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@Prefix", "%" + prefix + "%");

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        treatmentNames.Add(reader["T_NAME"].ToString());
                    }
                }
            }
        }

        return treatmentNames;
    }

    [WebMethod]
    public static decimal GetTreatmentCost(string treatmentName)
    {
        decimal cost = 0.00m;

        using (SqlConnection connection = new SqlConnection(@"Data Source=MIR;Initial Catalog=db1;Integrated Security=True"))
        {
            string query = "SELECT T_COST FROM Pat_Treatment_Master WHERE T_NAME = @T_NAME";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@T_NAME", treatmentName);

                connection.Open();

                object result = command.ExecuteScalar();

                if (result != DBNull.Value)
                {
                    cost = Convert.ToDecimal(result);
                }
            }
        }

        return cost;
    }

    [WebMethod]
    public static string InsertValues(List<TreatmentDetail> values)
    {
        try
        {
            string connectionString = @"Data Source=MIR;Initial Catalog=db1;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string max = "select isnull(max(CAST(memoNo AS INT)),1)+1 from Pat_Treatment where year(convert(datetime,TreatmentDate))=year(GETDATE())";
                SqlDataAdapter da = new SqlDataAdapter(max, connection);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int memono = 1;
                if (dt.Rows.Count > 0)
                {
                    memono = Convert.ToInt32(dt.Rows[0].ItemArray[0].ToString());
                }
                
                foreach (var value in values)
                {
                    
                    string query = "INSERT INTO Pat_Treatment (CaseNo, TREATMENT_NAME, COST, TreatmentDate,MemoNo, qty) " +
                                   "VALUES (@CaseNo, @TreatmentName, @Cost, @TreatmentDate,@MemoNo, @qty)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@CaseNo", value.CaseNo);
                        command.Parameters.AddWithValue("@TreatmentName", value.TreatmentName);
                        command.Parameters.AddWithValue("@Cost", value.Cost);
                        command.Parameters.AddWithValue("@TreatmentDate", value.TreatmentDate);
                        command.Parameters.AddWithValue("@MemoNo", memono.ToString());
                        command.Parameters.AddWithValue("@qty", value.Qty);


                        command.ExecuteNonQuery();
                    }
                   
                }
            }
            return "Success";
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }
}

public class TreatmentDetail
{
    public string CaseNo { get; set; }
    public string TreatmentName { get; set; }
    public string Qty { get; set; }
    public decimal Cost { get; set; }
    public string TreatmentDate { get; set; } // Change to DateTime
}