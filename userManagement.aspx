<%@ Page Title="" Language="C#" MasterPageFile="~/MPforAddClient.master" AutoEventWireup="true" CodeFile="userManagement.aspx.cs" Inherits="userManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main-content">
        <!-- BEGIN PAGE CONTAINER-->
        <br>
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">

                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">ניהול משתמשים  
                    </h3>

                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <hr />
            <!-- END PAGE HEADER-->
            <br />
            <div class="clearfix">
                <div class="btn-group pull-right">
                    <button id="AddNewUser" class="btn green">
                        הוסף משתמש 
                        <i class="icon-plus"></i>
                    </button>
                </div>
            </div>
            <br />
            <div id="AddUser" runat="server" class="row-fluid">
                <div class="span10 offset2">
                    <div class="widget orange">
                        <div class="widget-title">
                            <h4>משתמש חדש <i class="icon-reorder"></i></h4>
                        </div>
                        <div class="widget-body form">

                            <!-- BEGIN FORM-->

                            <div class="cmxform form-horizontal">
                                <br />
                                <div class="control-group ">
                                    <asp:Label ID="nameLabel" runat="server" CssClass="control-label "> : שם פרטי </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="firstnameuser" runat="server" CssClass="span6"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <asp:RequiredFieldValidator ID="RFVfnu" ControlToValidate="firstnameuser" runat="server" ErrorMessage="חייב להזין שם פרטי " CssClass="span6 offset6" ValidationGroup="userValid"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="control-group ">
                                    <asp:Label ID="lastNameLabel" runat="server" CssClass="control-label "> : שם משפחה  </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="lastnameuser" CssClass="span6" runat="server"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <asp:RequiredFieldValidator ID="RFVlnu" ControlToValidate="lastnameuser" runat="server" CssClass="span6 offset6" ErrorMessage="הזן שם משפחה" ValidationGroup="userValid"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <div class="control-group ">
                                    <asp:Label ID="telphoneLabel" runat="server" CssClass="control-label" Text="פלאפון"> : מספר פלאפון  </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="phonenumberuser" CssClass="span6" runat="server"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <asp:RequiredFieldValidator ID="RFVpnu" CssClass="span6 offset6" ControlToValidate="phonenumberuser" runat="server" ErrorMessage="הזן מספר טלפון" ValidationGroup="userValid"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <asp:RegularExpressionValidator ID="REVpn" runat="server" CssClass="span6 offset6" ValidationExpression="^[0-9]{10}$" ErrorMessage="מספר לא תקין" ControlToValidate="phonenumberuser" ValidationGroup="userValid"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <br />
                                <div class="control-group ">
                                    <asp:Label ID="mailLabel" runat="server" CssClass="control-label" Text="אימייל"> : Email   </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="emailuser" CssClass="span6" runat="server"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <asp:RequiredFieldValidator ID="RFVeu" CssClass="span6 offset6" ControlToValidate="emailuser" runat="server" ErrorMessage="הזן כתובת מייל" ValidationGroup="userValid"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="userValid" ControlToValidate="emailuser" CssClass="span6 offset6" ErrorMessage="הכנס מייל תקין "></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <br />
                                <div class="control-group">
                                    <asp:Label ID="Label1" runat="server" CssClass="control-label "> : הרשאה </asp:Label>
                                    <div class="controls">
                                        <asp:DropDownList ID="DDLpermission" runat="server" CssClass="span4">
                                            <asp:ListItem Value="1" Text="משווק" Selected="True">משווק</asp:ListItem>
                                            <asp:ListItem Value="2" Text="טכנולוג">טכנולוג</asp:ListItem>
                                            <asp:ListItem Value="3" Text="אנליסט">אנליסט</asp:ListItem>
                                            <asp:ListItem Value="4" Text="מנהל-מכירות">מנהל-מכירות</asp:ListItem>
                                            <asp:ListItem Value="5" Text="הנהלה">הנהלה</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <asp:RequiredFieldValidator ID="RPVp" runat="server" ControlToValidate="DDLpermission" CssClass="span6 offset6" ErrorMessage="בחר סוג הרשאה" ValidationGroup="userValid"></asp:RequiredFieldValidator>

                                    </div>
                                </div>


                                <div class="form-actions">
                                    <asp:Button ID="userSubmit" CssClass="btn btn-large btn-danger" runat="server" Text="שמור" OnClick="Saveuser_Click" ValidationGroup="userValid" />

                                </div>
                                <div id="dialogMessageClient" title="אישור" onclick="SaveClientClick"></div>
                                <div id="dialogDeleteMessageClient" title="אישור" onclick="SaveClientClick"></div>
                                <div id="dialogInsertMessageClient" title="אישור"></div>
                                <br />
                            </div>
                            <!-- END FORM-->
                        </div>
                    </div>
                </div>
            </div>



            <!-- BEGIN EDITABLE TABLE widget-->
             <div class="row-fluid">
                 <div class="span12">
                     <!-- BEGIN EXAMPLE TABLE widget-->
                    <div class="widget white-full">
                         <div class="widget-title">
                          <h4> משתמשים <i class="icon-reorder"></i></h4>
                            <div class="tools" style="float: left">
                                <a href="javascript:;" class="icon-chevron-down"></a>
                            </div>
                         </div>
                         <div class="widget-body">
                                


                             </div>
                         </div>
                     </div>
                 </div>

   <!-- BEGIN EDITABLE TABLE widget-->
             <div class="row-fluid">
                 <div class="span12">
                     <!-- BEGIN EXAMPLE TABLE widget-->
                     <div class="widget purple">
                         <div class="widget-title">
                             <h4><i class="icon-reorder"></i> Editable Table</h4>
                            <span class="tools">
                                <a href="javascript:;" class="icon-chevron-down"></a>
                                <a href="javascript:;" class="icon-remove"></a>
                            </span>
                         </div>
                         <div class="widget-body">
                             <div>
                                 <div class="clearfix">
                                     <div class="btn-group">
                                         <button id="editable-sample_new" class="btn green">
                                             Add New <i class="icon-plus"></i>
                                         </button>
                                     </div>
                                     <div class="btn-group pull-right">
                                         <button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i class="icon-angle-down"></i>
                                         </button>
                                         <ul class="dropdown-menu pull-right">
                                             <li><a href="#">Print</a></li>
                                             <li><a href="#">Save as PDF</a></li>
                                             <li><a href="#">Export to Excel</a></li>
                                         </ul>
                                     </div>
                                 </div>
                                 <div class="space15"></div>
                                 <table class="table table-striped table-hover table-bordered" id="editable-sample">
                                     <thead>
                                     <tr>
                                         <th>Username</th>
                                         <th>Full Name</th>
                                         <th>Points</th>
                                         <th>Notes</th>
                                         <th>Edit</th>
                                         <th>Delete</th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <tr class="">
                                         <td>Jondi Rose</td>
                                         <td>Alfred Jondi Rose</td>
                                         <td>1234</td>
                                         <td class="center">super user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     <tr class="">
                                         <td>Dulal</td>
                                         <td>Jonathan Smith</td>
                                         <td>434</td>
                                         <td class="center">new user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     <tr class="">
                                         <td>Sumon</td>
                                         <td> Sumon Ahmed</td>
                                         <td>232</td>
                                         <td class="center">super user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     <tr class="">
                                         <td>vectorlab</td>
                                         <td>dk mosa</td>
                                         <td>132</td>
                                         <td class="center">elite user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     <tr class="">
                                         <td>Admin</td>
                                         <td> Admin lab</td>
                                         <td>462</td>
                                         <td class="center">new user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     <tr class="">
                                         <td>Rafiqul</td>
                                         <td>Rafiqul dulal</td>
                                         <td>62</td>
                                         <td class="center">new user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     <tr class="">
                                         <td>Jhon Doe</td>
                                         <td>Jhon Doe </td>
                                         <td>1234</td>
                                         <td class="center">super user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     <tr class="">
                                         <td>Dulal</td>
                                         <td>Jonathan Smith</td>
                                         <td>434</td>
                                         <td class="center">new user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     <tr class="">
                                         <td>Sumon</td>
                                         <td> Sumon Ahmed</td>
                                         <td>232</td>
                                         <td class="center">super user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     <tr class="">
                                         <td>vectorlab</td>
                                         <td>dk mosa</td>
                                         <td>132</td>
                                         <td class="center">elite user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     <tr class="">
                                         <td>Admin</td>
                                         <td> Admin lab</td>
                                         <td>462</td>
                                         <td class="center">new user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     <tr class="">
                                         <td>Rafiqul</td>
                                         <td>Rafiqul dulal</td>
                                         <td>62</td>
                                         <td class="center">new user</td>
                                         <td><a class="edit" href="javascript:;">Edit</a></td>
                                         <td><a class="delete" href="javascript:;">Delete</a></td>
                                     </tr>
                                     </tbody>
                                 </table>
                             </div>
                         </div>
                     </div>
                     <!-- END EXAMPLE TABLE widget-->
                 </div>
             </div>
         
        </div>
        <!-- END PAGE CONTAINER-->
    </div>
    <!-- END PAGE -->


</asp:Content>

