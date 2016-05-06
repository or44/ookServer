//-----------------------------------------------------------------------------
//  הבאת לקוחות בהצלחה/כישלון
//-----------------------------------------------------------------------------
//
function successCB(resutls) {
    resutls = $.parseJSON(resutls.d);
    //var list = $('#ContentPlaceHolder1_ddlclients');
    //list.append('<asp:ListItem value=""> בחר לקוח </asp:ListItem>');
    //resutls.forEach(function (client) {
       
    //});

    $("#ContentPlaceHolder1_ddlclients").empty();
    $("#ContentPlaceHolder1_ddlclients").append("<option value=''> בחר לקוח </option>");
    $.each(resutls, function (i, row) {
        //fill the client list 
        $("#ContentPlaceHolder1_ddlclients").append('<option value="' + row.ClientId + '">' + row.ClientName + '</option>');
    });
    //$("#ContentPlaceHolder1_ddlclients").refresh;
}


//function successCB(resutls) {
//    resutls = $.parseJSON(resutls.d);
//    var list = $('#ContentPlaceHolder1_clientsList');
//    list.append('<option value=""> בחר לקוח </option>');
//    resutls.forEach(function (client) {
//        list.append($('<option/>', { 
//            value: client.Id, 
//            text: client.Name
//        }));
//    });
//}

function errorCB(e) {
    alert("I caught the exception : failed in someAjaxFunc \n The exception message is : " + e.responseText);
}


//-----------------------------------------------------------------------------
//  הבאת חומרים בהצלחה/כישלון
//-----------------------------------------------------------------------------
function successCBMaterial(resutls) {
    resutls = $.parseJSON(resutls.d);
    var list320325 = $('#ContentPlaceHolder1_ddlGlue');
    list320325.append('<option value=""> בחר דבק </option>');
    var list322 = $('#ContentPlaceHolder1_ddlColdGlue');
    list322.append('<option value=""> בחר דבק קר </option>');
    var list330335 = $('#ContentPlaceHolder1_ddlLaquer');
    list330335.append('<option value=""> בחר לכה </option>');


    //$("#ContentPlaceHolder1_box1View").empty();

    $.each(resutls, function (i, row) {
        //fill the material box
        if (row.MaterialType == "200") {
            $("#ContentPlaceHolder1_box1View").append("<option value='" + row.MaterialId + "'>" + row.MaterialDescription + "</option>");
        }
        if((row.MaterialType == "320")|| (row.MaterialType=="325")) {
            list320325.append("<option value='" + row.MaterialId + "'>" + row.MaterialDescription + "</option>");
        }
        if (row.MaterialType == "322") {
            list322.append("<option value='" + row.MaterialId + "'>" + row.MaterialDescription + "</option>");
        }
        if ((row.MaterialType == "330") || (row.MaterialType == "335")) {
            list330335.append("<option value='" + row.MaterialId + "'>" + row.MaterialDescription + "</option>");
        }

    });
    //$("#ContentPlaceHolder1_box1View").select('refresh');
    //$("#ContentPlaceHolder1_ddlGlue").select('refresh');
    //$("#ContentPlaceHolder1_ddlColdGlue").select('refresh');

}

function errorCBMaterial(e) {
    alert("I caught the exception : failed in someAjaxFunc \n The exception message is : " + e.responseText);
}


//-----------------------------------------------------------------------------
//  הבאת מכונות בהצלחה/כישלון
//-----------------------------------------------------------------------------
function successCBMachine(resutls) {
    resutls = $.parseJSON(resutls.d);
    var list100 = $('#ContentPlaceHolder1_ddlFlexo');
    list100.append('<option value=""> בחר מכונה </option>');
    var list200 = $('#ContentPlaceHolder1_ddlSheka');
    list200.append('<option value=""> בחר מכונה </option>');
    var list300 = $('#ContentPlaceHolder1_ddlLeminateMachine');
    list300.append('<option value=""> בחר מכונה </option>');
    var list400 = $('#ContentPlaceHolder1_ddlSliter');
    list400.append('<option value=""> בחר מכונה </option>');
    var list500 = $('#ContentPlaceHolder1_ddlRepair');
    list500.append('<option value=""> בחר מכונה </option>');
    var list600 = $('#ContentPlaceHolder1_ddlTigel');
    list600.append('<option value=""> בחר מכונה </option>');
    var list700 = $('#ContentPlaceHolder1_ddlShiter');
    list700.append('<option value=""> בחר מכונה </option>');


    //$("#ddlSheka").empty();
    //$("#ddlFlexo").empty();
    //$("#ddlLeminateMachine").empty();

    $.each(resutls, function (i, row) {
        //fill the machine select
        if (row.MachineType == "100     ") {
            list100.append("<option value='" + row.MachineId + "'>" + row.MachineName + "</option>");
        }
        if (row.MachineType == "200     ") {
            list200.append("<option value='" + row.MachineId + "'>" + row.MachineName + "</option>");
        }
        if (row.MachineType == "300     ") {
            list300.append("<option value='" + row.MachineId + "'>" + row.MachineName + "</option>");
        }
        if (row.MachineType == "400     ") {
            list400.append("<option value='" + row.MachineId + "'>" + row.MachineName + "</option>");
        }
        if (row.MachineType == "500     ") {
            list500.append("<option value='" + row.MachineId + "'>" + row.MachineName + "</option>");
        }
        if (row.MachineType == "600     ") {
            list600.append("<option value='" + row.MachineId + "'>" + row.MachineName + "</option>");
        }
        if (row.MachineType == "700     ") {
            list700.append("<option value='" + row.MachineId + "'>" + row.MachineName + "</option>");
        }
    });

    list100.select('refresh');
    list200.select('refresh');
    list300.select('refresh');
    list400.select('refresh');
    list500.select('refresh');
    list600.select('refresh');
    list700.select('refresh');
    

}

function errorCBMachine(e) {
    alert("I caught the exception : failed in someAjaxFunc \n The exception message is : " + e.responseText);
}



//function materialFilter() {
//    str = document.getElementById("box1Filter").value;

//    var request = {
//        prefix:str,
//    }

//    filterAjaxFunction(request, successfilterCB, errorfilterCB);
//}


