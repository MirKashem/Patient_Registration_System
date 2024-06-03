<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetCaseNo.aspx.cs" Inherits="BloodDonation_GetCaseNo" %>

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

body {
    padding: 0;
    margin: 0;
    background-image: url(Image/CaseNo.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    font-family: Arial;
}

.login {
    width: 90%; /* Adjust width for smaller screens */
    max-width: 39.875rem; /* Set maximum width */
    margin: auto;
    padding: 5rem;
    background-color: red;
    border-radius: 1rem;
    box-sizing: border-box; /* Ensure padding is included in width */
}

label {
    font-size: 1.1rem;
    color: white; /* Set label color */
}

#CaseNo, #REG_DATE, #P_TAG, #F_NAME{
    width: 100%; /* Make inputs fill the width */
    height: 2rem;
    padding-left: 8px;
    border: none;
    border-radius: 5px;
    margin-bottom: 10px; /* Add some space between inputs */
    box-sizing: border-box; /* Ensure padding is included in width */
}
#getDetails{
     width: 100%; /* Make inputs fill the width */
    height: 2rem;
    padding-left: 8px;
    border: none;
    border-radius: 5px;
    margin-bottom: 10px; /* Add some space between inputs */
    box-sizing: border-box;
}

#getDetails {
    padding-left: 7px;
    border-radius: 17px;
}



#backBtn{
   width: 23%;
    height: 23%;
    padding-left: 8px;
    margin-top: 1rem;
    border: none;
    border-radius: 8px;
    margin-bottom: -16px;
    box-sizing: border-box;
}

#nextBtn{
   width: 23%;
    height: 23%;
    padding-left: 3px;
    margin-left: 253px;
    margin-top: 1rem;
    border: none;
    border-radius: 8px;
    margin-bottom: -16px;
    box-sizing: border-box;


</style>

</head>
<body>
<div class="login">
    <form id="loginform" runat="server">
        
            <label>CaseNo</label> <br />
            <input type="text" id="CaseNo" readonly />
            <label>Registration Date</label>
            <input type="text" id="REG_DATE" readonly />
            <label>Patient Tag</label>
            <input type="text" id="P_TAG" readonly />
            <label>First Name</label>
            <input type="text" id="F_NAME" readonly />
            <br />
            <br />
            <input type="button" class="getDetails" id="getDetails" value="Generate Case No" />
            <input type="button" class="backBtn" id="backBtn" value="Back" />
            <input type="button" class="nextBtn" id="nextBtn" value="Next" />


    </form>
 </div>

    <script>
        $(document).ready(function () {
            $("#backBtn").on("click", function () {

                window.open("Default.aspx", "_blank");
            });

            $("#nextBtn").on("click", function () {

                window.open("T_details.aspx", "_blank");
            });
            $("#getDetails").click(function () {
                $.ajax({
                    type: "POST",
                    url: "GetCaseNo.aspx/PatInfo",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response && response.d) {
                            $("#CaseNo").val(response.d.CaseNo);
                            $("#REG_DATE").val(response.d.REG_DATE);
                            $("#P_TAG").val(response.d.P_TAG);
                            $("#F_NAME").val(response.d.F_NAME);
                        } else {
                            alert("No data found.");
                        }
                    },
                    error: function () {
                        alert("Something went wrong");
                    }
                });
            });
        });
    </script>
</body>
</html>
