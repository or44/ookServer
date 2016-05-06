<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAgent.master" AutoEventWireup="true" CodeFile="allBids.aspx.cs" Inherits="allBids" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                    <h3 class="page-title"> הצעות 
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
                            <h4>הצעות פתוחות <i class="icon-reorder"></i></h4>
                            <div class="tools" style="float: left">
                                <a href="javascript:;" class="icon-chevron-down"></a>
                            </div>
                        </div>
                        <div class="widget-body">
                       <asp:SqlDataSource ID="dsBid" runat="server" ConnectionString="<%$ ConnectionStrings:ookDBConnectionString %>" SelectCommand="SELECT [bidID], [clientID], [status], [productName], [productType], [openingDate] FROM [Bid]  ORDER BY [bidID]">
                
            </asp:SqlDataSource>
            <asp:GridView ID="gvBid" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-advance table-hover" DataKeyNames="bidID" DataSourceID="dsBid">
                <Columns>
                    <asp:BoundField DataField="bidID" HeaderText="מספר הצעה" InsertVisible="False" ReadOnly="True" SortExpression="bidID" />
                    <asp:BoundField DataField="clientID" HeaderText="מספר לקוח" SortExpression="clientID" />
                    <asp:BoundField DataField="status" HeaderText="סטאטוס הצעה" SortExpression="status" />
                    <asp:BoundField DataField="productName" HeaderText="שם מוצר" SortExpression="productName" />
                    <asp:BoundField DataField="productType" HeaderText="סוג מוצר" SortExpression="productType" />
                    <asp:BoundField DataField="openingDate" HeaderText="תאריך פתיחה" SortExpression="openingDate" />
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
</asp:Content>

