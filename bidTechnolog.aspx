<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageTechnolog.master" AutoEventWireup="true" CodeFile="bidTechnolog.aspx.cs" Inherits="bidTechnolog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/AjaxCall.js"></script>
    <script src="js/bid-form-marketer.js"></script>
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
                    <h3 class="page-title">פרטי הצעה
                    </h3>

                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <hr />
            <!-- END PAGE HEADER-->
            <br />
            <!-- BEGIN BODY -->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN VALIDATION STATES-->
                    <div class="widget orange">
                        <div class="widget-title">
                            <h4>פרטי הצעה <i class="icon-reorder"></i></h4>
                        </div>
                        <div class="widget-body form">
                            <div class="tools">
                                <a href="javascript:;" class="collapse"></a>
                                <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                <a href="javascript:;" class="reload"></a>
                            </div>
                            <!-- BEGIN BODY -->


                            <div class="cmxform form-horizontal">
                                <br />
                                <!-------------------------------------------- בחירת לקוח -------------------------------------------------------------------->

                                <div class="control-group ">
                                    <asp:Label ID="nameLabel" runat="server" CssClass="control-label ">שם הלקוח  </asp:Label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlclients" runat="server" CssClass="span4"></asp:DropDownList>
                                    </div>
                                    <div class="controls">
                                        <asp:RequiredFieldValidator ID="rfvClient" runat="server" CssClass="span4" ControlToValidate="ddlclients" ErrorMessage="יש לבחור לקוח"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <!--------------------------------------------  סיום בחירת לקוח -------------------------------------------------------------------->

                                 <!----------------------------------------- בחירת שם מוצר  -------------------------------------------------------------------------->

                                <div class="control-group">
                                    <asp:Label ID="productName" runat="server" CssClass="control-label" Text="שם המוצר"> שם המוצר </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TBproductName" runat="server" class="span4"></asp:TextBox>

                                    </div>
                                    <div class="controls">
                                        <asp:RequiredFieldValidator ID="RFVproductName" ControlToValidate="TBproductName" runat="server" CssClass="span4" ErrorMessage="הכנס שם מוצר"></asp:RequiredFieldValidator>

                                    </div>

                                </div>
                                <!----------------------------------------- סיום בחירת שם מוצר  -------------------------------------------------------------------------->
                                <!-----------------------------------------בחירת סוג המוצר  -------------------------------------------------------------------------->
                                <div class="control-group">
                                    <asp:Label ID="lblProductType" runat="server" CssClass="control-label" Text="סוג מוצר"> סוג מוצר </asp:Label>
                                    <div class="controls">

                                        <asp:RadioButtonList ID="RBLproductType" runat="server" RepeatDirection="Horizontal" CssClass="radio">
                                            <asp:ListItem Value="1" Selected="True"> גליל </asp:ListItem>
                                            <asp:ListItem Value="2"> IMD</asp:ListItem>
                                        </asp:RadioButtonList>

                                    </div>
                                </div>
                                <!-----------------------------------------סיום בחירת סוג המוצר  -------------------------------------------------------------------------->
                                <!-----------------------------------------בחירת מכונות   -------------------------------------------------------------------------->
                                <div class="control-group">
                                    <asp:Label ID="LabelPrint" runat="server" CssClass="control-label" Text="דפוס">  דפוס </asp:Label>
                                    <div class="controls">
                                        <asp:CheckBox ID="cbPrint" runat="server" class="checkbox" />

                                    </div>

                                </div>
                                <div id="lblPrint">
                                    <div class="control-group">
                                        <asp:Label ID="lblTypePrint" runat="server" CssClass="control-label" Text="סוג דפוס">סוג דפוס </asp:Label>
                                        <div class="controls">
                                            <asp:RadioButtonList ID="rblPrint" runat="server" CssClass="radio" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1">שקע</asp:ListItem>
                                                <asp:ListItem Value="2">פלקסו</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <div class="controls">
                                            <asp:DropDownList ID="ddlSheka" runat="server" CssClass="span4"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlFlexo" runat="server" CssClass="span4"></asp:DropDownList>

                                        </div>
                                        <div class="controls">
                                            <asp:RequiredFieldValidator ID="rfvShekaMachine" ControlToValidate="ddlSheka" CssClass="span4" runat="server" ErrorMessage="לא נבחרה מכונה"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="rfvFlexoMachine" ControlToValidate="ddlFlexo" runat="server" ErrorMessage="לא נבחרה מכונה"></asp:RequiredFieldValidator>

                                        </div>
                                        <div class="controls">
                                            <asp:RequiredFieldValidator ID="rfvPrintType" ControlToValidate="rblPrint" runat="server" ErrorMessage="יש לבחור סוג דפוס"></asp:RequiredFieldValidator>

                                        </div>

                                    </div>
                                </div>

                                <div class="control-group">
                                    <asp:Label ID="lblSliter" runat="server" CssClass="control-label" Text="חיתוך">  חיתוך </asp:Label>
                                    <div class="controls">

                                        <asp:CheckBox ID="cbSliter" runat="server" CssClass="checkbox" />

                                        <asp:DropDownList ID="ddlSliter" runat="server" CssClass="input-large m-wrap">
                                            <%-- כאן ייכנסו דינאמית מכונות --%>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSliter" ControlToValidate="ddlSliter" runat="server" ErrorMessage="יש לבחור מכונה"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <asp:Label ID="lblLeminate" runat="server" CssClass="control-label">למינציה </asp:Label>
                                    <div class="controls">
                                        <asp:CheckBox ID="cbLeminate" runat="server" CssClass="checkbox" />
                                        <asp:DropDownList ID="ddlLeminateMachine" runat="server" CssClass="input-large m-wrap">
                                            <%--כאן ייכנסו דינאמית מכונות --%>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvLeminateMachine" ControlToValidate="ddlLeminateMachine" runat="server" ErrorMessage="יש לבחור מכונה"></asp:RequiredFieldValidator>
                                        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblnumOfLayer" runat="server">מספר שכבות:     </asp:Label>
                                        <asp:TextBox ID="numOfLayer" type="number" runat="server" class="input-mini" min="1" max="3" Text="1" />
                                        <asp:RequiredFieldValidator ID="rfvNumOfLayer" ControlToValidate="numOfLayer" runat="server" ErrorMessage="יש לבחור מספר שכבות"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <asp:Label ID="lblRepair" runat="server" CssClass="control-label">  תיקונים</asp:Label>
                                    <div class="controls">
                                        <asp:CheckBox ID="cbRepair" runat="server" CssClass="checkbox" />

                                        <asp:DropDownList ID="ddlRepair" runat="server" CssClass="input-large m-wrap">
                                            <%--כאן ייכנסו דינאמית מכונות --%>
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="rfvRepairMachine" ControlToValidate="ddlRepair" runat="server" ErrorMessage="יש לבחור מכונה"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <!---------------------------------------------- הוספת מכונות עבור IMD------------------------------------------->

                                <div class="control-group" id="machineIMD">
                                    <div class="control-group">
                                        <asp:Label ID="lblShiter" runat="server" CssClass="control-label"> שיטר</asp:Label>

                                        <div class="controls">
                                            <asp:CheckBox ID="cbShiter" runat="server" CssClass="checkbox" />
                                            <asp:DropDownList ID="ddlShiter" runat="server" CssClass="input-large m-wrap">
                                                <%-- כאן ייכנסו דינאמית מכונות --%>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvShiterMachine" ControlToValidate="ddlShiter" runat="server" ErrorMessage="יש לבחור מכונה"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <asp:Label ID="lblTigel" runat="server" CssClass="control-label"> טיגל</asp:Label>

                                        <div class="controls">
                                            <asp:CheckBox ID="cbTigel" runat="server" CssClass="checkbox" />
                                            <asp:DropDownList ID="ddlTigel" runat="server" CssClass="input-large m-wrap">
                                                <%-- כאן ייכנסו דינאמית מכונות --%>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvTigelMachine" ControlToValidate="ddlTigel" runat="server" ErrorMessage="יש לבחור מכונה"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <!---------------------------------------------- הוספת מכונות עבור IMD סיום------------------------------------------------------------>
                                <!----------------------------------------------------בחירת מכונות  סיום -------------------------------------------------------------->

                                <!----------------------------------------------------- בחירת חומרים-------------------------------------------------------------------->
                                <div class="control-group">
                                    <asp:Label ID="lblMaterialChoosing" runat="server" CssClass="control-label"> בחירת חומרים</asp:Label>
                                    <div dir="rtl">
                                        <table style="width: 100%; text-align: center" class="">
                                            <tr>
                                                <td class="auto-style1">
                                                    <!-- <div class="d-sel-filter">
                                                <span>&nbsp חיפוש &nbsp</span> <input type="text" id="box1Filter" onkeyup="materialFilter()" /><button type="button" class="btn" id="box1Clear">X</button>

                                            </div>-->
                                                    <select id="box1View" multiple="true" style="height: 300px; width: 75%" runat="server">
                                                    </select><br />

                                                    <span id="box1Counter" class="countLabel"></span>

                                                    <%-- <select id="box1Storage">
                                            </select>--%>
                                                </td>
                                                <td style="width: 21%; vertical-align: middle">
                                                    <button id="to2" class="btn" type="button">&nbsp;>&nbsp;</button>
                                                    <button id="to1" class="btn" type="button">&nbsp;<&nbsp;</button></td>
                                                <td style="width: 35%">
                                                    <!--<div class="d-sel-filter">
                                                <span>&nbsp חיפוש &nbsp</span> <input type="text" id="box2Filter" /><button type="button" class="btn" id="box2Clear">X</button>
                                            </div>-->
                                                    <select id="box2View" multiple="true" style="height: 300px; width: 75%;" runat="server">
                                                    </select><br />

                                                    <span id="box2Counter" class="countLabel"></span>

                                                    <%--<select id="box2Storage">
                                            </select>--%>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <!-----------------------------------------------------  סיום בחירת חומרים -------------------------------------------------------------------->

                                <!------------------------------------------------------  בחירת חומרים למכונות --------------------------------------------------------------------------->
                                <div class="control-group">
                                    <asp:Table ID="tblMandM" runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell>שם מכונה</asp:TableCell>
                                            <asp:TableCell>חומר</asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div>
                                <!------------------------------------------------------סיום בחירת חומרים למכונות----------------------------------------------------------------------------->

                                <!-----------------------------------------------------   בחירת דבק ---------------------------------------------------------------------------->

                                <div class="control-group">
                                    <asp:Label ID="glueType" runat="server" CssClass="control-label"> בחירת דבק</asp:Label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlGlue" runat="server">
                                            <%-- כאן ייכנסו דינאמית דבקים --%>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <asp:Label ID="lblColdGlue" runat="server" CssClass="control-label">דבק קר </asp:Label>
                                    <div class="controls">
                                        <asp:CheckBox ID="cbColdGlue" runat="server" CssClass="checkbox" />

                                        <asp:DropDownList ID="ddlColdGlue" runat="server">
                                            <%-- כאן ייכנסו דינאמית דבק קר --%>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvColdGlue" ControlToValidate="ddlColdGlue" runat="server" ErrorMessage="יש לבחור דבק"></asp:RequiredFieldValidator>
                                        <asp:Label ID="lblGluePercentage" runat="server"> אחוז כיסוי:</asp:Label>
                                        <asp:TextBox ID="tbGluePercentage" runat="server" type="number" class="input-mini" min="0" max="200" Text="0"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPercentageColdGlue" ControlToValidate="tbGluePercentage" runat="server" ErrorMessage="יש להזין אחוז כיסוי"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <!-----------------------------------------------------  סיום בחירת דבק ----------------------------------------------------------------------->

                                <!-----------------------------------------------------  בחירת מידות ----------------------------------------------------------------------->

                                <div class="control-group">
                                    <asp:Label ID="lblMeasure" runat="server" CssClass="control-label">מידות </asp:Label>
                                    <div class="controls">
                                        רוחב :<asp:TextBox ID="TBwidth" runat="server" class="input-mini">

                                        </asp:TextBox><asp:RequiredFieldValidator ID="rfvWidth" ControlToValidate="TBwidth" runat="server" ErrorMessage="יש להזין רוחב "></asp:RequiredFieldValidator>
                                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; פסיעה :
                                        <asp:TextBox ID="TBpitch" runat="server" class="input-mini"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPitch" ControlToValidate="TBpitch" runat="server" ErrorMessage="יש להזין פסיעה"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <!----------------------------------------------------- סיום בחירת מידות ----------------------------------------------------------------------->

                                <!------------------------------------------------------  בחירת צבעים --------------------------------------------------------------------------->
                                <div class="control-group">
                                    <asp:Label ID="lblColor" runat="server" CssClass="control-label">מספר צבעים </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox type="number" ID="tbNumOfColor" class="input-mini" min="1" max="8" Text="1" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvNumOfColor" ControlToValidate="tbNumOfColor" runat="server" ErrorMessage="יש להזין מספר צבעים"></asp:RequiredFieldValidator>אחוז כיסוי :
                                        <asp:TextBox type="number" ID="tbColorPercentage" class="input-mini" min="0" max="200" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPercentageColor" ControlToValidate="tbColorPercentage" runat="server" ErrorMessage="יש להזין אחוז כיסוי"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <div class="control-group">
                                    <asp:Label ID="lblLacquer" runat="server" CssClass="control-label">לכה </asp:Label>
                                    <div class="controls">
                                        <asp:CheckBox ID="cbLaqure" runat="server" CssClass="checkbox" />
                                        <asp:DropDownList ID="ddlLaquer" runat="server">
                                            <%-- כאן ייכנסו דינאמית לכה --%>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvLacquer" ControlToValidate="ddlLaquer" runat="server" ErrorMessage="יש לבחור לכה"></asp:RequiredFieldValidator>
                                        <asp:Label ID="lblLaquerPercentage" runat="server">אחוז כיסוי : </asp:Label>
                                        <asp:TextBox ID="tbLaquerPercentage" runat="server" type="number" class="input-mini" min="0" max="200" Text="0"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPercentageLaquer" ControlToValidate="tbLaquerPercentage" runat="server" ErrorMessage="יש להזין אחוז כיסוי"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <asp:Label ID="lblwhite" runat="server" CssClass="control-label"> לבן </asp:Label>
                                    <div class="controls">
                                        <asp:CheckBox ID="cbWhite" runat="server" CssClass="checkbox" />
                                        <asp:Label ID="lblWhitePercentage" runat="server">אחוז כיסוי : </asp:Label>
                                        <asp:TextBox ID="tbWhitePercentage" runat="server" type="number" class="input-mini" min="0" max="200" Text="0"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPercentageWhite" ControlToValidate="tbWhitePercentage" runat="server" ErrorMessage="יש להזין אחוז כיסוי"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <!----------------------------------------------------- סיום בחירת צבעים ----------------------------------------------------------------------->
                                
                                <!----------------------------------------------------- בחירת כמויות --------------------------------------------------------------------------->

                                <div class="control-group" hidden="hidden">
                                    <asp:Label ID="lblQuantity" runat="server" CssClass="control-label">בחירת כמויות  </asp:Label>
                                    <div class="controls">
                                        כמות 1 :
                                    <asp:TextBox ID="TBquantity1" runat="server" class="input-mini"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvQuantity" ControlToValidate="TBquantity1" runat="server" ErrorMessage="יש להזין כמות"></asp:RequiredFieldValidator>
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  כמות 2 :
                                    <asp:TextBox ID="TBquantity2" runat="server" class="input-mini"></asp:TextBox>&nbsp;&nbsp;
                                   
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; כמות 3 :
                                    <asp:TextBox ID="TBquantity3" runat="server" class="input-mini"></asp:TextBox>&nbsp;&nbsp;
                                    </div>
                                </div>
                                <!----------------------------------------------------- הזנת הנחה ----------------------------------------------------------------------->

                                <div class="control-group" hidden="hidden">
                                    <asp:Label ID="lblDisc" runat="server" CssClass="control-label">? הנחת מחזור   </asp:Label>
                                    <div class="controls">
                                        <asp:CheckBox ID="cbDiscount" runat="server" CssClass="checkbox" />
                                        <asp:Label ID="lblDiscount" runat="server">אחוז הנחה :</asp:Label>
                                        <asp:TextBox ID="tbDiscount" runat="server" type="number" class="input-mini" min="0" max="100" Text="0"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvDiscount" runat="server" ErrorMessage="יש להזין אחוז הנחה " ControlToValidate="tbDiscount"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <!----------------------------------------------------- סיום הזנת הנחה ----------------------------------------------------------------------->

                                <!-----------------------------------------------------  הזנת עמלה -------------------------------------------------------------------------->

                                <div class="control-group" hidden="hidden">
                                    <asp:Label ID="lblcomm" runat="server" CssClass="control-label">? עמלת מחזור  </asp:Label>
                                    <div class="controls">
                                        <asp:CheckBox ID="cbCommission" runat="server" CssClass="checkbox" />
                                        <asp:Label ID="lblCommission" runat="server">אחוז הנחה :</asp:Label>
                                        <asp:TextBox ID="tbCommission" runat="server" type="number" class="input-mini" min="0" max="100" Text="0"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCommision" runat="server" ErrorMessage="יש להזין עמלה מוגדרת מראש " ControlToValidate="tbCommission"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                                <!------------------------------------------------ סיום הזנת עמלה ----------------------------------------------------------------------->

                                <!------------------------------------------------  הזנת מחיר מטרה ----------------------------------------------------------------------->
                                <div class="control-group" hidden="hidden">
                                    <asp:Label ID="lblTargetPrice" runat="server" CssClass="control-label"> מחיר מטרה   </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="tbTargetPrice" runat="server" class="input-mini"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvTargetPrice" ControlToValidate="tbTargetPrice" runat="server" ErrorMessage="יש להזין מחיר מטרה"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <!------------------------------------------------ סיום הזנת מחיר מטרה ----------------------------------------------------------------------->

                                <!------------------------------------------------  הזנת תאריך יעד ----------------------------------------------------------------------->
                                <div class="control-group" hidden="hidden">
                                    <asp:Label ID="lblTargetDate" runat="server" CssClass="control-label">  תאריך יעד לביצוע   </asp:Label>

                                    <div class="controls">
                                       <input type="date" id="datepicker" runat="server"><%--<input id="targetDate" type="date" runat="server" /> <asp:RequiredFieldValidator ID="rfvTargetDate" ControlToValidate="targetDate" runat="server" ErrorMessage="יש לבחור תאריך "></asp:RequiredFieldValidator>--%>
                                  <%--      <asp:Calendar ID="Calendar" SelectionMode="DayWeekMonth" runat="server">
                                            <TodayDayStyle Font-Bold="True" ForeColor="White"
                                                BackColor="#990000"></TodayDayStyle>
                                            <DayStyle BorderWidth="2px" ForeColor="#666666" BorderStyle="Solid"
                                                BorderColor="White"
                                                BackColor="#EAEAEA"></DayStyle>
                                            <DayHeaderStyle ForeColor="#649CBA"></DayHeaderStyle>
                                            <SelectedDayStyle Font-Bold="True" ForeColor="#333333"
                                                BackColor="#FAAD50"></SelectedDayStyle>
                                            <WeekendDayStyle ForeColor="White"
                                                BackColor="#BBBBBB"></WeekendDayStyle>
                                            <OtherMonthDayStyle ForeColor="#666666"
                                                BackColor="White"></OtherMonthDayStyle>
                                        </asp:Calendar>--%>
                                    </div>
                                </div>
                                <!------------------------------------------------ סיום תאריך יעד ----------------------------------------------------------------------->



                                <div class="control-group">
                                   <asp:Label ID="lblComments" runat="server" CssClass="control-label"> הערות והארות   </asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="tbComment" TextMode="MultiLine" class="input-xxlarge" Rows="3" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-actions">                               
                                    <asp:Button ID="BTNremove" runat="server" class="btn btn-large btn-danger" Text="נקה" />
                                    <asp:Button ID="BTNsave" runat="server" class="btn btn-large btn-danger" Text="שמור" OnClick="BTNsave_Click" />
                                    <asp:Button ID="BTNsend" runat="server" class="btn btn-large btn-danger" Text="שמור ושלח" OnClick="BTNsend_Click" />
                                    <%--  popup--%>
                                    <asp:Button ID="cancel" runat="server" Text="Button" Style="display: none" />
                                    <asp:Label ID="clientNumber" runat="server" Text="" Visible="false">

                                    </asp:Label>
                                    <%--  popup--%>
                                    <asp:Label ID="test" runat="server"></asp:Label>
                                </div>
                                <%--    </form>--%><!-- END FORM-->
                            </div>
                            <!-- END WIDGET BODY-->

                        </div>
                        <!-- END SAMPLE FORM PORTLET-->
                        <!-- END BODY -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END PAGE CONTAINER-->
    <!-- END PAGE -->
</asp:Content>

