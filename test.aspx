<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="BloodDonation_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blood Donation</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../plugins/sweetalert/sweetalert.css" rel="stylesheet" />
    <link href="../css/jquery-ui1.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
    <%--<link href="../plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" />--%>
    
    <style>
        .parent {
    max-width: 1000px%;;
  margin: 0 auto; /* This will center the element horizontally */
   /* This will apply a blue box shadow */
     max-width: 1000px;
            
}
      

       .content{
           border-collapse: collapse;
            margin: 15px 0;
            font-size: 16px;
            width: 100%; /* Table will fit the screen for desktop */
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
       }

        /* Style for the modal */
        .modal-content {
            margin-top: 10%;
        }

       .table-container {
  max-height: 300px; /* Adjust the height as needed */
  overflow-y: auto; /* This will add a vertical scroll bar when needed */
  overflow-x: hidden; /* Hide horizontal scrollbar if it's not needed */
}

.table {
  width: 100%;
  border-collapse: collapse;
}

.table th, .table td {
  border: 1px solid black;
  padding: 8px;
  text-align: left;
}

.logo{
    text-align: center;
}

.heading{
    text-align: center;
}

.btncss{
    text-align: center;
    justify-content: space-between;
    margin-top: 1rem;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logo">
            <img src="Image/logo.png"/>

        </div>
        <div class="heading">
            <h2><u>Treatment Details</u></h2>
        </div>

        <div class="parent">
           
          <div class="table-container">
  <table class="table table-bordered" id="treatmentTable style="margin-top: 1rem;">
    <thead id="thead" style="background-color: darkgoldenrod; color: white;">
      <tr>
        <th>Treatment Name</th>
        <th>Treatment Cost</th>
      </tr>
    </thead>
    <tbody class="treatment-details" style="background-color: deepskyblue;">
      <!-- Treatment details with checkboxes will be populated dynamically -->
    </tbody>
  </table>
</div>
        
            </div>
        <div class="row container-fluid">
            <div class="col-md-12 col-sm-12 col-lg-12">
                <!-- Corrected data-target attribute to match modal ID -->
                <div class="btncss">
                <button type="button" class="btn btn-primary" id="btnView" data-toggle="modal" data-target="#exampleModal"><b>Add</b></button>
                <button type="button" class="btn btn-primary" id="btnNext"><b>Next</b></button>
                <button type="button" class="btn btn-primary" id="btnHome"><b>Home</b></button>
                    </div>
            </div>
        </div>
    
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Treatment</h5>
                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="input fields">
                            <label for="treatmentName">Treatment Name:</label>
                            <input type="text" id="treatmentName" class="form-control" autocomplete="off">
                        </div>
                        <div class="input fields">
                            <label for="treatmentCost">Treatment Cost:</label>
                            <input type="text" id="treatmentCost" class="form-control" autocomplete="off">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary saveSample" id="btnSave"><b>Submit</b></button>
                    </div>
                </div>
            </div>
        </div>
    </form>
     
 
    <!-- Bootstrap JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- AJAX Call -->
     <script>
         $(document).ready(function () {
             
            $('#btnView').click(function () {
                $('#exampleModal').modal('show');
            });

            $('#btnNext').click(function () {
                window.open("T_details.aspx", "_blank");
            });

            $('#btnHome').click(function () {
                window.open("Default.aspx", "_blank");
            });
            $.ajax({
                type: "POST",
                url: "test.aspx/GetTreatmentData",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    data = JSON.parse(data.d);
                    $.each(data, function (index, item) {
                        var row = $("<tr>")
                            //.append($('<td><input type="checkbox" class="selectTreatment" value="' + item.T_NAME + '" data-cost="' + item.T_COST + '"></td>'))
                            .append($("<td>").text(item.T_NAME))
                            .append($("<td>").text(item.T_COST));
                        $(".treatment-details").append(row);
                    });
                },
                error: function (xhr, status, error) {
                    console.log("Error:", error);
                }
            });

            $(".saveSample").click(function (e) {
                e.preventDefault();
                var T_NAME = $("#treatmentName").val();
                var T_COST = $("#treatmentCost").val();
                if (T_NAME === "" && T_COST === "") {
                    alert("Please Enter Treatment Name");
                    $("[id$=treatmentName]").focus();
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: "test.aspx/SaveTData",
                    data: JSON.stringify({
                        T_NAME: T_NAME,
                        T_COST: T_COST
                    }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == "true") {
                            location.reload();
                        } else {
                            alert("Registration failed");
                        }
                    },
                    error: function (response) {
                        alert("Something went wrong");
                    }
                });
            });

            //$('#InsertSample').click(function () {
            //    var CaseNo = $("#CaseNo").val();
            //    var treatments = [];
            //    $('input[type=checkbox].selectTreatment:checked').each(function () {
            //        treatments.push({
            //            T_NAME: $(this).val(),
            //            T_COST: $(this).data('cost')
            //        });
            //    });
            //    $.ajax({
            //        type: "POST",
            //        url: "test.aspx/InsertTData",
            //        data: JSON.stringify({
            //            CaseNo: CaseNo,
            //            Treatments: treatments
            //        }),
            //        contentType: "application/json; charset=utf-8",
            //        dataType: "json",
            //        success: function (response) {
            //            if (response.d === "true") {
            //                alert("Record inserted successfully");
            //                location.reload();
            //            } else {
            //                 Check if the response contains the error message
            //                if (response.d.startsWith("Treatment name")) {
            //                    alert(response.d); // Display the error message
            //                } else {
            //                    alert("Failed to insert record");
            //                }
            //            }
            //        },
            //        error: function (xhr, status, error) {
            //            console.log("Error:", error);
            //            alert("Something went wrong while inserting record.");
            //        }
            //    });
            //});

        });
    </script>
</body>
</html>
