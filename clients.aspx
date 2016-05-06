<%@ Page Title="" Language="C#" MasterPageFile="~/MPforAddClient.master" AutoEventWireup="true" CodeFile="clients.aspx.cs" Inherits="clients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script>
        function ShowDeleteClient(str) {
            $(function () {
                $("#dialogMessageClient").text(str); // open the dialog
                $("#dialogMessageClient").dialog({
                    modal: true,
                    title: " הסרת לקוח מזדמן",
                    buttons: {                                  // define the buttons and their behavior
                        אישור: function () {
                            $("[id*=hiddenSubmitDelete]").click(); // click to create a postback
                            $(this).dialog("close");
                        },
                        ביטול: function () {
                            $("[id*=cancel]").click();
                            $(this).dialog("close");
                        }
                    }
                })
            })
        }




        function ShowClientDelete(str) {
            $(function () {
                $("#dialogDeleteMessageClient").text(str); // open the dialog
                $("#dialogDeleteMessageClient").dialog({
                    modal: true,
                    title: " הודעה",
                    buttons: {                                  // define the buttons and their behavior
                        אישור: function () {
                            $("[id*=cancel]").click(); // click to create a postback
                            $(this).dialog("close");
                        }

                    }
                })
            })
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- BEGIN PAGE -->
    <div id="main-content">
        <!-- BEGIN PAGE CONTAINER-->
        <br>
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">

                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">לקוחות המערכת 
                    </h3>

                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <hr />
            <!-- END PAGE HEADER-->
            <br />
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN BASIC PORTLET-->
                    <div class="widget white-full">
                        <div class="widget-title">
                            <h4>לקוחות <i class="icon-reorder"></i></h4>
                            <div class="tools" style="float: left">
                                <a href="javascript:;" class="icon-chevron-down"></a>
                            </div>
                        </div>
                        <div class="widget-body">
                            <div class="control-group ">
                                <div class="controls">
                                    <asp:DropDownList ID="DDLfilter" runat="server" CssClass="span4" AutoPostBack="true" OnSelectedIndexChanged="DDLfilter_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Value="0">כל הלקוחות</asp:ListItem>
                                        <asp:ListItem Value="1">לקוחות קבועים</asp:ListItem>
                                        <asp:ListItem Value="2">לקוחות מזדמנים</asp:ListItem>
                                        <asp:ListItem Value="3">לקוחות לא פעילים</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <asp:SqlDataSource ID="dsClient" runat="server" ConnectionString="<%$ ConnectionStrings:ookDBConnectionString %>" DeleteCommand="DELETE FROM [Client] WHERE [clientID] = @clientID" InsertCommand="INSERT INTO [Client] ([clientID], [clientName], [contactName], [phoneNumber], [email], [status], [marketer]) VALUES (@clientID, @clientName, @contactName, @phoneNumber, @email, @status, @marketer)" SelectCommand="SELECT * FROM [Client]" UpdateCommand="UPDATE [Client] SET [clientName] = @clientName, [contactName] = @contactName, [phoneNumber] = @phoneNumber, [email] = @email, [status] = @status, [marketer] = @marketer WHERE [clientID] = @clientID"></asp:SqlDataSource>
                            <asp:GridView ID="gvClient" runat="server" CssClass="table table-striped table-bordered table-advance table-hover" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="clientID" DataSourceID="dsClient" >
                                <Columns>
                                    <asp:BoundField DataField="marketer" HeaderText="marketer" SortExpression="marketer" Visible="false" />
                                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" Visible="false" />
                                    <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                    <asp:BoundField DataField="phoneNumber" HeaderText="טלפון" SortExpression="phoneNumber" />
                                    <asp:BoundField DataField="contactName" HeaderText="שם איש קשר" SortExpression="contactName" />
                                    <asp:BoundField DataField="clientName" HeaderText="שם לקוח" SortExpression="clientName" />
                                    <asp:BoundField DataField="clientID" HeaderText="מספר לקוח" ReadOnly="True" SortExpression="clientID" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="dsConstant" runat="server" ConnectionString="<%$ ConnectionStrings:ookDBConnectionString %>" SelectCommand="SELECT * FROM [Client] WHERE ([status] = @status) ORDER BY [clientID]">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="status" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="gvConstant" runat="server" CssClass="table table-striped table-bordered table-advance table-hover" AllowPaging="True" AllowSorting="True"  AutoGenerateColumns="False" DataKeyNames="clientID" DataSourceID="dsConstant" >
                                <Columns>
                                    <asp:BoundField DataField="marketer" HeaderText="marketer" SortExpression="marketer" Visible="false" />
                                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" Visible="false" />
                                    <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                    <asp:BoundField DataField="phoneNumber" HeaderText="טלפון" SortExpression="phoneNumber" />
                                    <asp:BoundField DataField="contactName" HeaderText="שם איש קשר" SortExpression="contactName" />
                                    <asp:BoundField DataField="clientName" HeaderText="שם לקוח" SortExpression="clientName" />
                                    <asp:BoundField DataField="clientID" HeaderText="מספר לקוח" ReadOnly="True" SortExpression="clientID" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="dsNoActive" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ookDBConnectionString %>" DeleteCommand="DELETE FROM [Client] WHERE [clientID] = @original_clientID AND [clientName] = @original_clientName AND (([contactName] = @original_contactName) OR ([contactName] IS NULL AND @original_contactName IS NULL)) AND (([phoneNumber] = @original_phoneNumber) OR ([phoneNumber] IS NULL AND @original_phoneNumber IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [status] = @original_status AND (([marketer] = @original_marketer) OR ([marketer] IS NULL AND @original_marketer IS NULL))" InsertCommand="INSERT INTO [Client] ([clientID], [clientName], [contactName], [phoneNumber], [email], [status], [marketer]) VALUES (@clientID, @clientName, @contactName, @phoneNumber, @email, @status, @marketer)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Client] WHERE ([status] = @status) ORDER BY [clientID]" UpdateCommand="UPDATE [Client] SET [clientName] = @clientName, [contactName] = @contactName, [phoneNumber] = @phoneNumber, [email] = @email, [status] = @status, [marketer] = @marketer WHERE [clientID] = @original_clientID AND [clientName] = @original_clientName AND (([contactName] = @original_contactName) OR ([contactName] IS NULL AND @original_contactName IS NULL)) AND (([phoneNumber] = @original_phoneNumber) OR ([phoneNumber] IS NULL AND @original_phoneNumber IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [status] = @original_status AND (([marketer] = @original_marketer) OR ([marketer] IS NULL AND @original_marketer IS NULL))">
                                <%--   <DeleteParameters>
                                    <asp:Parameter Name="original_clientID" Type="String" />
                                    <asp:Parameter Name="original_clientName" Type="String" />
                                    <asp:Parameter Name="original_contactName" Type="String" />
                                    <asp:Parameter Name="original_phoneNumber" Type="String" />
                                    <asp:Parameter Name="original_email" Type="String" />
                                    <asp:Parameter Name="original_status" Type="Int32" />
                                    <asp:Parameter Name="original_marketer" Type="Int16" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="clientID" Type="String" />
                                    <asp:Parameter Name="clientName" Type="String" />
                                    <asp:Parameter Name="contactName" Type="String" />
                                    <asp:Parameter Name="phoneNumber" Type="String" />
                                    <asp:Parameter Name="email" Type="String" />
                                    <asp:Parameter Name="status" Type="Int32" />
                                    <asp:Parameter Name="marketer" Type="Int16" />
                                </InsertParameters>--%>
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="2" Name="status" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="clientName" Type="String" />
                                    <asp:Parameter Name="contactName" Type="String" />
                                    <asp:Parameter Name="phoneNumber" Type="String" />
                                    <asp:Parameter Name="email" Type="String" />
                                    <asp:Parameter Name="status" Type="Int32" />
                                    <asp:Parameter Name="marketer" Type="Int16" />
                                    <asp:Parameter Name="original_clientID" Type="String" />
                                    <asp:Parameter Name="original_clientName" Type="String" />
                                    <asp:Parameter Name="original_contactName" Type="String" />
                                    <asp:Parameter Name="original_phoneNumber" Type="String" />
                                    <asp:Parameter Name="original_email" Type="String" />
                                    <asp:Parameter Name="original_status" Type="Int32" />
                                    <asp:Parameter Name="original_marketer" Type="Int16" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="gvNoActive" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="clientID" DataSourceID="dsNoActive"  CssClass="table table-striped table-bordered table-advance table-hover">
                                <Columns>
                                    <asp:BoundField DataField="marketer" HeaderText="marketer" SortExpression="marketer" Visible="false" />
                                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" Visible="false" />
                                    <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                    <asp:BoundField DataField="phoneNumber" HeaderText="טלפון" SortExpression="phoneNumber" />
                                    <asp:BoundField DataField="contactName" HeaderText="שם איש קשר" SortExpression="contactName" />
                                    <asp:BoundField DataField="clientName" HeaderText="שם לקוח" SortExpression="clientName" />
                                    <asp:BoundField DataField="clientID" HeaderText="מספר לקוח" ReadOnly="True" SortExpression="clientID" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="dsStatus0" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ookDBConnectionString %>" DeleteCommand="DELETE FROM [Client] WHERE [clientID] = @original_clientID AND [clientName] = @original_clientName AND (([contactName] = @original_contactName) OR ([contactName] IS NULL AND @original_contactName IS NULL)) AND (([phoneNumber] = @original_phoneNumber) OR ([phoneNumber] IS NULL AND @original_phoneNumber IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [status] = @original_status AND (([marketer] = @original_marketer) OR ([marketer] IS NULL AND @original_marketer IS NULL))" InsertCommand="INSERT INTO [Client] ([clientID], [clientName], [contactName], [phoneNumber], [email], [status], [marketer]) VALUES (@clientID, @clientName, @contactName, @phoneNumber, @email, @status, @marketer)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Client] WHERE ([status] = @status) ORDER BY [clientID]" UpdateCommand="UPDATE [Client] SET [clientName] = @clientName, [contactName] = @contactName, [phoneNumber] = @phoneNumber, [email] = @email, [status] = @status, [marketer] = @marketer WHERE [clientID] = @original_clientID AND [clientName] = @original_clientName AND (([contactName] = @original_contactName) OR ([contactName] IS NULL AND @original_contactName IS NULL)) AND (([phoneNumber] = @original_phoneNumber) OR ([phoneNumber] IS NULL AND @original_phoneNumber IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [status] = @original_status AND (([marketer] = @original_marketer) OR ([marketer] IS NULL AND @original_marketer IS NULL))">
                                <%--  <DeleteParameters>
                                    <asp:Parameter Name="original_clientID" Type="String" />
                                    <asp:Parameter Name="original_clientName" Type="String" />
                                    <asp:Parameter Name="original_contactName" Type="String" />
                                    <asp:Parameter Name="original_phoneNumber" Type="String" />
                                    <asp:Parameter Name="original_email" Type="String" />
                                    <asp:Parameter Name="original_status" Type="Int32" />
                                    <asp:Parameter Name="original_marketer" Type="Int16" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="clientID" Type="String" />
                                    <asp:Parameter Name="clientName" Type="String" />
                                    <asp:Parameter Name="contactName" Type="String" />
                                    <asp:Parameter Name="phoneNumber" Type="String" />
                                    <asp:Parameter Name="email" Type="String" />
                                    <asp:Parameter Name="status" Type="Int32" />
                                    <asp:Parameter Name="marketer" Type="Int16" />
                                </InsertParameters>--%>
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="status" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="clientName" Type="String" />
                                    <asp:Parameter Name="contactName" Type="String" />
                                    <asp:Parameter Name="phoneNumber" Type="String" />
                                    <asp:Parameter Name="email" Type="String" />
                                    <asp:Parameter Name="status" Type="Int32" />
                                    <asp:Parameter Name="marketer" Type="Int16" />
                                    <asp:Parameter Name="original_clientID" Type="String" />
                                    <asp:Parameter Name="original_clientName" Type="String" />
                                    <asp:Parameter Name="original_contactName" Type="String" />
                                    <asp:Parameter Name="original_phoneNumber" Type="String" />
                                    <asp:Parameter Name="original_email" Type="String" />
                                    <asp:Parameter Name="original_status" Type="Int32" />
                                    <asp:Parameter Name="original_marketer" Type="Int16" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="gvStatus0" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="clientID" DataSourceID="dsStatus0"  CssClass="table table-striped table-bordered table-advance table-hover" >
                                <Columns>
                                    <asp:BoundField DataField="marketer" HeaderText="marketer" SortExpression="marketer" Visible="false" />
                                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" Visible="false" />
                                    <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                    <asp:BoundField DataField="phoneNumber" HeaderText="טלפון" SortExpression="phoneNumber" />
                                    <asp:BoundField DataField="contactName" HeaderText="שם איש קשר" SortExpression="contactName" />
                                    <asp:BoundField DataField="clientName" HeaderText="שם לקוח" SortExpression="clientName" />
                                    <asp:BoundField DataField="clientID" HeaderText="מספר לקוח" ReadOnly="True" SortExpression="clientID" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="delete" runat="server" OnClick="delet">הפוך ללא פעיל</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTENT-->

        </div>
        <!-- END PAGE CONTAINER-->
    </div>
    <!-- END PAGE -->
    <div id="dialogMessageClient" title="אישור"></div>
    <div id="dialogDeleteMessageClient" title="אישור"></div>
    <asp:Button ID="hiddenSubmitDelete" runat="server" Text="Button" Style="display: none" OnClick="delete_Click" />

    <asp:Label ID="id1" runat="server" Text=""></asp:Label>

</asp:Content>

