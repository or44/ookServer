<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageTechnolog.master" AutoEventWireup="true" CodeFile="clientsTechnolog.aspx.cs" Inherits="clientsTechnolog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                    <h3 class="page-title">לקוחות 
                    </h3>

                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <hr />


            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- begin client table-->
                    <div>
                        <div>
                        <asp:DropDownList ID="DDLfilter" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="DDLfilter_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="0">כל הלקוחות</asp:ListItem>
                         <asp:ListItem  Value="1">לקוחות קבועים</asp:ListItem>
                        <asp:ListItem value="2">לקוחות מזדמנים</asp:ListItem>
                        <asp:ListItem Value="3">לקוחות לא פעילים</asp:ListItem>
                    </asp:DropDownList>
                        </div>
                        <div class="space15">
                            <asp:SqlDataSource ID="dsClient" runat="server" ConnectionString="<%$ ConnectionStrings:ookDBConnectionString %>" DeleteCommand="DELETE FROM [Client] WHERE [clientID] = @clientID" InsertCommand="INSERT INTO [Client] ([clientID], [clientName], [contactName], [phoneNumber], [email], [status], [marketer]) VALUES (@clientID, @clientName, @contactName, @phoneNumber, @email, @status, @marketer)" SelectCommand="SELECT * FROM [Client]" UpdateCommand="UPDATE [Client] SET [clientName] = @clientName, [contactName] = @contactName, [phoneNumber] = @phoneNumber, [email] = @email, [status] = @status, [marketer] = @marketer WHERE [clientID] = @clientID">
      
                            </asp:SqlDataSource>
                            <br />
                          
                            <asp:GridView ID="gvClient" runat="server" CssClass="table table-striped table-bordered table-advance table-hover" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="clientID" DataSourceID="dsClient" PageSize="20" Height="795px">
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


                            <asp:GridView ID="gvConstant" runat="server" CssClass="table table-striped table-bordered table-advance table-hover" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="clientID" DataSourceID="dsConstant" PageSize="20" Height="795px">
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

                            <asp:GridView ID="gvNoActive" runat="server"  AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="clientID" DataSourceID="dsNoActive" Height="795px" Width="172px" CssClass="table table-striped table-bordered table-advance table-hover" >
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

                        </div>

                    </div>


                    <asp:GridView ID="gvStatus0" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="clientID" DataSourceID="dsStatus0" Height="130px" Width="172px" CssClass="table table-striped table-bordered table-advance table-hover" PageSize="20">
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

                </div>
                <div id="dialogMessageClient" title="אישור"></div>
                <div id="dialogDeleteMessageClient" title="אישור"></div>
            </div>



        </div>


    </div>
    <!-- END PAGE CONTENT-->
    <!-- end client table-->
   
 
        <!-- END PAGE CONTAINER-->
  
    <!-- END PAGE -->
</asp:Content>
