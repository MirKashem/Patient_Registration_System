<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BloodDonation_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="../plugins/sweetalert/sweetalert.css" rel="stylesheet" />
    <script src="assets/jquery/jquery.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="../plugins/js/bootstrap.min.js"></script>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />

    <link href="../plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../plugins/materialize-css/css/mat-icons.css" rel="stylesheet" />
    <link href="../plugins/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../css/jquery-ui1.css" rel="stylesheet" />
    <link href="../plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" />




<style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wgs@200;300;400;500;600&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #4070f4;
}

.container {
    position: relative;
    max-width: 1000px;
    width: 100%;
    border-radius: 4px;
    padding: 30px;
    margin: 0 15px;
    background-color: #fff;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
    border-radius: 20px;
}

.container header {
    font-size: 20px;
    font-weight: 600;
    color: #333;
}

.container form {
    position: relative;
    margin-top: 20px;
    min-height: 600px;
    background-color: #fff;
    overflow: hidden;
}

form .fields .input-field {
    display: flex;
    width: calc(100% / 3 - 15px);
    flex-direction: column;
}

.container form .title {
    display: block;
    text-align: center;
    margin-bottom: 8px;
    font-size: 16px;
    font-weight: bold;
    margin: 6px 0;
    background: lightslategrey;
    border-radius: 5px;
}

.container form .fields {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
}

form .fields .input-field {
    display: flex;
    flex-direction: column;
}

.input-field input {
    outline: none;
    font-size: 14px;
    font-weight: 400;
    color: #333;
    border-radius: 4px;
    border: 1px solid #aaa;
    padding: 0 15px;
    height: 32px;
    margin: 8px 0;
}

.input-field input:hover {
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.13);
}

/* Media queries for responsiveness */
@media screen and (max-width: 768px) {
    .container form .fields .input-field {
        width: 100%;
    }
}

@media screen and (max-width: 576px) {
    .container {
        padding: 20px;
    }
    
    .container form {
        min-height: auto;
    }
}
#buttonContainer {
   position: absolute;
    top: 1.25rem;
    right: 2rem;
}

</style>

</head>
<body>
   <div class="container">
    <header> Patient Registration <span id="buttonContainer">
   <button type="button" class="btn btn-primary btnlog" id="btnlog"><b>Admin Login</b></button>
