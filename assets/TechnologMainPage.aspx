<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageTechnolog.master" AutoEventWireup="true" CodeFile="TechnologMainPage.aspx.cs" Inherits="TechnologMainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- BEGIN PAGE -->
    <div id="main-content">
        <!-- BEGIN PAGE CONTAINER-->
        <br />
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">ראשי 
                    </h3>

                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <hr />
            <!-- END PAGE HEADER-->
            <!--BEGIN PAGE CONTAINER-->
            <br />
       
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




                            <asp:SqlDataSource ID="SqlDataSourceopenBigs" runat="server" ConnectionString="<%$ ConnectionStrings:ookDBConnectionString %>" SelectCommand="select b.bidID,b.status,b.productName,c.clientName from Bid b inner join Client c on b.clientID=c.clientID"></asp:SqlDataSource>




                            <asp:GridView ID="openBigs" runat="server" CssClass="table table-striped table-bordered table-advance table-hover" DataSourceID="SqlDataSourceopenBigs">
                            </asp:GridView>


                        </div>
                    
                    </div>
                </div>
            </div>

        </div>
        <!-- END PAGE CONTAINER-->
    </div>
    <!-- END PAGE -->
</asp:Content>

