<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAgent.master" AutoEventWireup="true" CodeFile="agentMainPage.aspx.cs" Inherits="agentMainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            <div class="row-fluid">
                <!--BEGIN METRO STATES-->
                <div class="metro-nav">
                    <div id="agentOpenBids" class="metro-nav-block nav-block-orange">
                        <a data-original-title="" href="#">
                            <i class="icon-user"></i>
                            <div class="info" id="DivCountAgent" runat="server"></div>
                            <div class="status">הצעות שמורות</div>
                        </a>
                    </div>
                    <div class="metro-nav-block nav-olive">
                        <a data-original-title="" href="#">
                            <i class="icon-tags"></i>
                            <div class="info" id="DivCountTec" runat="server"></div>
                            <div class="status">הצעות טכנולוג</div>
                        </a>
                    </div>
                    <div class="metro-nav-block nav-block-yellow">
                        <a data-original-title="" href="#">
                            <i class="icon-comments-alt"></i>
                            <div class="info" id="DivCountAnalyst" runat="server"></div>
                            <div class="status">הצעות אנליסט </div>
                        </a>
                    </div>
                    <div class="metro-nav-block nav-block-green double">
                        <a data-original-title="" href="#">
                            <i class="icon-eye-open"></i>
                            <div class="info" id="DivCountApproved" runat="server"></div>
                            <div class="status">הצעות מאושרות</div>
                        </a>
                    </div>
                    <div class="metro-nav-block nav-block-red">
                        <a data-original-title="" href="#">
                            <i class="icon-bar-chart"></i>
                            <div class="info">+288</div>
                            <div class="status">Update</div>
                        </a>
                    </div>
                </div>
                <div class="space10"></div>
                <!--END METRO STATES-->
            </div>
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

