using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.Services;

public partial class BloodDonation_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    [WebMethod]
    public static string GetTreatmentData()
    {
        List<Dictionary<string, object>> treatments = new List<Dictionary<string, object>>();

        string connectionString = @"Data Source=MIR;Initial Catalog=db1;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            try
            {
                string query = "SELECT [T_NAME], [T_COST] FROM [db1].[dbo].[Pat_Treatment_Master]";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        Dictionary<string, object> treatment = new Dictionary<string, object>();
                        treatment["T_NAME"] = reader["T_NAME"].ToString();
                        treatment["T_COST"] = reader["T_COST"].ToString();
                        treatments.Add(treatment);
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                throw; // Re-throw the exception to propagate it further
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }

        // Serialize treatments list to JSON
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        string json = serializer.Serialize(treatments);
        return json;
    }

    [WebMethod]
    public static string SaveTData(string T_NAME, string T_COST)
    {
        try
        {
            string connectionString = @"Data Source=MIR;Initial Catalog=db1;Integrated Security=True";

            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                cnn.Open();
                string query = "INSERT INTO Pat_Treatment_Master(T_NAME, T_COST) VALUES (@T_NAME, @T_COST)";

                using (SqlCommand cmd = new SqlCommand(query, cnn))
                {
                    cmd.Parameters.AddWithValue("@T_NAME", T_NAME);
                    cmd.Parameters.AddWithValue("@T_COST", T_COST);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    return (rowsAffected > 0) ? "true" : "false";
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
            return "Error: " + ex.Message;
        }
    }

    
    }

    public class Treatment
    {
        public string T_NAME { get; set; }
        public string T_COST { get; set; }
    }
