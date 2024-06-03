using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BloodDonation_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public class Patient
    {
        public string CaseNo { get; set; }
        public string REG_DATE { get; set; }

        public string P_TAG { get; set; }
        public string F_NAME { get; internal set; }
        public string M_NAME { get; internal set; }
        public string L_NAME { get; internal set; }
        public string DOB { get; internal set; }
        public string SEX { get; internal set; }
        public string P_REG_TYPE { get; internal set; }
        public string P_TYPE { get; internal set; }
        public string P_CATG { get; internal set; }
        public string CONSULT_DATE { get; internal set; }
        public string DMG_NAME { get; internal set; }
        public string UD_NAME { get; internal set; }
        public string PERM_ADDR1 { get; internal set; }
        public string PERM_ADDR2 { get; internal set; }
        public string PERM_ADDR3 { get; internal set; }
        public string PERM_PIN { get; internal set; }
        public string KNAME { get; internal set; }
        public string KRELWPAT { get; internal set; }
        public string KCOUNTRY { get; internal set; }
        public string KSTATE { get; internal set; }
        public string KEMAIL { get; internal set; }
        public string KADDR { get; internal set; }
        public string KCITY { get; internal set; }
        public string KPHNO { get; internal set; }
        public string KPIN { get; internal set; }
        public string BLOOD_GRP { get; internal set; }
        public string HEIGHT { get; internal set; }
        public string WEIGHT { get; internal set; }
        public string ADHAR_NO { get; internal set; }
        public string FAMILY_INCM { get; internal set; }
        public string MAR_STATUS { get; internal set; }
        public string MOTHER_TONGUE { get; internal set; }
        public string RELIGION { get; internal set; }
        public string IDENTI_MARK { get; internal set; }
    }

    public class PatUpdate
    {
        public string CaseNo { get; set; }
        public string REG_DATE { get; set; }
        public string P_TAG { get; set; }
        public string F_NAME { get;  set; }
        public string M_NAME { get;  set; }
        public string L_NAME { get;  set; }
        public string DOB { get;  set; }
        public string SEX { get;  set; }
        public string P_REG_TYPE { get; set; }
        public string P_TYPE { get;  set; }
        public string P_CATG { get; set; }
        public string CONSULT_DATE { get; set; }
        public string DMG_NAME { get; set; }
        public string UD_NAME { get; set; }
        public string PERM_ADDR1 { get; set; }
        public string PERM_ADDR2 { get; set; }
        public string PERM_ADDR3 { get; set; }
        public string PERM_PIN { get; set; }
        public string KNAME { get; set; }
        public string KRELWPAT { get; set; }
        public string KCOUNTRY { get; set; }
        public string KSTATE { get; set; }
        public string KEMAIL { get; set; }
        public string KADDR { get; set; }
        public string KCITY { get; set; }
        public string KPHNO { get; set; }
        public string KPIN { get; set; }
        public string BLOOD_GRP { get; set; }
        public string HEIGHT { get; set; }
        public string WEIGHT { get; set; }
        public string ADHAR_NO { get; set; }
        public string FAMILY_INCM { get; set; }
        public string MAR_STATUS { get; set; }
        public string MOTHER_TONGUE { get; set; }
        public string RELIGION { get; set; }
        public string IDENTI_MARK { get; set; }
    }

    [WebMethod]
    // code for getting all the data by its caseNo
    public static Patient PatInfo(string CaseNo)
    {
        Patient det = new Patient();
        try
        {
            string connectionString = @"Data Source=MIR;Initial Catalog=db1;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select * from PAT_REGISTRATION where CaseNo = @CaseNo", con))
                {
                    cmd.Parameters.AddWithValue("@CaseNo", CaseNo);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            det.CaseNo = reader["CaseNo"].ToString();
                            det.REG_DATE = reader["REG_DATE"].ToString();
                            det.P_TAG = reader["P_TAG"].ToString();
                            det.F_NAME = reader["F_NAME"].ToString();
                            det.M_NAME = reader["M_NAME"].ToString();
                            det.L_NAME = reader["L_NAME"].ToString();
                            det.DOB = reader["DOB"].ToString();
                            det.SEX = reader["SEX"].ToString();


                            det.P_REG_TYPE = reader["P_REG_TYPE"].ToString();
                            det.P_TYPE = reader["P_TYPE"].ToString();
                            det.P_CATG = reader["P_CATG"].ToString();
                            det.CONSULT_DATE = reader["CONSULT_DATE"].ToString();
                            det.DMG_NAME = reader["DMG_NAME"].ToString();


                            det.UD_NAME = reader["UD_NAME"].ToString();
                            det.PERM_ADDR1 = reader["PERM_ADDR1"].ToString();
                            det.PERM_ADDR2 = reader["PERM_ADDR2"].ToString();
                            det.PERM_ADDR3 = reader["PERM_ADDR3"].ToString();
                            det.PERM_PIN = reader["PERM_PIN"].ToString();
                            det.KNAME = reader["KNAME"].ToString();
                            det.KRELWPAT = reader["KRELWPAT"].ToString();
          
                            det.KCOUNTRY = reader["KCOUNTRY"].ToString();
                            det.KSTATE = reader["KSTATE"].ToString();
                            det.KEMAIL = reader["KEMAIL"].ToString();
                            det.KADDR = reader["KADDR"].ToString();
                            det.KCITY = reader["KCITY"].ToString();
                            det.KPHNO = reader["KPHNO"].ToString();
                            det.KPIN = reader["KPIN"].ToString();
                            det.BLOOD_GRP = reader["BLOOD_GRP"].ToString();
                            det.HEIGHT = reader["HEIGHT"].ToString();

                            det.WEIGHT = reader["WEIGHT"].ToString();
                            det.ADHAR_NO = reader["ADHAR_NO"].ToString();
                            det.FAMILY_INCM = reader["FAMILY_INCM"].ToString();
                            det.MAR_STATUS = reader["MAR_STATUS"].ToString();
                            det.MOTHER_TONGUE = reader["MOTHER_TONGUE"].ToString();
                            det.RELIGION = reader["RELIGION"].ToString();
                            det.IDENTI_MARK = reader["IDENTI_MARK"].ToString();
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
    public static string InsertData(string REG_DATE, string P_TAG, string F_NAME, string M_NAME, string L_NAME, string DOB, string SEX, string P_REG_TYPE, string P_TYPE, 
        string P_CATG, string CONSULT_DATE, string DMG_NAME, string UD_NAME, string PERM_ADDR1, string PERM_ADDR2, string PERM_ADDR3,
        string PERM_PIN, string KNAME, string KRELWPAT, string KCOUNTRY, string KSTATE, string KEMAIL, string KADDR, string KCITY, string KPHNO, string KPIN,
        string BLOOD_GRP, string HEIGHT, string WEIGHT, string ADHAR_NO, string FAMILY_INCM, string MAR_STATUS, string MOTHER_TONGUE, string RELIGION, string IDENTI_MARK)
    {
        try
        {
            // Connection string to your SQL Server database
            string connectionString = @"Data Source=MIR;Initial Catalog=db1;Integrated Security=True";     

                                                                                                                                                             
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                cnn.Open(); // Open the connection

                // SQL query to insert data
                string query = "INSERT INTO PAT_REGISTRATION (REG_DATE, P_TAG, F_NAME,M_NAME, L_NAME, DOB, SEX, P_REG_TYPE, P_TYPE, P_CATG, CONSULT_DATE, DMG_NAME, UD_NAME, PERM_ADDR1, PERM_ADDR2, PERM_ADDR3, PERM_PIN, KNAME, KRELWPAT, KCOUNTRY, KSTATE, KEMAIL, KADDR, KCITY, KPHNO, KPIN, BLOOD_GRP, HEIGHT, WEIGHT, ADHAR_NO, FAMILY_INCM, MAR_STATUS, MOTHER_TONGUE, RELIGION, IDENTI_MARK) " +
                    "VALUES (@REG_DATE, @P_TAG, @F_NAME, @M_NAME, @L_NAME, @DOB, @SEX, @P_REG_TYPE, @P_TYPE, @P_CATG, @CONSULT_DATE, @DMG_NAME, @UD_NAME, @PERM_ADDR1, @PERM_ADDR2, @PERM_ADDR3, @PERM_PIN, @KNAME, @KRELWPAT, @KCOUNTRY, @KSTATE, @KEMAIL, @KADDR, @KCITY, @KPHNO, @KPIN, @BLOOD_GRP, @HEIGHT, @WEIGHT, @ADHAR_NO, @FAMILY_INCM, @MAR_STATUS, @MOTHER_TONGUE, @RELIGION, @IDENTI_MARK)";

                // Create a command with the query and connection
                using (SqlCommand cmd = new SqlCommand(query, cnn))
                {
                    // Add parameters to the query to prevent SQL injection
                    cmd.Parameters.AddWithValue("@REG_DATE", REG_DATE);
                    cmd.Parameters.AddWithValue("@P_TAG", P_TAG);
                    cmd.Parameters.AddWithValue("@F_NAME", F_NAME);
                    cmd.Parameters.AddWithValue("@M_NAME", M_NAME);
                    cmd.Parameters.AddWithValue("@L_NAME", L_NAME);
                    cmd.Parameters.AddWithValue("@DOB", DOB);
                    cmd.Parameters.AddWithValue("@SEX", SEX);
                    cmd.Parameters.AddWithValue("@P_REG_TYPE", P_REG_TYPE);

                    cmd.Parameters.AddWithValue("@P_TYPE", P_TYPE);
                    cmd.Parameters.AddWithValue("@P_CATG", P_CATG);
                    cmd.Parameters.AddWithValue("@CONSULT_DATE", CONSULT_DATE);
                    cmd.Parameters.AddWithValue("@DMG_NAME", DMG_NAME);
                    cmd.Parameters.AddWithValue("@UD_NAME", UD_NAME);
                    cmd.Parameters.AddWithValue("@PERM_ADDR1", PERM_ADDR1);
                    cmd.Parameters.AddWithValue("@PERM_ADDR2", PERM_ADDR2);
                    cmd.Parameters.AddWithValue("@PERM_ADDR3", PERM_ADDR3);
                    cmd.Parameters.AddWithValue("@PERM_PIN", PERM_PIN);

                    cmd.Parameters.AddWithValue("@KNAME", KNAME);
                    cmd.Parameters.AddWithValue("@KRELWPAT", KRELWPAT);
                    cmd.Parameters.AddWithValue("@KCOUNTRY", KCOUNTRY);
                    cmd.Parameters.AddWithValue("@KSTATE", KSTATE);
                    cmd.Parameters.AddWithValue("@KEMAIL", KEMAIL);
                    cmd.Parameters.AddWithValue("@KADDR", KADDR);
                    cmd.Parameters.AddWithValue("@KCITY", KCITY);
                    cmd.Parameters.AddWithValue("@KPHNO", KPHNO);
                    cmd.Parameters.AddWithValue("@KPIN", KPIN);

                    cmd.Parameters.AddWithValue("@BLOOD_GRP", BLOOD_GRP);
                    cmd.Parameters.AddWithValue("@HEIGHT", HEIGHT);
                    cmd.Parameters.AddWithValue("@WEIGHT", WEIGHT);
                    cmd.Parameters.AddWithValue("@ADHAR_NO", ADHAR_NO);
                    cmd.Parameters.AddWithValue("@FAMILY_INCM", FAMILY_INCM);
                    cmd.Parameters.AddWithValue("@MAR_STATUS", MAR_STATUS);
                    cmd.Parameters.AddWithValue("@MOTHER_TONGUE", MOTHER_TONGUE); 
                    cmd.Parameters.AddWithValue("@RELIGION", RELIGION);
                    cmd.Parameters.AddWithValue("@IDENTI_MARK", IDENTI_MARK);

                    // Execute the command
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        return "true";
                    }
                    else
                    {
                        return "false";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Handle any exceptions that might occur
            Console.WriteLine("Error:");
            return "Error: " + ex.Message;
        }
    }

    [WebMethod]

    public static List<InfoHoldReport> ModifyData(PatUpdate sp)
    {
        List<InfoHoldReport> list = new List<InfoHoldReport>();
        InfoHoldReport info;
        string connectionString = @"Data Source=MIR;Initial Catalog=db1;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "";
            try
            {
                con.Open();
                query = "UPDATE [dbo].[PAT_REGISTRATION] SET " +
                    "REG_DATE = @REG_DATE," +
                    "P_TAG = @P_TAG, " +
                    "F_NAME = @F_NAME, "+
                    "M_NAME = @M_NAME, "+
                    "L_NAME = @L_NAME, "+
                    "DOB = @DOB, "+
                    "SEX = @SEX, "+
                    "P_REG_TYPE = @P_REG_TYPE, "+
                    "P_TYPE = @P_TYPE, "+
                    "P_CATG = @P_CATG, "+
                    "CONSULT_DATE = @CONSULT_DATE, "+
                    "DMG_NAME = @DMG_NAME, "+
                    "UD_NAME = @UD_NAME, "+
                    "PERM_ADDR1 = @PERM_ADDR1, "+
                    "PERM_ADDR2 = @PERM_ADDR2, "+
                    "PERM_ADDR3 = @PERM_ADDR3, "+
                    "PERM_PIN = @PERM_PIN, "+
                    "KNAME = @KNAME, "+
                    "KRELWPAT = @KRELWPAT, "+
                    "KCOUNTRY = @KCOUNTRY, "+
                    "KSTATE = @KSTATE, "+
                    "KEMAIL = @KEMAIL, "+
                    "KADDR = @KADDR, "+
                    "KCITY = @KCITY, "+
                    "KPHNO = @KPHNO, "+
                    "KPIN = @KPIN, "+
                    "BLOOD_GRP = @BLOOD_GRP, "+
                    "HEIGHT = @HEIGHT, "+
                    "WEIGHT = @WEIGHT, "+
                    "ADHAR_NO = @ADHAR_NO, "+
                    "FAMILY_INCM = @FAMILY_INCM, "+
                    "MAR_STATUS = @MAR_STATUS, "+
                    "MOTHER_TONGUE = @MOTHER_TONGUE, "+
                    "RELIGION = @RELIGION, "+
                    "IDENTI_MARK = @IDENTI_MARK "+
                    "WHERE CaseNo = @CaseNo";
                SqlCommand sc = new SqlCommand(query, con);
                sc.Parameters.AddWithValue("@REG_DATE", sp.REG_DATE);
                sc.Parameters.AddWithValue("@P_TAG", sp.P_TAG);
                sc.Parameters.AddWithValue("@F_NAME", sp.F_NAME);
                sc.Parameters.AddWithValue("@M_NAME", sp.M_NAME);
                sc.Parameters.AddWithValue("@L_NAME", sp.L_NAME);
                sc.Parameters.AddWithValue("@DOB", sp.DOB);
                sc.Parameters.AddWithValue("@SEX", sp.SEX);
                sc.Parameters.AddWithValue("@P_REG_TYPE", sp.P_REG_TYPE);
                sc.Parameters.AddWithValue("@P_TYPE", sp.P_TYPE);
                sc.Parameters.AddWithValue("@P_CATG", sp.P_CATG);
                sc.Parameters.AddWithValue("@CONSULT_DATE", sp.CONSULT_DATE);
                sc.Parameters.AddWithValue("@DMG_NAME", sp.DMG_NAME);
                sc.Parameters.AddWithValue("@UD_NAME", sp.UD_NAME);
                sc.Parameters.AddWithValue("@PERM_ADDR1", sp.PERM_ADDR1);
                sc.Parameters.AddWithValue("@PERM_ADDR2", sp.PERM_ADDR2);
                sc.Parameters.AddWithValue("@PERM_ADDR3", sp.PERM_ADDR3);
                sc.Parameters.AddWithValue("@PERM_PIN", sp.PERM_PIN);
                sc.Parameters.AddWithValue("@KNAME", sp.KNAME);
                sc.Parameters.AddWithValue("@KRELWPAT", sp.KRELWPAT);
                sc.Parameters.AddWithValue("@KCOUNTRY", sp.KCOUNTRY);
                sc.Parameters.AddWithValue("@KSTATE", sp.KSTATE);
                sc.Parameters.AddWithValue("@KEMAIL", sp.KEMAIL);
                sc.Parameters.AddWithValue("@KADDR", sp.KADDR);
                sc.Parameters.AddWithValue("@KCITY", sp.KCITY);
                sc.Parameters.AddWithValue("@KPHNO", sp.KPHNO);
                sc.Parameters.AddWithValue("@KPIN", sp.KPIN);
                sc.Parameters.AddWithValue("@BLOOD_GRP", sp.BLOOD_GRP);
                sc.Parameters.AddWithValue("@HEIGHT", sp.HEIGHT);
                sc.Parameters.AddWithValue("@WEIGHT", sp.WEIGHT);
                sc.Parameters.AddWithValue("@ADHAR_NO", sp.ADHAR_NO);
                sc.Parameters.AddWithValue("@FAMILY_INCM", sp.FAMILY_INCM);
                sc.Parameters.AddWithValue("@MAR_STATUS", sp.MAR_STATUS);
                sc.Parameters.AddWithValue("@MOTHER_TONGUE", sp.MOTHER_TONGUE);
                sc.Parameters.AddWithValue("@RELIGION", sp.RELIGION);
                sc.Parameters.AddWithValue("@IDENTI_MARK", sp.IDENTI_MARK);
                sc.Parameters.AddWithValue("@CaseNo", sp.CaseNo);

                int x = sc.ExecuteNonQuery();
                if (x > 0)
                {
                    info = new InfoHoldReport("Data Modified for Case No " + sp.CaseNo);
                    list.Add(info);
                }
            }
            catch (Exception ex)
            {
                info = new InfoHoldReport("Something went wrong" + ex.Message);
            }
        }
        return list;
    }








    public class InfoHoldReport
    {
        public InfoHoldReport(string iRtState)
        {
            this.RtState = iRtState;
        }
        #region

        private string _RtState = "";
        public string RtState
        {
            get { return _RtState; }
            set { _RtState = value; }
        }

        #endregion
    }

}