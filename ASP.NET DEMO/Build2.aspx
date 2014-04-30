<%@ Page Language="C#" CodeBehind="Build2.aspx.cs" Inherits="ContactListDemo.Build2" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <script src="JS/jquery-2.1.0.min.js"></script>
    <script src="JS/jquery-ui-1.10.4.min.js"></script>
    <script src="JS/jquery.tablesorter.min.js"></script>
    <link href="CSS/jquery-ui.min.css" rel="stylesheet" />
    <link href="CSS/theme.default.css" rel="stylesheet" />
    <link href="CSS/filter.formatter.css" rel="stylesheet" />
    <link href="CSS/home.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 500px">
            <div style="width: 100%">
                <table id='contactsTable' class='tablesorter-default'>
                    <thead>
                        <tr>
                            <th>Last Name</th>
                            <th>First Name</th>
                            <th>Email</th>
                            <th>Home</th>
                            <th>Work</th>
                            <th>Cell</th>
                        </tr>
                    </thead>
                    <% foreach ( System.Data.DataRow oContact in Contacts.Rows ) { %>
                    <tr>
                        <td><%= oContact["last_name"]%></td>
                        <td><%= oContact["first_name"]%></td>
                        <td><%= oContact["email"]%></td>
                        <td><%= oContact["home_phone"]%></td>
                        <td><%= oContact["work_phone"]%></td>
                        <td><%= oContact["cell_phone"]%></td>
                    </tr>
                    <% } %>
                </table>
            </div>
        </div>
        <!-- http://jsfiddle.net/BKgue/2/ -->

        <script type="text/javascript">
            $(document).ready(function () {
                $('#MyButtonList').buttonset();
                $("#contactsTable").tablesorter({
                    widgets: ['zebra'],
                    headers: {
                        0: { sorter: "text" },
                        1: { sorter: "text" },
                        2: { sorter: false },
                        3: { sorter: false },
                        4: { sorter: false },
                        5: { sorter: false },
                        6: { sorter: false }
                    }
                })
            });
        </script>
    </form>
</body>
</html>
