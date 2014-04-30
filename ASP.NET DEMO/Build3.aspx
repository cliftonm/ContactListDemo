<%@ Page Language="C#" CodeBehind="Build3.aspx.cs" Inherits="ContactListDemo.Build3" %>

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
        <div id="MyButtonList">
            <input type="checkbox" id="toggle_email"/><label for="toggle_email">email</label>
            <input type="checkbox" id="toggle_home"/><label for="toggle_home">home</label>
            <input type="checkbox" id="toggle_work"/><label for="toggle_work">work</label>
            <input type="checkbox" id="toggle_cell"/><label for="toggle_cell">cell</label>
        </div>
        <div style="width: 500px">
            <div style="width: 100%">
                <table id='contactsTable' class='tablesorter-default'>
                    <thead>
                        <tr>
                            <th style="white-space: nowrap">Last Name</th>
                            <th style="white-space: nowrap">First Name</th>
                            <th style="white-space: nowrap; width: 99%"></th>
                            <th style="white-space: nowrap;">Email</th>
                            <th style="white-space: nowrap;">Home</th>
                            <th style="white-space: nowrap;">Work</th>
                            <th style="white-space: nowrap;">Cell</th>
                        </tr>
                    </thead>
                    <% foreach ( System.Data.DataRow oContact in Contacts.Rows ) { %>
                    <tr>
                        <td style="white-space: nowrap"><%= oContact["last_name"]%></td>
                        <td style="white-space: nowrap"><%= oContact["first_name"]%></td>
                        <td style="white-space: nowrap; width: 99%"></td>
                        <td style="white-space: nowrap;"><%= oContact["email"]%></td>
                        <td style="white-space: nowrap;"><%= oContact["home_phone"]%></td>
                        <td style="white-space: nowrap;"><%= oContact["work_phone"]%></td>
                        <td style="white-space: nowrap;"><%= oContact["cell_phone"]%></td>
                    </tr>
                    <% } %>
                </table>
            </div>
        </div>
        <!-- http://jsfiddle.net/BKgue/2/ -->

        <script type="text/javascript">
            $(document).ready(function () {
                $('#MyButtonList').buttonset();

                showOrHide('#toggle_email', 4)
                showOrHide('#toggle_home', 5)
                showOrHide('#toggle_work', 6)
                showOrHide('#toggle_cell', 7)

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

            $("#toggle_email").click(function () {
                showOrHide('#toggle_email', 4)
            });

            $("#toggle_home").click(function () {
                showOrHide('#toggle_home', 5)
            });

            $("#toggle_work").click(function () {
                showOrHide('#toggle_work', 6)
            });

            $("#toggle_cell").click(function () {
                showOrHide('#toggle_cell', 7)
            });

            function showOrHide(button, colNum) {
                if ($(button).is(":checked")) {
                    $('#contactsTable tr *:nth-child(' + colNum + ')').removeClass('hidden');
                }
                else {
                    $('#contactsTable tr *:nth-child(' + colNum + ')').addClass('hidden');
                }
            }
        </script>
    </form>
</body>
</html>
