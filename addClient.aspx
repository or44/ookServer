<%@ Page Title="" Language="C#" MasterPageFile="~/MPforAddClient.master" AutoEventWireup="true" CodeFile="addClient.aspx.cs" Inherits="addClinet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="js/client.js"></script>
    <script type="text/javascript">

        
        function ShowNewClient(str) {
            $(function () {
                $("#dialogMessageClient").text(str); // open the dialog
                $("#dialogMessageClient").dialog({
                    modal: true,
                    title: " הכנסת לקוח חדש",
                    buttons: {                                  // define the buttons and their behavior
                        אישור: function () {
                            $("[id*=hiddenSubmitInsert]").click(); // click to create a postback
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



        function ShowDeleteClient(str) {
            $(function () {
                $("#dialogDeleteMessageClient").text(str); // open the dialog
                $("#dialogDeleteMessageClient").dialog({
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




        function ShowClient(str) {
            $(function () {
                $("#dialogInsertMessageClient").text(str); // open the dialog
                $("#dialogInsertMessageClient").dialog({
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
                    <h3 class="page-title">לקוח חדש 
                    </h3>

                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <hr />
            <!-- END PAGE HEADER-->
            <br />
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN VALIDATION STATES-->
                    <div class="widget orange">
                        <div class="widget-title">
                            <h4>הוסף לקוח <i class="icon-reorder"></i></h4>
                        </div>
                        <div class="widget-body form">
                            
                            <!-- BEGIN FORM-->

                            <div class="cmxform form-horizontal">
                                <br />
                                <div class="control-group ">
                                    <asp:Label ID="nameLabel" runat="server" CssClass="control-label ">שם הלקוח  </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TBname" runat="server" CssClass="span6"></asp:TextBox>
                                    </div>
                                    <div class="controls">
                                        <asp:RequiredFieldValidator ID="RFVname" ControlToValidate="TBname" runat="server" ValidationGroup="clientValid" CssClass="span6" ErrorMessage="חובה להזין שם"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="control-group">
                                    <asp:Label ID="contactNameLabel" runat="server" CssClass="control-label">שם איש קשר   </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TBContactName" runat="server" CssClass="span6"></asp:TextBox>
                                    </div>
                                    <div class="controls">
                                        <asp:RequiredFieldValidator ID="RFVContactName" runat="server" ControlToValidate="TBContactName" ValidationGroup="clientValid" CssClass="span6" ErrorMessage="חובה להזין איש קשר"></asp:RequiredFieldValidator>
                                    </div>

                                </div>
                                <br />
                                <div class="control-group">
                                    <asp:Label ID="telphoneLabel" runat="server" CssClass="control-label" Text="פלאפון">מספר פלאפון  </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TBphoneNumber" runat="server" CssClass="span6"></asp:TextBox>
                                    </div>
                                    <div class="controls">
                                        <asp:RegularExpressionValidator ID="REVPhoneNumber" runat="server" ErrorMessage="הכנס מספר תקין " ValidationGroup="clientValid" ControlToValidate="TBphoneNumber" CssClass="span4" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                                        <div class="controls">
                                            <asp:RequiredFieldValidator ID="RFVTBphone" runat="server" ErrorMessage="חובה להכניס מספר טלפון " ValidationGroup="clientValid" ControlToValidate="TBphoneNumber" CssClass="span4"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <div class="control-group">
                                    <asp:Label ID="mailLabel" runat="server" CssClass="control-label" Text="אימייל">Email   </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TBemail" runat="server" CssClass="span6"></asp:TextBox>
                                    </div>
                                    <div class="controls">
                                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="clientValid" ControlToValidate="TBemail" CssClass="span4" ErrorMessage="הכנס מייל תקין "></asp:RegularExpressionValidator>
                                        <div class="controls">
                                            <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ControlToValidate="TBemail" ErrorMessage="חובה להזין מייל " CssClass="span4" ValidationGroup="clientValid"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="form-actions">
                                    <asp:Button ID="submit" runat="server" Text="שמור" CssClass="btn btn-large btn-danger" OnClick="SaveClientClick" ValidationGroup="clientValid" />
                                </div>
                                <div id="dialogMessageClient" title="אישור" onclick="SaveClientClick"></div>
                                <div id="dialogDeleteMessageClient" title="אישור" onclick="SaveClientClick"></div>
                                <div id="dialogInsertMessageClient" title="אישור"></div>
                                <br />
                            </div>
                            <!-- END FORM-->
                        </div>
                    </div>
                    <!-- END VALIDATION STATES-->
                </div>
            </div>

        </div>
        <!-- END PAGE CONTAINER-->
    </div>
    <!-- END PAGE -->
    <asp:Button ID="cancel" runat="server" Text="Button" Style="display: none" />
    <asp:Button ID="hiddenSubmitInsert" runat="server" Text="Button" Style="display: none" OnClick="hiddenSubmitInsertClick" />
    <asp:Label ID="clientNumber" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>