</span></header>
                    <hr />

    <form action="#">
        <div class="form first">
            <div class="details personal">
                <span class="title">Personal Details </span>

                <div class="fields">

                    <div class="input-field">
                      <div id="patShow" class="col-md-2 col-sm-2 col-lg-2" style="padding: 0; display: none;">
                        <label for="inputcaseNO" style="width:90px;">Case No</label>
                        <input class="getAllDetails" type="text" id="CaseNo" placeholder="Enter Case No" autocomplete="off"/>
                      </div>
                    </div>
                    
                    <div class="input-field">
                        <label for="inputRegDate">Registration Date</label>
                        <input type="date" id="REG_DATE" placeholder="Enter Registration Date" autocomplete="off">
                    </div>
                    
                    <div class="input-field">
                        <label for="P_TAG">Patient Tag</label>
                        <select id="P_TAG" class="form-select">
                            <option value="" selected="selected" disabled="disabled">Choose..</option>
                            <option value="Mr">Mr</option>
                            <option value="Miss">Miss</option>
                            <option value="Mrs">Mrs</option>
                        </select> 
                    </div>

                    <div class="input-field">
                        <label for="inputFname">First Name</label>
                        <input type="text" id="F_NAME" placeholder="Enter your First Name" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="inputMname">Middle Name</label>
                        <input type="text" id="M_NAME" placeholder="Enter your Middle Name" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="inputLname">Last Name</label>
                        <input type="text" id="L_NAME" placeholder="Enter your Last Name" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="DOB">Date of Birth</label>
                        <input type="date" id="DOB" placeholder="Enter your Date of Birth" autocomplete="off">
                    </div>

                    <div class="input-field">
                        <label for="SEX">Sex</label>
                        <select id="SEX" class="form-select">
                            <option value="" selected="selected" disabled="disabled">Choose..</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="others">Others</option>
                        </select>
                    </div>

                    <div class="input-field">
                        <label for="P_REG_TYPE">Patient Registration Type</label>
                        <select id="P_REG_TYPE" class="form-select">
                            <option value="" selected="selected" disabled="disabled">Choose..</option>
                            <option value="Online">Online</option>
                            <option value="Offline">Offline</option>
                        </select>
                    </div>

                </div>

            </div>

            <div class="details ID">
                <span class="title">Treatment Details</span>
                <div class="fields">
                    <div class="input-field">
                        <label for="P_TYPE">Patient Type</label>
                        <select id="P_TYPE" class="form-select">
                            <option value="" selected="selected" disabled="disabled">Choose..</option>
                            <option value="ONLINE">ONLINE</option>
                            <option value="OFFLINE">OFFLINE</option>
                        </select>
                    </div>

                    <div class="input-field">
                        <label for="P_CATG">Patient Category</label>
                        <select id="P_CATG" class="form-select">
                            <option value="" selected="selected" disabled="disabled">Choose..</option>
                            <option value="GENERAL">GENERAL</option>
                            <option value="SC">SC</option>
                            <option value="ST">ST</option>
                            <option value="OBC">OBC</option>
                        </select>
                    </div>

                    <div class="input-field">
                        <label for="inputConDate">Consult Date</label>
                        <input type="date" id="CONSULT_DATE" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="DMG_NAME">DMG Name</label>
                        <select id="DMG_NAME" class="form-select">
                            <option value="" selected="selected" disabled="disabled">Choose..</option>
                            <option value="something">SOMETHING </option>
                            <option value="somethng">SOMETHING</option>
                            <option value="something">SOEMTHING</option>
                            <option value="soemthing">SOMETHING</option>
                        </select>
                    </div>

                    <div class="input-field">
                        <label for="UD_NAME">UD Name</label>
                        <input type="text" id="UD_NAME" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="inputAdd1">Permanent Address 1</label>
                        <textarea id="PERM_ADDR1" name="inputAdd1" rows="2" cols="30" aria-autocomplete="none"></textarea>
                    </div>

                    <div class="input-field">
                        <label for="inputAdd2">Permanent Address 2</label>
                        <textarea id="PERM_ADDR2" name="inputAdd2" rows="2" cols="30"></textarea>
                    </div>

                    <div class="input-field">
                        <label for="inputAdd3">Permanent Address 3</label>
                        <textarea id="PERM_ADDR3" name="inputAdd3" rows="2" cols="30"></textarea>
                    </div>

                    <div class="input-field">
                        <label for="inputPin">Permanent PIN</label>
                        <input type="number" id="PERM_PIN" autocomplete="off" />
                    </div>

                </div>

            </div>
        </div>



        <div class="form second">
            <div class="details personal">
                <span class="title">Kin's Detaiils</span>

                <div class="fields">

                    <div class="input-field">
                        <label for="">Name</label>
                        <input type="text" id="KNAME" placeholder="Enter Kin's Name" autocomplete="off"/>  
                   
                    </div>
                    <div class="input-field">
                        <label for="">Relationship with Patients</label>
                       <select id="KRELWPAT" class="form-select">
                            <option value="" selected="selected" disabled="disabled">Choose..</option>
                            <option value="Brother">Brother</option>
                            <option value="Sister">Sister</option>
                            <option value="Mother">Mother</option>
                           <option value="Father">Father</option>
                           <option value="Wife">Wife</option>
                           <option value="Husband">Husband</option>
                           <option value="Other">Other</option>
                       </select>
                    </div>

                    <div class="input-field">
                        <label for="KCOUNTRY">Country</label>
                        <input type="text" id="KCOUNTRY" placeholder="Enter Kin's Country" autocomplete="off"/>  
                        
                    </div>

                    <div class="input-field">
                        <label for="KSTATE">State</label>
                        <input type="text" id="KSTATE" placeholder="Enter" autocomplete="off"/>
                    </div>
                   
                    <div class="input-field">
                        <label for="KEMAIL">Email</label>
                        <input type="email" id="KEMAIL" placeholder="Enter your Email" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="KADDR">Address</label>
                        <input type="text" id="KADDR" placeholder="Enter your Addresss" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="KCITY">City</label>
                        <input type="text" id="KCITY" placeholder="Enter your City" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="KPHNO">Phone No</label>
                        <input type="number" id="KPHNO" placeholder="Enter your Phno" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="KPIN">Pin</label>
                        <input type="number" id="KPIN" placeholder="Enter Pin Code" autocomplete="off"/>
                    </div>

                </div>

            </div>



            <div class="details family">
                <span class="title">Other Details</span>

                <div class="fields">

                    <div class="input-field">
                         <label for="HEIGHT">Blood Group</label>
                     <select id="BLOOD_GRP" class="form-select">
                            <option value="" selected="selected" disabled="disabled">Choose..</option>
                            <option value="A+">A+</option>
                            <option value="A-">A-</option>
                            <option value="B+">B+</option>
                            <option value="AB+">AB+</option>
                            <option value="AB-">AB-</option>
                            <option value="O+">O+</option>
                            <option value="O-">O-</option>
                        </select>
                    </div>

                    <div class="input-field">
                        <label for="HEIGHT">Height</label>
                        <input type="number" id="HEIGHT" placeholder="Enter in CM" autocomplete="off" />
                        
                    </div>
                    
                    <div class="input-field">
                        <label for="WEIGHT">Weight</label>
                        <input type="number" id="WEIGHT" placeholder="Enter in KG" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="ADHAR_NO">Adhar No</label>
                        <input type="number" id="ADHAR_NO" placeholder="Enter Adhar No" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="FAMILY_INCM">Family Income</label>
                        <input type="number" id="FAMILY_INCM" placeholder="Enter your Family Income" autocomplete="off"/>
                    </div>

                    <div class="input-field">
                        <label for="MAR_STATUS">Marital Status</label>
                         <select id="MAR_STATUS" class="form-select">
                            <option value="" selected="selected" disabled="disabled">Choose..</option>
                            <option value="Married">Married</option>
                              <option value="Unmarried">Unmarried</option>
                        </select>
                       
                    </div>

                    <div class="input-field">
                        <label for="MOTHER_TONGUE">Mother Tongue</label>
                       <select id="MOTHER_TONGUE" class="form-select">
                            <option value="" selected="selected" disabled="disabled">Choose..</option>
                            <option value="English">English</option>
                            <option value="Hindi">Hindi</option>
                            <option value="Assamese">Assamese</option>
                           <option value="Bengali">Bengali</option>
                        </select>
                       
                    </div>

                    <div class="input-field">
                        <label for="RELIGION">Religion</label>
                       <select id="RELIGION" class="form-select">
                            <option value="" selected="selected" disabled="disabled">Choose..</option>
                            <option value="Hinduism">Hinduism</option>
                            <option value="Islam">Islam</option>
                            <option value="Christianity">Christianity</option>
                           <option value="Buddhism">Buddhism</option>
                           <option value="Jainism">Jainism</option>
                        </select>
                    </div>

                    <div class="input-field">
                        <label for="IDENTI_MARK">Identification mark</label>
                        <input type="text" id="IDENTI_MARK" autocomplete="off" />
                    </div>

                </div>
 

            </div>
        </div>
    </form>
        <div class="row container-fluid">
        <div class="col-md-12 col-sm-12 col-lg-12">
            <button type="button" class="btn btn-primary" id="btnRefres" onclick="refresh()"><b>New</b></button>
            <button type="button" class="btn btn-primary saveSample" id="btnSave"><b>Save</b></button>
            <button type="button" class="btn btn-primary viewData" id="btnView"><b>View</b></button>
            <button type="button" class="btn btn-primary modifyData" id="btnModifyNew" style="display: none"><b>Modify</b></button>
            <button type="button" class="btn btn-primary" id="btnVw" ><b>View CaseNo</b></button>
            <button type="button" class="btn btn-primary" id="Next" style="display: none" ><b>Next</b></button>
        </div>
    </div>
