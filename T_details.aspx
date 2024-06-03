<%@ Page Language="C#" AutoEventWireup="true" CodeFile="T_details.aspx.cs" Inherits="BloodDonation_T_details" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Include jQuery UI for autocomplete -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <style>
        body {
           /*background-color: blue;*/
        }
        .container-box {
            display: flex;
            position: absolute;
            top: 27%;
            left: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border: 2px solid #ccc;
            border-radius: 1px;
        }
        .form-control {
            margin-right: 10px;
            width: 13rem;
        }
        #enteredValues {
           position: absolute;
    top: 156%;
    left: 39%;
    transform: translate(-52%, -50%);
    width: 49rem;
    max-height: 200px;
    overflow-y: auto;
}
        }
        .ui-autocomplete {
            max-width: 200px;
            max-height: 150px;
            white-space: nowrap;
            overflow-y: scroll;
            padding: 20px;
            box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }
        .ui-autocomplete:hover {
            cursor: pointer;
        }
        label {
            width: max-content;
            display: inline-block;
            margin-bottom: .5rem;
        }
        .card-header {
            text-align: center;
            font-family: Tahoma;
        }
        .content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 10px;
        }
        .input-fields {
            display: flex;
            flex-direction: column;
        }
        .container-fluid{
         position: relative;
    max-width: 1000px;
    width: 100%;
    border-radius: 4px;
    padding: 36px;
    margin: 5px 95px;
    background-color: #fff;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
    border-radius: 20px;
}
        
        .container{
             position: relative;
    max-width: 1000px;
    width: 100%;
    border-radius: 4px;
    padding: 36px;
    margin: 5px 217px;
    background-color: #fff;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
    border-radius: 20px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-info">
        <img src="image/logo.png" height="100px" width="100px"/>
        <div class="container-fluid">
            
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="Default.aspx" target="_blank">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="GetCaseNo.aspx" target="_blank">CaseNo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="NewBill.aspx" target="_blank">Bill</a>
                    </li>
                     <h2 style="margin-left: 144px; font-family: cursive; ">Treatment Details Entry</h2>

                    
                </ul>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div class="container">
           
            <div class="content">
                <div class="input-fields">
                    <label>Case No:</label>
                    <asp:TextBox ID="txtCaseNo" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                </div>
                <div class="input-fields">
                    <label>First Name:</label>
                    <asp:TextBox ID="F_NAME" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                </div>
                <div class="input-fields">
                    <label>Middle Name:</label>
                    <asp:TextBox ID="M_NAME" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                </div>
                <div class="input-fields">
                    <label>Last Name:</label>
                    <asp:TextBox ID="L_NAME" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                </div>
            </div>
            <div class="content">
                <div class="input-fields">
                    <label>Treatment Name:</label>
                    <asp:TextBox ID="txtTreatment" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="input-fields">
                    <label>Quantity:</label>
                    <input type="number" id="txtQuantity" class="form-control" min="1" value="1" />
                </div>
                <div class="input-fields">
                    <label>Date</label>
                    <input type="date" id="txtDate" class="form-control" />
                </div>
                <div class="input-fields">
                    <label>Cost:</label>
                    <asp:TextBox ID="txtCost" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div id="enteredValues" style="display: none;">
                <table class="table">
                    <tbody>
                    </tbody>
                </table>
                <button id="insertButton" class="btn btn-primary" type="button">Insert Values</button>
            </div>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            var today = new Date().toISOString().split('T')[0];
            document.getElementById('txtDate').value = today;

            // T_details Info
            $("#txtCaseNo").on("blur", function () {
                var CaseNo = $("#txtCaseNo").val().toUpperCase();
                $.ajax({
                    type: "POST",
                    url: "T_details.aspx/T_info",
                    data: JSON.stringify({ CaseNo: CaseNo }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == null) {
                            alert("Data Not found for: " + CaseNo);
                            return;
                        }
                        var data = response.d;
                        $("[id$=F_NAME]").val(data["F_NAME"]);
                        $("[id$=M_NAME]").val(data["M_NAME"]);
                        $("[id$=L_NAME]").val(data["L_NAME"]);
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX error", status, error);
                        alert("An error occurred");
                    }
                });
            });

            var treatmentCost = 0; 

            // Autocomplete for Treatment Name textbox
            $("#<%= txtTreatment.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "T_details.aspx/GetTreatmentNames",
                        data: "{'prefix':'" + $("#<%= txtTreatment.ClientID %>").val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                },
                minLength: 1, 
                select: function (event, ui) {
                    // Cost fill hoise 
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "T_details.aspx/GetTreatmentCost",
                        data: "{'treatmentName':'" + ui.item.value + "'}",
                        dataType: "json",
                        success: function (data) {
                            treatmentCost = parseFloat(data.d); // Store treatment cost
                            updateCost(); 
                            $("#selectedMessage").empty();
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });

            // Trigger autocomplete search when blur over the textbox
            $("#<%= txtTreatment.ClientID %>").on("blur", function () {
                if ($("#<%= txtCaseNo.ClientID %>").val() === "") {
                    alert("Enter CaseNo First");
                    $("#<%= txtCaseNo.ClientID %>").focus();
                    clearFields();
                } else {
                    $(this).autocomplete("search", "");
                   

                }
            });

            // Update cost when quantity changes
            $("#txtQuantity").on("input", function () {
                updateCost();
            });

            // Event handler for Enter key press on the form
            $("#form1").on("keypress", function (e) {
                if (e.keyCode === 13) {
                    e.preventDefault(); // Prevent default form submission
                    updateWebpage(); // Call the custom function
                    $("#<%= txtTreatment.ClientID %>").focus();

                }
            });

            // Event handler for clicking outside of the textboxes
            $(document).on("click", function (event) {
                var target = $(event.target);
                var caseNo = $("#<%= txtCaseNo.ClientID %>").val();
                var treatmentName = $("#<%= txtTreatment.ClientID %>").val();
                var quantity = $("#txtQuantity").val();
                var treatmentDate = $("#txtDate").val();

                if (!target.closest("#form1").length && caseNo && treatmentName && quantity && treatmentDate) {
                    updateWebpage(); // Update webpage only when all fields have values
                }
            });

            // Event handler for clicking the "Insert Values" button
            $("#insertButton").on("click", function () {
                insertValuesIntoDatabase();
            });

            // Function to update the cost based on quantity and treatment cost
            function updateCost() {
                var quantity = parseInt($("#txtQuantity").val());
                var cost = quantity * treatmentCost;
                $("#<%= txtCost.ClientID %>").val(cost.toFixed(2)); // Update the cost textbox
            }

            // Function to update the webpage
            function updateWebpage() {
                var caseNo = $("#<%= txtCaseNo.ClientID %>").val();
                var treatmentName = $("#<%= txtTreatment.ClientID %>").val();
                var quantity = $("#txtQuantity").val();
                var cost = $("#<%= txtCost.ClientID %>").val();
                var treatmentDate = $("#txtDate").val(); // Capture the treatment date

                if (caseNo && treatmentName && quantity && cost && treatmentDate) {
                    var newRow = $("<tr>");
                    newRow.append($("<td>").text(caseNo));
                    newRow.append($("<td>").text(treatmentName));
                    newRow.append($("<td>").text(quantity));
                    newRow.append($("<td>").text(treatmentDate)); // Include the treatment date
                    newRow.append($("<td>").text(cost));
                    $("#enteredValues table tbody").append(newRow);
                    $("#enteredValues").show(); // Show the div if it's hidden

                    // Clear the input fields
                    clearFields();
                } else {
                    alert("Please fill in all fields before updating.");
                }
            }

            // Function to clear input fields
           function clearFields()
            {
                $("#<%= txtTreatment.ClientID %>").val("");
                $("#txtQuantity").val("1");
                $("#<%= txtCost.ClientID %>").val("");
                // $("#txtDate").val(""); // Clear the date field
            }

            // Function to insert values into the database
            function insertValuesIntoDatabase() {
                var valuesArray = [];

                // Loop through each row in the table and collect values
                $("#enteredValues table tbody tr").each(function () {
                    var row = $(this);
                    var caseNo = row.find("td:eq(0)").text();
                    var treatmentName = row.find("td:eq(1)").text();
                    var quantity = row.find("td:eq(2)").text();
                    var treatmentDate = row.find("td:eq(3)").text(); // Include the treatment date
                    var cost = row.find("td:eq(4)").text();

                    valuesArray.push({//aie2 backend or lgot milibo lagbo
                        CaseNo: caseNo,
                        TreatmentName: treatmentName,
                        Qty: parseInt(quantity),
                        Cost: parseFloat(cost),
                        TreatmentDate: treatmentDate // Include the treatment date
                    });
                });

                // Make an AJAX call to the server-side method to insert values
                $.ajax({
                    type: "POST",
                    url: "T_details.aspx/InsertValues",
                    data: JSON.stringify({ values: valuesArray }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d === "Success") {
                            alert("Values inserted successfully!");
                            $("#enteredValues table tbody").empty(); // Clear the table after insertion
                            $("#enteredValues").hide(); // Hide the div after insertion
                        } else {
                            alert("Failed to insert values.");
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX error", status, error);
                        alert("An error occurred while inserting values.");
                    }
                });
            }
        });
    </script>
</body>
</html>
