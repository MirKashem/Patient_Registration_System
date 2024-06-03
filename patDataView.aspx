<%@ Page Language="C#" AutoEventWireup="true" CodeFile="patDataView.aspx.cs" Inherits="BloodDonation_patDataView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="../plugins/sweetalert/sweetalert.css" rel="stylesheet" />
    <script src="assets/jquery/jquery.js"></script>
    <script src="Style/datatables.min.js"></script>
    <link href="Style/datatables.min.css" rel="stylesheet"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <script src="assets/js/bootstrap.js"></script>

    <style>
         <style type="text/css">
        .auto-style1 {
            width: 493px;
        }
        .table-bordered {
            border-color: black;
        }
        *{
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
       
.btn-container {
    display: flex;
    height: 74px;
    justify-content: space-between;
}

.container {
  white-space: nowrap;

  width: 200px; /* Adjust the width as needed */
 
}
@keyframes heartbeat {
      0% {
        transform: scale(1);
      }
      50% {
        transform: scale(1.1);
      }
      100% {
        transform: scale(1);
      }
    }

    .heartbeat-text {
      animation: heartbeat 1s infinite;
    }

       .navbar{
           margin-bottom: 30px;
       }

    </style>

</head>
<body>
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <img src="image/logo.png" height="100px" width="100px"/>
        <div class="container-fluid">
            
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="Default.aspx" target="_blank">New Registration</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="GetCaseNo.aspx" target="_blank">CaseNo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="NewBill.aspx" target="_blank">Bill</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="test.aspx" target="_blank">Add New Treatment</a>
                    </li>

                     <li class="nav-item">
                        <a class="nav-link" href="T_details.aspx" target="_blank">Patient Treatment Entry</a>
                    </li>

                   

                    
                </ul>
            </div>
        </div>
    </nav>
     

    <form id="form1" runat="server">
        <%--<asp:Button ID="btnlgout" runat="server"  value="LogOut"  OnClick="btnlgout_Click" />--%>
    <div class="content">
        <div class="card">
            <h2 style="margin-left: 33.9rem; font-family: cursive; ">Patient Data</h2>

            <asp:Literal ID="htmlTableLiteral" runat="server"></asp:Literal>
        </div>
    </div>
        <script>
            $(document).ready(function () {
                let table = new DataTable('#myTable');
                
            });
        </script>
    
    </form>
</body>
</html>
