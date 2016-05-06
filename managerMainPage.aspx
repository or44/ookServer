<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageManager.master" AutoEventWireup="true" CodeFile="managerMainPage.aspx.cs" Inherits="managerMainPage" %>

<asp:Content ID="MMPContent1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
</asp:Content>
<asp:Content ID="MMPContent2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

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
                            <div class="info" id="DivManagerCountAgent" runat="server"></div>
                            <div class="status">הצעות שמורות</div>
                        </a>
                    </div>
                    <div class="metro-nav-block nav-olive">
                        <a data-original-title="" href="#">
                            <i class="icon-tags"></i>
                            <div class="info" id="DivManagerCountTec" runat="server"></div>
                            <div class="status">הצעות טכנולוג</div>
                        </a>
                    </div>
                    <div class="metro-nav-block nav-block-yellow">
                        <a data-original-title="" href="#">
                            <i class="icon-comments-alt"></i>
                            <div class="info" id="DivManagerCountAnalyst" runat="server"></div>
                            <div class="status">הצעות אנליסט </div>
                        </a>
                    </div>
                    <div class="metro-nav-block nav-block-green double">
                        <a data-original-title="" href="#">
                            <i class="icon-eye-open"></i>
                            <div class="info" id="DivManagerCountApproved" runat="server"></div>
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
                        

                        <!-- BEGIN PAGE CONTAINER-->
         <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->   
            <div class="row-fluid">
               <div class="span12">
                   <!-- BEGIN THEME CUSTOMIZER-->
                   <div id="theme-change" class="hidden-phone">
                       <i class="icon-cogs"></i>
                        <span class="settings">
                            <span class="text">Theme Color:</span>
                            <span class="colors">
                                <span class="color-default" data-style="default"></span>
                                <span class="color-green" data-style="green"></span>
                                <span class="color-gray" data-style="gray"></span>
                                <span class="color-purple" data-style="purple"></span>
                                <span class="color-red" data-style="red"></span>
                            </span>
                        </span>
                   </div>
                   <!-- END THEME CUSTOMIZER-->
               </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->

            <div id="page-wraper">
                <div class="row-fluid">
                    <div class="span6">
                        <!-- BEGIN CHART PORTLET-->
                        <div class="widget green">
                            <div class="widget-title">
                                <h4><i class="icon-reorder"></i> Doughnut</h4>
                            <span class="tools">
                                <a href="javascript:;" class="icon-chevron-down"></a>
                            </span>
                            </div>
                            <div class="widget-body-manager">
                                <div class="text-center">
                                    <canvas id="doughnutManager" height="300" width="400"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- END CHART PORTLET-->
                    </div>
                    <div class="span6">
                        <!-- BEGIN CHART PORTLET-->
                        <div class="widget orange">
                            <div class="widget-title">
                                <h4><i class="icon-reorder"> </i> Line</h4>
                            <span class="tools">
                                <a href="javascript:;" class="icon-chevron-down"></a>
                            </span>
                            </div>
                            <div class="widget-body-manager">
                                <div class="text-center">
                                    <canvas id="line" height="300" width="450"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- END CHART PORTLET-->
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span6">
                        <!-- BEGIN CHART PORTLET-->
                        <div class="widget purple">
                            <div class="widget-title">
                                <h4><i class="icon-reorder"></i> PolarArea</h4>
                            <span class="tools">
                                <a href="javascript:;" class="icon-chevron-down"></a>
                            </span>
                            </div>
                            <div class="widget-body-manager">
                                <div class="text-center">
                                    <canvas id="polarArea" height="300" width="400"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- END CHART PORTLET-->
                    </div>
                    <div class="span6">
                        <!-- BEGIN CHART PORTLET-->
                        <div class="widget blue">
                            <div class="widget-title">
                                <h4><i class="icon-reorder"></i> Bar</h4>
                            <span class="tools">
                                <a href="javascript:;" class="icon-chevron-down"></a>
                            </span>
                            </div>
                            <div class="widget-body-manager">
                                <div class="text-center">
                                    <canvas id="bar" height="300" width="500"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- END CHART PORTLET-->
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span6">
                        <!-- BEGIN CHART PORTLET-->
                        <div class="widget">
                            <div class="widget-title">
                                <h4><i class="icon-reorder"></i> Pie</h4>
                            <span class="tools">
                                <a href="javascript:;" class="icon-chevron-down"></a>
                            </span>
                            </div>
                            <div class="widget-body-manager">
                                <div class="text-center">
                                    <canvas id="pie" height="300" width="400"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- END CHART PORTLET-->
                    </div>
                    <div class="span6">
                        <!-- BEGIN CHART PORTLET-->
                        <div class="widget yellow">
                            <div class="widget-title">
                                <h4><i class="icon-reorder"></i> Radar</h4>
                            <span class="tools">
                                <a href="javascript:;" class="icon-chevron-down"></a>
                            </span>
                            </div>
                            <div class="widget-body-manager">
                                <div class="text-center">
                                    <canvas id="radar" height="300" width="400"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- END CHART PORTLET-->
                    </div>
                </div>
            </div>

            <!-- END PAGE CONTENT-->         
         </div>
         <!-- END PAGE CONTAINER-->
      </div>
      <!-- END PAGE -->  
                        
                    
                    </div>
                </div>
            </div>

        </div>
        <!-- END PAGE CONTAINER-->
    <!-- END PAGE -->
</asp:Content>