</div>
 
</body>
    <script type="text/javascript">
        function refresh() {
            location.reload(true);
            //("#Next").show();
        }
     
        $('CaseNo').ready(function () {
            $("#btnVw").hide();
            
            $("#btnView").click(function () {
                $("#btnSave").hide();
                $("#patShow").show();
                $("#btnModifyNew").show();
                $("#Next").show();
                
            });
            //$("#btnModifyNew").click(function () {
            //    $("#Next").show();
            //})
            $("#Next").on("click", function () {


                window.open("T_details.aspx", "_blank");
            });
            $("#btnlog").on("click", function () {

               
                window.open("LogIn.aspx", "_blank");
            });

           

            $("#btnVw").on("click", function () {

                window.open("GetCaseNo.aspx", "_blank");
            });
            $(document).ready(function () {


            });
            // code for getting all the data by its caseNo
            $(document).on("blur", ".getAllDetails", function () {
                var CaseNo = $("#CaseNo").val().toUpperCase();
                if (CaseNo === "") {
                    alert("Data Missing");
                    $("[id$=CaseNo]").focus();
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/PatInfo",
                    data: JSON.stringify({ CaseNo: CaseNo }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d === null) {
                            alert("Data Not found for : " + CaseNo);
                            return;
                        }
                        var data = response.d;
                        $("[id$=REG_DATE]").val(data["REG_DATE"]);
                        $("[id$=P_TAG]").val(data["P_TAG"]); 
                        $("[id$=F_NAME]").val(data["F_NAME"]);
                        $("[id$=M_NAME]").val(data["M_NAME"]);
                        $("[id$=L_NAME]").val(data["L_NAME"]);
                        $("[id$=DOB]").val(data["DOB"]);
                        $("[id$=SEX]").val(data["SEX"]);
                        $("[id$=P_REG_TYPE]").val(data["P_REG_TYPE"]);
                        $("[id$=P_TYPE]").val(data["P_TYPE"]); 
                        $("[id$=P_CATG]").val(data["P_CATG"]);
                        $("[id$=CONSULT_DATE]").val(data["CONSULT_DATE"]);
                        $("[id$=DMG_NAME]").val(data["DMG_NAME"]);
                        $("[id$=UD_NAME]").val(data["UD_NAME"]);
                        $("[id$=PERM_ADDR1]").val(data["PERM_ADDR1"]);
                        $("[id$=PERM_ADDR2]").val(data["PERM_ADDR2"]);
                        $("[id$=PERM_ADDR3]").val(data["PERM_ADDR3"]);
                        $("[id$=PERM_PIN]").val(data["PERM_PIN"]);
                        
                        $("[id$=KNAME]").val(data["KNAME"]);
                        $("[id$=KRELWPAT]").val(data["KRELWPAT"]);
                        $("[id$=KCOUNTRY]").val(data["KCOUNTRY"]);
                        $("[id$=KSTATE]").val(data["KSTATE"]);
                        $("[id$=KEMAIL]").val(data["KEMAIL"]);
                        $("[id$=KADDR]").val(data["KADDR"]);
                        $("[id$=KCITY]").val(data["KCITY"]);
                        $("[id$=KPHNO]").val(data["KPHNO"]);
                        $("[id$=KPIN]").val(data["KPIN"]);
                        
                        $("[id$=BLOOD_GRP]").val(data["BLOOD_GRP"]);
                        $("[id$=HEIGHT]").val(data["HEIGHT"]);
                        $("[id$=WEIGHT]").val(data["WEIGHT"]);
                        $("[id$=ADHAR_NO]").val(data["ADHAR_NO"]);
                        $("[id$=FAMILY_INCM]").val(data["FAMILY_INCM"]);
                        $("[id$=MAR_STATUS]").val(data["MAR_STATUS"]);
                        $("[id$=MOTHER_TONGUE]").val(data["MOTHER_TONGUE"]);
                        $("[id$=RELIGION]").val(data["RELIGION"]);
                        $("[id$=IDENTI_MARK]").val(data["IDENTI_MARK"]);
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX error", status, error);
                        alert("An error occured");
                    }
                });
            });


              

                $(".saveSample").click(function (e) {
                    e.preventDefault();
                    var REG_DATE = $("#REG_DATE").val();
                    var P_TAG = $("#P_TAG").val();
                    var F_NAME = $("#F_NAME").val();
                    var M_NAME = $("#M_NAME").val();
                    var L_NAME = $("#L_NAME").val();
                    var DOB = $("#DOB").val();
                    var SEX = $("#SEX").val();
                    var P_REG_TYPE = $("#P_REG_TYPE").val();
                    var P_TYPE = $("#P_TYPE").val();
                    var P_CATG = $("#P_CATG").val();
                    var CONSULT_DATE = $("#CONSULT_DATE").val();
                    var DMG_NAME = $("#DMG_NAME").val();
                    var UD_NAME = $("#UD_NAME").val();
                    var PERM_ADDR1 = $("#PERM_ADDR1").val();
                    var PERM_ADDR2 = $("#PERM_ADDR2").val();
                    var PERM_ADDR3 = $("#PERM_ADDR3").val();
                    var PERM_PIN = $("#PERM_PIN").val();

                    var KNAME = $("#KNAME").val();
                    var KRELWPAT = $("#KRELWPAT").val();
                    var KCOUNTRY = $("#KCOUNTRY").val();
                    var KSTATE = $("#KSTATE").val();
                    var KEMAIL = $("#KEMAIL").val();
                    var KADDR = $("#KADDR").val();
                    var KCITY = $("#KCITY").val();
                    var KPHNO = $("#KPHNO").val();
                    var KPIN = $("#KPIN").val();

                    var BLOOD_GRP = $("#BLOOD_GRP").val();
                    var HEIGHT = $("#HEIGHT").val();
                    var WEIGHT = $("#WEIGHT").val();
                    var ADHAR_NO = $("#ADHAR_NO").val();
                    var FAMILY_INCM = $("#FAMILY_INCM").val();
                    var MAR_STATUS = $("#MAR_STATUS").val();
                    var MOTHER_TONGUE = $("#MOTHER_TONGUE").val();
                    var RELIGION = $("#RELIGION").val();
                    var IDENTI_MARK = $("#IDENTI_MARK").val();

                    console.log(REG_DATE + P_TAG +
                 F_NAME + M_NAME + L_NAME + DOB + SEX + P_REG_TYPE +
                 P_TYPE + P_CATG + CONSULT_DATE + DMG_NAME + UD_NAME + PERM_ADDR1 +
                 PERM_ADDR2 + PERM_ADDR3 + PERM_PIN + KNAME + KRELWPAT + KCOUNTRY + KSTATE +
                KEMAIL + KADDR + KCITY + KPHNO + KPIN + BLOOD_GRP + HEIGHT + WEIGHT + ADHAR_NO + FAMILY_INCM + MAR_STATUS +
                MOTHER_TONGUE + RELIGION + IDENTI_MARK);

                    $.ajax({
                        type: "POST",
                        url: "Default.aspx/InsertData",
                        data: JSON.stringify({
                            REG_DATE: REG_DATE,
                            P_TAG: P_TAG,
                            F_NAME: F_NAME,
                            M_NAME: M_NAME,
                            L_NAME: L_NAME,
                            DOB: DOB,
                            SEX: SEX,
                            P_REG_TYPE: P_REG_TYPE,

                            P_TYPE: P_TYPE,
                            P_CATG: P_CATG,
                            CONSULT_DATE: CONSULT_DATE,
                            DMG_NAME: DMG_NAME,
                            UD_NAME: UD_NAME,
                            PERM_ADDR1: PERM_ADDR1,
                            PERM_ADDR2: PERM_ADDR2,
                            PERM_ADDR3: PERM_ADDR3,
                            PERM_PIN: PERM_PIN,

                            KNAME: KNAME,
                            KRELWPAT: KRELWPAT,
                            KCOUNTRY: KCOUNTRY,
                            KSTATE: KSTATE,
                            KEMAIL: KEMAIL,
                            KADDR: KADDR,
                            KCITY: KCITY,
                            KPHNO: KPHNO,
                            KPIN: KPIN,

                            BLOOD_GRP: BLOOD_GRP,
                            HEIGHT: HEIGHT,
                            WEIGHT: WEIGHT,
                            ADHAR_NO: ADHAR_NO,
                            FAMILY_INCM: FAMILY_INCM,
                            MAR_STATUS: MAR_STATUS,
                            MOTHER_TONGUE: MOTHER_TONGUE,
                            RELIGION: RELIGION,
                            IDENTI_MARK: IDENTI_MARK

                        }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",

                        success: function (response) {
                            if (response.d == "true") {
                                alert("Registration successful");
                                $("#btnVw").show();
                            }
                            else {
                                alert("Registration failed");
                            }
                        },
                        error: function (response) {
                            alert("Something went wrong");
                        }
                    });
                });

                

         

            // TO MODIFY THE DATA
   
                $(document).on("click", ".modifyData", function () {

                var sp = {};
                sp.CaseNo = $("[id$=CaseNo]").val();
                sp.REG_DATE = $("[id$=REG_DATE]").val(); // Corrected selector
                sp.P_TAG = $("[id$=P_TAG]").val(); // Corrected selector
                sp.F_NAME = $("[id$=F_NAME]").val();
                sp.M_NAME = $("[id$=M_NAME]").val();
                sp.L_NAME = $("[id$=L_NAME]").val();
                sp.DOB = $("[id$=DOB]").val();
                sp.SEX = $("[id$=SEX]").val();
                sp.P_REG_TYPE = $("[id$=P_REG_TYPE]").val();
                sp.P_TYPE = $("[id$=P_TYPE]").val();
                sp.P_CATG = $("[id$=P_CATG]").val();
                sp.CONSULT_DATE = $("[id$=CONSULT_DATE]").val();
                sp.DMG_NAME = $("[id$=DMG_NAME]").val();
                sp.UD_NAME = $("[id$=UD_NAME]").val();
                sp.PERM_ADDR1 = $("[id$=PERM_ADDR1]").val();
                sp.PERM_ADDR2 = $("[id$=PERM_ADDR2]").val();
                sp.PERM_ADDR3 = $("[id$=PERM_ADDR3]").val();
                sp.PERM_PIN = $("[id$=PERM_PIN]").val();
                sp.KNAME = $("[id$=KNAME]").val();
                sp.KRELWPAT = $("[id$=KRELWPAT]").val();
                sp.KCOUNTRY = $("[id$=KCOUNTRY]").val();
                sp.KSTATE = $("[id$=KSTATE]").val();
                sp.KEMAIL = $("[id$=KEMAIL]").val();
                sp.KADDR = $("[id$=KADDR]").val();
                sp.KCITY = $("[id$=KCITY]").val();
                sp.KPHNO = $("[id$=KPHNO]").val();
                sp.KPIN = $("[id$=KPIN]").val();
                sp.BLOOD_GRP = $("[id$=BLOOD_GRP]").val();
                sp.HEIGHT = $("[id$=HEIGHT]").val();
                sp.WEIGHT = $("[id$=WEIGHT]").val();
                sp.ADHAR_NO = $("[id$=ADHAR_NO]").val();
                sp.FAMILY_INCM = $("[id$=FAMILY_INCM]").val();
                sp.MAR_STATUS = $("[id$=MAR_STATUS]").val();
                sp.MOTHER_TONGUE = $("[id$=MOTHER_TONGUE]").val();
                sp.RELIGION = $("[id$=RELIGION]").val();
                sp.IDENTI_MARK = $("[id$=IDENTI_MARK]").val();

                $.ajax({
                    type: "POST",
                    url: "Default.aspx/ModifyData",
                    data: JSON.stringify({ sp: sp }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        if (response.d.length > 0) {
                            alert(response.d[0].RtState);
                            
                        }
                      //  $("#Next").show();
                        location.reload(); // Moved inside success callback
                       
                    },
                    error: function (xhr, status, error) {
                        console.error(error); // Handle error appropriately
                    }
                });
            });



        });
    </script>
</html>
