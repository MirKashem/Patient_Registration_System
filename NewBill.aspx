<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewBill.aspx.cs" Inherits="BloodDonation_NewBill" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blood Donation Bill</title>
    <link href="../plugins/sweetalert/sweetalert.css" rel="stylesheet" />
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <link href="/css/jquery-ui1.css" rel="stylesheet" />
    <link href="../plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" />
    <link href="../plugins/materialize-css/css/mat-icons.css" rel="stylesheet" />
    <link href="../plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .table-bordered tbody tr {
            border-bottom: 2px solid black;
        }

            .table-bordered tbody tr:last-child {
                border-bottom: 1px solid;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div style="font-size: 14px;" class="row">
                <div class="col-lg-2 col-sm-2 col-sm-2">
                    <img height="100px" width="100px" src="Image/logo.png" />
                </div>
                <div class="col-lg-8 col-sm-8 col-sm-8">
                    <p style="padding: 0px; margin: 0px; text-align: center"><b>DR. B. BOROOAH CENTER INSTITUTE BLOOD CENTER</b></p>
                    <p style="padding: 0px; margin: 0px; text-align: center"><b>A grant in aid institute of Dept. of Atomic Energy, Govt. of India and a unit of Tata Memorial Center, Mumbai</b></p>
                    <p style="padding: 0px; margin: 0px; text-align: center"><b>Gopinath Nagar, Guwahati-781016</b></p>
                    <p style="font-size: 16px; padding: 0px; margin: 0px; text-align: center"><b><u>BLOOD REQUISITION FORM</u></b></p>
                </div>
            </div>
            <div style="font-size: 12px;" class="row">
                <div class="col-md-4 col-sm-4 col-lg-4">
                    <b>Ph no: 6900141530</b>
                </div>
                <div class="col-md-4 col-sm-4 col-lg-4">
                    <p style="text-align: center"><b>Fax no.: 91-0361-2472636</b></p>
                </div>
                <div class="col-md-4 col-sm-4 col-lg-4">
                    <p style="text-align: right"><b>License no: 143/DR/Mfg/Blood</b></p>
                </div>
            </div>
        </div>
        <div style="font-size: 12px;" class="container-fluid row">
            <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-2 col-xl-3">
                        <label for="CaseNo">Case No:</label>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xl-2">
                        <input class="" type="text" id="CaseNo" placeholder="Enter Case No" autocomplete="off" />
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-lg-3 col-sm-3 col-xs-3">
                <label for="F_NAME">First Name: </label>
                <span id="F_NAME"></span>
            </div>
            <div class="col-md-2 col-lg-2 col-sm-2 col-xs-2">
                <label for="M_NAME">Middle Name: </label>
                <span id="M_NAME"></span>
            </div>
            <div class="col-md-2 col-lg-2 col-sm-2 col-xs-2">
                <label for="L_NAME">Last Name: </label>
                <span id="L_NAME"></span>
            </div>
            <div class="col-md-2 col-lg-2 col-sm-2 col-xs-2">
                <label for="DOB">DOB: </label>
                <span id="DOB"></span>
            </div>
            <div class="col-md-4 col-lg-3 col-sm-3 col-xs-3">
                <label for="REG_DATE">Registration Date: </label>
                <span id="REG_DATE"></span>
            </div>
            <div class="col-md-2 col-lg-2 col-sm-2 col-xs-2">
                <label for="SEX">Sex: </label>
                <span id="SEX"></span>
            </div>
        </div>
        <div class="container-fluid" style="font-size: 10px;">
            <table class="table table-bordered" style="margin-top: 3rem;">
                <thead>
                    <tr style="background-color: darkgray;">
                        <th>Memo No</th>
                        <th>Treatment Date</th>
                        <th>Total Cost</th>
                    </tr>
                </thead>
                <tbody class="treatment-details" style="text-align: center; background-color: snow;">
                    <!-- Treatment details will be populated dynamically -->
                </tbody>
            </table>
            
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $("#CaseNo").on("blur", function () {
                var caseNo = $(this).val().trim();
                if (caseNo === "") {
                    alert("Please Enter CaseNo.");
                    $(this).focus();
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: "NewBill.aspx/BillInfo",
                    data: JSON.stringify({ CaseNo: caseNo }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        //alert(response.d.length);

                        if (response.hasOwnProperty("d") && response.d.hasOwnProperty("patients") && response.d.patients.length > 0) {
                            var patients = response.d.patients;
                            $(".treatment-details").empty();
                            
                            //for (var i = 0; i < response.d.length; i++) {
                            //    alert(response.d[i].MemoNo)
                            //    $(".treatment-details").append("<tr><td>" + response.d[i].MemoNo + "</td><td>" + response.d[i].TreatmentDate + "</td><td>" + response.d[i].total_cost + "</td></tr>");
                            //}



                            $.each(patients, function (index, patient) {
                                $("#F_NAME").text(patient.F_NAME);
                                $("#M_NAME").text(patient.M_NAME);
                                $("#L_NAME").text(patient.L_NAME);
                                $("#DOB").text(patient.DOB);
                                $("#REG_DATE").text(patient.REG_DATE);
                                $("#SEX").text(patient.SEX);

                               // alert(patient.TreatmentDate);

                                // Parse the TreatmentDate properly
                                var treatmentDate = new Date(patient.TreatmentDate);
                                if (isNaN(treatmentDate.getTime())) {
                                    treatmentDate = new Date(patient.TreatmentDate.replace(/-/g, '/'));
                                }
                                
                                $(".treatment-details").append("<tr><td><a href='Bill.aspx?caseno=" + caseNo + "&MemoNo=" + patient.MemoNo + "' target='_blank'> MN " + patient.MemoNo + "</a></td><td>" + patient.TreatmentDate.split(' ')[0] + "</td><td>" + patient.total_cost + "</td></tr>");
                                
                            });
                        }
                        else {
                            $(".treatment-details").empty().append("<tr><td colspan='3'>No data found</td></tr>");
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log("Ajax error:", status, error);
                        alert("An error occurred while fetching the data");
                    }
                });
            });
        });
    </script>
</body>
</html>
