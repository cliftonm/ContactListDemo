<%@ Page Language="C#" CodeBehind="Build5.aspx.cs" Inherits="ContactListDemo.Build5" %>

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
            <div style="margin-left: 20px; width: 100%">
                <div class="onoffswitch" style="float: left; margin-top: 1px">
                    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" checked />
                    <label class="onoffswitch-label" for="myonoffswitch">
                        <span class="onoffswitch-inner"></span>
                        <span class="onoffswitch-switch"></span>
                    </label>
                </div>

                <div id="MyButtonList" style="float: right">
                    <input type="checkbox" id="toggle_email" /><label for="toggle_email">email</label>
                    <input type="checkbox" id="toggle_home" /><label for="toggle_home">home</label>
                    <input type="checkbox" id="toggle_work" /><label for="toggle_work">work</label>
                    <input type="checkbox" id="toggle_cell" /><label for="toggle_cell">cell</label>
                </div>
            </div>

            <div class="index-filter">
                <table style="font: 12px/18px Arial, Sans-serif;">
                    <tr>
                        <td>
                            <a href='#' id='filter-none' onclick='showAll()'>*</a>
                        </td>
                    </tr>
                    <% foreach ( char s in Enumerable.Range( 'A', 'Z' - 'A' + 1 ).Select( x => x ) ) { %>
                    <tr>
                        <td>
                            <a href='#' id='filter-<%= s %>' onclick='filterBy("<%= s %>")'><%= s %></a>
                        </td>
                    </tr>
                    <% } %>
                </table>
            </div>

            <div style="margin-left: 20px; width: 100%; padding-top: 3px">
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
                    <tbody id='filterable'>
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
                    </tbody>
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

                if (!$("#myonoffswitch").is(":checked")) {
                    var tbl = $('#contactsTable');
                    moveColumn(tbl, 1, 0);
                }

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

            $("#myonoffswitch").click(function () {
                var tbl = $('#contactsTable');
                moveColumn(tbl, 1, 0);
            });

            function moveColumn(table, from, to) {
                var rows = $('tr', table);
                var cols;
                rows.each(function () {
                    cols = $(this).children('th, td');
                    cols.eq(from).detach().insertBefore(cols.eq(to));
                });
            }

            function showAll() {
                $("#filterable").find("tr").each(function (idx, row) {
                    row.hidden = false;
                });
            }

            // Filter by the first letter of the first column, which will be either last name or first name.
            function filterBy(letter) {
                var rows = $("#filterable").find("tr");
                rows.each(function (idx, row) {
                    if (row.children[0].innerHTML.indexOf(letter) == 0) {
                        row.hidden = false;
                    }
                    else {
                        row.hidden = true;
                    }
                });
            }
        </script>
    </form>
</body>
</html>
