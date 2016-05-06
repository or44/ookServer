//-----------------------------------------------------------------------
// Call an ajax function on the server
//-----------------------------------------------------------------------

$(document).ready(function () {


    //הסתרת פקדים
    $("#machineIMD").hide();
    $("#ContentPlaceHolder1_AddClient").hide();
    $("#lblPrint").hide();
    $("#ContentPlaceHolder1_ddlSheka").hide();
    $("#ContentPlaceHolder1_ddlFlexo").hide();
    $("#ContentPlaceHolder1_ddlSliter").hide();
    $("#ContentPlaceHolder1_ddlTigel").hide();
    $("#ContentPlaceHolder1_ddlRepair").hide();
    $("#ContentPlaceHolder1_ddlShiter").hide();
    $("#ContentPlaceHolder1_ddlLeminateMachine").hide();
    $("#ContentPlaceHolder1_lblnumOfLayer").hide();
    $("#ContentPlaceHolder1_numOfLayer").hide();
    $("#ContentPlaceHolder1_ddlColdGlue").hide();
    $("#ContentPlaceHolder1_tbGluePercentage").hide();
    $("#ContentPlaceHolder1_lblGluePercentage").hide();
    $("#ContentPlaceHolder1_ddlLaquer").hide();
    $("#ContentPlaceHolder1_tbLaquerPercentage").hide();
    $("#ContentPlaceHolder1_lblLaquerPercentage").hide();    
    $("#ContentPlaceHolder1_tbWhitePercentage").hide();
    $("#ContentPlaceHolder1_lblWhitePercentage").hide();
    $("#ContentPlaceHolder1_lblDiscount").hide();
    $("#ContentPlaceHolder1_tbDiscount").hide();
    $("#ContentPlaceHolder1_lblCommission").hide();
    $("#ContentPlaceHolder1_tbCommission").hide();
    $("#ContentPlaceHolder1_cblPrint_0").hide();
    $("#ContentPlaceHolder1_cblLeminate_0").hide();
    $("#ContentPlaceHolder1_cblSliter_0").hide();
    $("#ContentPlaceHolder1_tblMandM").hide();
    document.getElementById('ContentPlaceHolder1_rfvCommision').enabled = false;
    document.getElementById('ContentPlaceHolder1_rfvDiscount').enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvPrintType").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvShekaMachine").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvFlexoMachine").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvSliter").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvLeminateMachine").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvNumOfLayer").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvRepairMachine").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvTigelMachine").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvShiterMachine").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvColdGlue").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvPercentageColdGlue").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvLacquer").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvPercentageLaquer").enabled = false;
    document.getElementById("ContentPlaceHolder1_rfvPercentageWhite").enabled = false;
   

    //הבאת לקוחות מבסיס הנתונים
    $.ajax({
        type: "POST",
        url: "WebService.asmx/getClientNames",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: successCB,
        error: errorCB
    });

    //הבאת חומרים מבסיס הנתונים
    $.ajax({
        type: "POST",
        url: "WebService.asmx/getMaterialName",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: successCBMaterial,
        error: errorCBMaterial
    });

    //הבאת מכונות מבסיס הנתונים
    $.ajax({
        type: "POST",
        url: "WebService.asmx/getMachine",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: successCBMachine,
        error: errorCBMachine
    });


    //טופס הזנת לקוח חדש
    $("#AddNew").click(function () {
        $("#ContentPlaceHolder1_AddClient").show();
    });

    //ביטול הזנת לקוח חדש
    $("#clientCancel").click(function () {
        $("#ContentPlaceHolder1_AddClient").hide();
    });

    //הכנסת חומרים 
    $("#to2").click(function () {
        desc = $("#ContentPlaceHolder1_box1View").find(":selected").text();
        val = $("#ContentPlaceHolder1_box1View").children(":selected").attr("value");
        $("#ContentPlaceHolder1_box2View").append("<option value='" + val + "'>" + desc + "</option>");
        $("#ContentPlaceHolder1_box2View").select('refresh');
        $("#ContentPlaceHolder1_tblMandM").show();
        //דינאמית לטבלת חומרים ומכונות checkbox הוספת
        //$("#ContentPlaceHolder1_cblPrint").append('<input type="checkbox" value="' + val + '">' + desc + '</input></br>');
        //$("#ContentPlaceHolder1_cblLeminate").append('<input type="checkbox" value="' + val + '">' + desc + '</input></br>');
        //$("#ContentPlaceHolder1_cblSliter").append('<input type="checkbox" value="' + val + '">' + desc + '</input></br>');
        if (document.getElementById("ContentPlaceHolder1_cbPrint").checked == true) {
            //$("#ContentPlaceHolder1_tblMandM").append("<tr><td>" + type + "</td><td>" + areaCode + "-" + number + "</td></tr>")
            $("#ContentPlaceHolder1_tblMandM").append('<tr id=tblMandM' + val + '"><td> <input type="checkbox"/></td><td>דפוס</td><td>' + desc + '</td></tr>')

        }
        if (document.getElementById("ContentPlaceHolder1_cbSliter").checked == true) {
            //$("#ContentPlaceHolder1_tblMandM").append("<tr><td>" + type + "</td><td>" + areaCode + "-" + number + "</td></tr>")
            $("#ContentPlaceHolder1_tblMandM").append('<tr id=tblMandM' + val + '"><td> <input type="checkbox"/></td><td>חיתוך</td><td >' + desc + '</td></tr>')

        }
        if (document.getElementById("ContentPlaceHolder1_cbLeminate").checked == true) {
            //$("#ContentPlaceHolder1_tblMandM").append("<tr><td>" + type + "</td><td>" + areaCode + "-" + number + "</td></tr>")
            $("#ContentPlaceHolder1_tblMandM").append('<tr id=tblMandM' + val + '"><td> <input type="checkbox"/></td><td>למינציה</td><td >' + desc + '</td></tr>')

        }
    });


    // העברת חומרים שנבחרו
    $("#to1").click(function () {
        desc2 = $("#ContentPlaceHolder1_box2View").find(":selected").val();
        val2 = $("#ContentPlaceHolder1_box2View").children(":selected").attr("value");
        $("#ContentPlaceHolder1_box2View option:selected").remove();
        $("#ContentPlaceHolder1_box2View").select('refresh');
        //דינאמית מטבלת חומרים ומכונות checkbox הסרת
        $("#ContentPlaceHolder1_cblPrint").find("input[type=checkbox][value='" + val2 + "']").remove();
        $("#ContentPlaceHolder1_cblPrint").children('refresh');
      
        //$('"#tblMandM'+val2+'"').remove;
    });

    // במידה ומסומן בדיפולט IMD הצגת מכונות
    if ($("input[id*=ContentPlaceHolder1_RBLproductType_1]").is(":checked")) {

        $("#machineIMD").show();
    }


    // בחירת סוג מוצר גליל או IMD ASPX
    $(document).on('change', '#ContentPlaceHolder1_RBLproductType', function () {
        if ($("input[id*=ContentPlaceHolder1_RBLproductType_1]").is(":checked")) {

            $("#machineIMD").show();
        }
        else {
            $("#machineIMD").hide();
        }
    });


    // הוספה של  בחירת סוג דפוס שקע או פלקסו בעת לחיצה על דפוס 
    $(document).on('change', '#ContentPlaceHolder1_cbPrint', function () {
        if (document.getElementById("ContentPlaceHolder1_cbPrint").checked == true) {          
            $("#lblPrint").show();
            document.getElementById("ContentPlaceHolder1_rfvPrintType").enabled = true;       
        }

        else {

            $("#lblPrint").hide();
            document.getElementById("ContentPlaceHolder1_rfvPrintType").enabled = false;
            document.getElementById("ContentPlaceHolder1_rfvShekaMachine").enabled = false;
            document.getElementById("ContentPlaceHolder1_rfvFlexoMachine").enabled = false;

        }
    });


    // הוספה של בחירת מכונות שקע או פלקסו בעת לחיצה על אחד מהם
    $(document).on('change', '#ContentPlaceHolder1_rblPrint', function () {
        if ($("input[id*=ContentPlaceHolder1_rblPrint_0]").is(":checked")) {

            $("#ContentPlaceHolder1_ddlSheka").show();
            $("#ContentPlaceHolder1_ddlFlexo").hide();
            document.getElementById("ContentPlaceHolder1_rfvShekaMachine").enabled = true;
            document.getElementById("ContentPlaceHolder1_rfvFlexoMachine").enabled = false;
           
        }
        else {
            $("#ContentPlaceHolder1_ddlSheka").hide();
            $("#ContentPlaceHolder1_ddlFlexo").show();
            document.getElementById("ContentPlaceHolder1_rfvShekaMachine").enabled = false;
            document.getElementById("ContentPlaceHolder1_rfvFlexoMachine").enabled = true;
        }

    });
    
   
    // הוספה של בחירת מכונות חיתוך בעת לחיצה על חיתוך
    $(document).on('change', '#ContentPlaceHolder1_cbSliter', function () {
        if (document.getElementById("ContentPlaceHolder1_cbSliter").checked == true) {

            $("#ContentPlaceHolder1_ddlSliter").show();
            document.getElementById("ContentPlaceHolder1_rfvSliter").enabled = true;
        }
        else {
            $("#ContentPlaceHolder1_ddlSliter").hide();
            document.getElementById("ContentPlaceHolder1_rfvSliter").enabled = false;
        }
    });


    // הוספה של בחירת מכונת טיגל בעת לחיצה על טיגל
    $(document).on('change', '#ContentPlaceHolder1_cbTigel', function () {
        if (document.getElementById("ContentPlaceHolder1_cbTigel").checked == true) {

            $("#ContentPlaceHolder1_ddlTigel").show();
            document.getElementById("ContentPlaceHolder1_rfvTigelMachine").enabled = true;
        }
        else {
            $("#ContentPlaceHolder1_ddlTigel").hide();
            document.getElementById("ContentPlaceHolder1_rfvTigelMachine").enabled = false;
        }
    });

    // הוספה של בחירת מכונת תיקונים בעת לחיצה על תיקונים
    $(document).on('change', '#ContentPlaceHolder1_cbRepair', function () {
        if (document.getElementById("ContentPlaceHolder1_cbRepair").checked == true) {

            $("#ContentPlaceHolder1_ddlRepair").show();
            document.getElementById("ContentPlaceHolder1_rfvRepairMachine").enabled = true;
        }
        else {
            $("#ContentPlaceHolder1_ddlRepair").hide();
            document.getElementById("ContentPlaceHolder1_rfvRepairMachine").enabled = false;
        }
    });

    // הוספה של בחירת מכונת שיטר בעת לחיצה על שיטר
    $(document).on('change', '#ContentPlaceHolder1_cbShiter', function () {
        if (document.getElementById("ContentPlaceHolder1_cbShiter").checked == true) {

            $("#ContentPlaceHolder1_ddlShiter").show();
            document.getElementById("ContentPlaceHolder1_rfvShiterMachine").enabled = true;
        }
        else {
            $("#ContentPlaceHolder1_ddlShiter").hide();
            document.getElementById("ContentPlaceHolder1_rfvShiterMachine").enabled = false;
        }
    });


    // הוספת מספר שכבות למינציה בעת לחיצה על למינציה
    $(document).on('change', '#ContentPlaceHolder1_cbLeminate', function () {
        if (document.getElementById("ContentPlaceHolder1_cbLeminate").checked == true) {

            $("#ContentPlaceHolder1_ddlLeminateMachine").show();
            $("#ContentPlaceHolder1_lblnumOfLayer").show();
            $("#ContentPlaceHolder1_numOfLayer").show();
            document.getElementById("ContentPlaceHolder1_rfvLeminateMachine").enabled = true;
            document.getElementById("ContentPlaceHolder1_rfvNumOfLayer").enabled = true;

        }
        else {
            $("#ContentPlaceHolder1_ddlLeminateMachine").hide();
            $("#ContentPlaceHolder1_lblnumOfLayer").hide();
            $("#ContentPlaceHolder1_numOfLayer").hide();
            document.getElementById("ContentPlaceHolder1_rfvLeminateMachine").enabled = false;
            document.getElementById("ContentPlaceHolder1_rfvNumOfLayer").enabled = false;

        }
    });

    // הוספת דבק קר בעת לחיצה על דבק קר
    $(document).on('change', '#ContentPlaceHolder1_cbColdGlue', function () {
        if (document.getElementById("ContentPlaceHolder1_cbColdGlue").checked == true) {
         
            $("#ContentPlaceHolder1_ddlColdGlue").show();
            $("#ContentPlaceHolder1_tbGluePercentage").show();
            $("#ContentPlaceHolder1_lblGluePercentage").show();
            document.getElementById("ContentPlaceHolder1_rfvColdGlue").enabled = true;
            document.getElementById("ContentPlaceHolder1_rfvPercentageColdGlue").enabled = true;
         
        }

        else {
            
            $("#ContentPlaceHolder1_ddlColdGlue").hide();
            $("#ContentPlaceHolder1_tbGluePercentage").hide();
            $("#ContentPlaceHolder1_lblGluePercentage").hide();
            document.getElementById("ContentPlaceHolder1_rfvColdGlue").enabled = false;
            document.getElementById("ContentPlaceHolder1_rfvPercentageColdGlue").enabled = false;
           

        }
    });

   
    
    //  דינאמית לטבלת חומרים ומכונות עבור כל שינוי checkbox הוספת
    $(document).on('change', '#ContentPlaceHolder1_ddlGlue', function () {
        descGlue = $("#ContentPlaceHolder1_ddlGlue").find(":selected").text();
        valGlue = $("#ContentPlaceHolder1_ddlGlue").children(":selected").attr("value");
        $("#ContentPlaceHolder1_cblPrint").append('<input type="checkbox" value="' + valGlue + '">' + descGlue + '</input></br>');
        $("#ContentPlaceHolder1_cblLeminate").append('<input type="checkbox" value="' + valGlue + '">' + descGlue + '</input></br>');
        $("#ContentPlaceHolder1_cblSliter").append('<input type="checkbox" value="' + valGlue + '">' + descGlue + '</input></br>');

    });

    // הוספה של אחוז כיסוי לכה
    $(document).on('change', '#ContentPlaceHolder1_cbLaqure', function () {
        if (document.getElementById("ContentPlaceHolder1_cbLaqure").checked == true) {
                  
            $("#ContentPlaceHolder1_ddlLaquer").show();
            $("#ContentPlaceHolder1_tbLaquerPercentage").show();
            $("#ContentPlaceHolder1_lblLaquerPercentage").show();
            document.getElementById("ContentPlaceHolder1_rfvLacquer").enabled = true;
            document.getElementById("ContentPlaceHolder1_rfvPercentageLaquer").enabled = true;
        }
        else {
            $("#ContentPlaceHolder1_ddlLaquer").hide();
            $("#ContentPlaceHolder1_tbLaquerPercentage").hide();
            $("#ContentPlaceHolder1_lblLaquerPercentage").hide();
            document.getElementById("ContentPlaceHolder1_rfvLacquer").enabled = false;
            document.getElementById("ContentPlaceHolder1_rfvPercentageLaquer").enabled = false;
        }
    });


    // הוספה של אחוז כיסוי צבע לבן
    $(document).on('change', '#ContentPlaceHolder1_cbWhite', function () {
        if (document.getElementById("ContentPlaceHolder1_cbWhite").checked == true) {
            $("#ContentPlaceHolder1_tbWhitePercentage").show();
            $("#ContentPlaceHolder1_lblWhitePercentage").show();
            document.getElementById("ContentPlaceHolder1_rfvPercentageWhite").enabled = true;

        }
        else {
            $("#ContentPlaceHolder1_tbWhitePercentage").hide();
            $("#ContentPlaceHolder1_lblWhitePercentage").hide();
            document.getElementById("ContentPlaceHolder1_rfvPercentageWhite").enabled = false;

        }
    });
    
   
    // הוספה של אחוז הנחה
    $(document).on('change', '#ContentPlaceHolder1_cbDiscount', function () {
        if (document.getElementById("ContentPlaceHolder1_cbDiscount").checked == true) {
            $("#ContentPlaceHolder1_tbDiscount").show();
            $("#ContentPlaceHolder1_lblDiscount").show();
            document.getElementById('ContentPlaceHolder1_rfvDiscount').enabled = true;
        }
        else {
            $("#ContentPlaceHolder1_tbDiscount").hide();
            $("#ContentPlaceHolder1_lblDiscount").hide();
            document.getElementById('ContentPlaceHolder1_rfvDiscount').enabled = false;
        }
    });

    // הוספה של אחוז עמלה
    $(document).on('change', '#ContentPlaceHolder1_cbCommission', function () {
        if (document.getElementById("ContentPlaceHolder1_cbCommission").checked == true) {
            $("#ContentPlaceHolder1_tbCommission").show();
            $("#ContentPlaceHolder1_lblCommission").show();
            document.getElementById('ContentPlaceHolder1_rfvCommision').enabled = true;
        }
        else {
            $("#ContentPlaceHolder1_tbCommission").hide();
            $("#ContentPlaceHolder1_lblCommission").hide();
            document.getElementById('ContentPlaceHolder1_rfvCommision').enabled = false;
        }
    });
    
  


    //$("#BTNsave").click(function () {


    //    if ($("#clientsList").children(":selected").attr("value") == "-1") {


    //    }
    //});


});


//הבאת מכונות מבסיס הנתונים
//function getMachineByType(request, successCBMachine, errorCBMachine) {

//     serialize the object to JSON string
//    var dataString = JSON.stringify(request);

//    $.ajax({
//        type: "POST",
//        url: "WebService.asmx/getMachine",
//        data: dataString,
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: successCBMachine,
//        error: errorCBMachine
//    });
//}



//filterAjaxFunction(request, successfilterCB, errorfilterCB){
//    var dataString =JSON.stringify(request);

//    $.ajax({
//        type: "POST",
//        url: "WebService.asmx/getMaterialFilter",
//        data: "{}",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: successfilterCB,
//        error: errorfilterCB
//    });
//}




