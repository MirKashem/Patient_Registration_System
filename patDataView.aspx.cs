using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BloodDonation_patDataView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<Patient> issueall = all_pat_data();
            string htmlTableData = patDataTable(issueall);

            htmlTableLiteral.Text = htmlTableData;
        }
    }

   

    public class Patient
    {
        public string ID { get; set; }
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

    public static List<Patient> all_pat_data()
    {
        List<Patient> allList = new List<Patient>();

        SqlConnection con = new SqlConnection(@"Data Source=MIR;Initial Catalog=db1;Integrated Security=True");
        SqlDataAdapter da1 = new SqlDataAdapter("Select * from dbo.PAT_REGISTRATION", con);

        DataTable dt1 = new DataTable();
        da1.Fill(dt1);

        if (dt1.Rows.Count > 0)
        {
            foreach (DataRow row in dt1.Rows)
            {
                Patient allData = new Patient();
               // allData.ID = row["ID"].ToString();
                allData.CaseNo = row["CaseNo"].ToString();
                allData.REG_DATE = row["REG_DATE"].ToString();
                allData.P_TAG = row["P_TAG"].ToString();
                allData.F_NAME = row["F_NAME"].ToString();
                allData.M_NAME = row["M_NAME"].ToString();
                allData.L_NAME = row["L_NAME"].ToString();
                allData.DOB = row["DOB"].ToString();
                allData.SEX = row["SEX"].ToString();
                allData.P_REG_TYPE = row["P_REG_TYPE"].ToString();
                allData.P_TYPE = row["P_TYPE"].ToString();
                allData.P_CATG = row["P_CATG"].ToString();
                allData.CONSULT_DATE = row["CONSULT_DATE"].ToString();
                allData.DMG_NAME = row["DMG_NAME"].ToString();
                allData.UD_NAME = row["UD_NAME"].ToString();
                allData.PERM_ADDR1 = row["PERM_ADDR1"].ToString();
                allData.PERM_ADDR2 = row["PERM_ADDR2"].ToString();
                allData.PERM_ADDR3 = row["PERM_ADDR3"].ToString();
                allData.PERM_PIN = row["PERM_PIN"].ToString();
                allData.KNAME = row["KNAME"].ToString();
                allData.KRELWPAT = row["KRELWPAT"].ToString();
                allData.KCOUNTRY = row["KCOUNTRY"].ToString();
                allData.KSTATE = row["KSTATE"].ToString();
                allData.KEMAIL = row["KEMAIL"].ToString();
                allData.KADDR = row["KADDR"].ToString();
                allData.KCITY = row["KCITY"].ToString();
                allData.KPHNO = row["KPHNO"].ToString();
                allData.KPIN = row["KPIN"].ToString();
                allData.BLOOD_GRP = row["BLOOD_GRP"].ToString();
                allData.HEIGHT = row["HEIGHT"].ToString();
                allData.WEIGHT = row["WEIGHT"].ToString();
                allData.ADHAR_NO = row["ADHAR_NO"].ToString();
                allData.FAMILY_INCM = row["FAMILY_INCM"].ToString();
                allData.MAR_STATUS = row["MAR_STATUS"].ToString();
                allData.MOTHER_TONGUE = row["MOTHER_TONGUE"].ToString();
                allData.RELIGION = row["RELIGION"].ToString();
                allData.IDENTI_MARK = row["IDENTI_MARK"].ToString();


                allList.Add(allData);
            }
        }
        return allList;
    }

    public static string patDataTable(List<Patient> data)
    {
        if (data == null || data.Count == 0)
        {
            return "<p>Data not available</p>";
        }
        StringBuilder htmlTable = new StringBuilder();
        htmlTable.Append("<table id='myTable'>");
        htmlTable.Append("<thead><tr>");
     //   htmlTable.Append("<th style='background-color: #4070f4; border: 1px solid white; color: black; '>ID</th>");
        htmlTable.Append("<th style='background-color: #4070f4; border: 1px solid white; color: black;'>CASENO</th>");
        htmlTable.Append("<th style='background-color: #4070f4; border: 1px solid white; color: black;'>REG</th>");
        htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>PATIENT TAG</th>");
        htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>FIRST NAME</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>MIDDILE NAME</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>LAST NAME</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>DATE OF BIRTH</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>SEX</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>PATIENT REGISTRATION TYPE</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>PATIENT TYPE</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>PATIENT CATGORY</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>CONSULT DATE</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>DAMAGE NAME</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>UD NAME</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>PERM ADDRESS 1</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>PERM ADDRESS 2</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>PERM ADDRESS 3</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>PERMANENT PIN</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>KIN'S NAME</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>KIN'S RELATION WITH PATIENT</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>KIN'S COUNTRY</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>KIN'S STATE</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>KIN'S EMAIL</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>KIN'S ADDRESS</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>KIN'S CITY</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>KIN'S PHONE NUMBER</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>KIN'S PIN</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>BLOOD GROUP</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>HEIGHT</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>WEIGHT</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>ADHAR NO.</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>FAMILY INCOME</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>MARITIAL STATUS</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>MOTHET TONGUE</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>RELIGION</th>");
        //htmlTable.Append("<th style='background-color: #4070f4;; border: 1px solid white; color: black;'>IDENTITY MARK</th>");
        htmlTable.Append("</tr></thead><tbody>"); // Added tbody tag here

        foreach (var item in data)
        {
            htmlTable.Append("<tr>");

           // htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.ID + "</td>");
            htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.CaseNo + "</td>");
            htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.REG_DATE + "</td>");
            htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.P_TAG + "</td>");
            htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.F_NAME + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.M_NAME + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.L_NAME + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.DOB + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.SEX + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.P_REG_TYPE + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.P_TYPE + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.P_CATG + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.CONSULT_DATE + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.DMG_NAME + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.UD_NAME + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.PERM_ADDR1 + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.PERM_ADDR2 + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.PERM_ADDR3 + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.PERM_PIN + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.KNAME + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.KRELWPAT + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.KCOUNTRY + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.KSTATE + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.KEMAIL + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.KADDR + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.KCITY + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.KPHNO + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.KPIN + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.BLOOD_GRP + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.HEIGHT + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.WEIGHT + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.ADHAR_NO + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.FAMILY_INCM + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.MAR_STATUS + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.MOTHER_TONGUE + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.RELIGION + "</td>");
            //htmlTable.Append("<td style='background-color: white; border: 1px solid #4070f4; color: black;'>" + item.IDENTI_MARK + "</td>");
            htmlTable.Append("</tr>");
        }
        htmlTable.Append("</tbody></table>");
        return htmlTable.ToString();
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

    protected void btnlgout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();// Clear the session
        Response.Redirect("logIn.aspx"); // Redirect to the login page or another page
    }
}
