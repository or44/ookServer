




$(document).ready(function () {

    $("#ContentPlaceHolder1_AddClient").hide();
    $("#ContentPlaceHolder1_GVClient").show();
    $("#ContentPlaceHolder1_GVClient_Status").hide();

    $("#AddNew").click(function () {
        $("#ContentPlaceHolder1_AddClient").show();
    });

    $("#clientCancel").click(function () {
        $("#ContentPlaceHolder1_AddClient").hide();
     
        //document.getElementById("firstnameClient").value = '';
       
    });

    $('#CBfilter_client').change(function () {
        if ($(this).is(":checked")) {
            //'checked' event code
            $("#ContentPlaceHolder1_GVClient").hide();
            $("#ContentPlaceHolder1_GVClient_Status").show();
            return;
        }
        //'unchecked' event code
        $("#ContentPlaceHolder1_GVClient").show();
        $("#ContentPlaceHolder1_GVClient_Status").hide();
    });

  

    //$("#ContentPlaceHolder1_GVClient").show();
    //$("#ContentPlaceHolder1_GVClient_Status").hide();
    //$("#CBfilter_client").change(function () {
     
    //    if ($(this).is(":checked")) {
    //        $("#ContentPlaceHolder1_GVClient").hide();
    //        $("#ContentPlaceHolder1_GVClient_Status").show();
            
    //        return;
    //    }
    //    $("#ContentPlaceHolder1_GVClient").hide();
    //    $("#ContentPlaceHolder1_GVClient_Status").show();

       // if ($(document.getElementById("CBfilter_client").checked == true)) {
       //     $("#ContentPlaceHolder1_GVClient").hide();
       //     $("#ContentPlaceHolder1_GVClient_Status").show();
       // }
        
       //else    {
       //     alert("fcb");
       //     $("#ContentPlaceHolder1_GVClient").show();
       //     $("#ContentPlaceHolder1_GVClient_Status").hide();
       // }
    //});

//    //$("p").click(function () {
//    //    alert("The paragraph was clicked.");
//    //});

//    $("#CBfilterUser").click(function () {
//        if ($("#CBfilterUser").checked == true) {
//            $("#GVActivityUser").hidden();
//            $("#GVUser").show();
//        }
//        else {
//            $("#GVActivityUser").show();
//            $("#GVUser").hidden();
//        }
   
//    });
//    alert("The paragraph was clicked.");

//});
//$(document).ready(function () {


//    $("#AddUser").show();

//});


//$(document).click("n#AddNew", function () {
//    $(document)("#AddUser").show();
    
   
//})

//$("#AddNew").click(function (event) {
//    $("#AddUser").show();
//});

//function AddNewUser()
//{
//    AddUser.Visible = true;
//}
//$(document).ready(function () {
//    $("#Button1").click(function () {
//        alert("Hello world!");
//    });

});

//(document).onclick("#Button2", function (e, data) {
//    //---------------------------------------------
//    // calling a function on the startBTN link
//    //---------------------------------------------
//    $("#AddUser").show();



   
//});


//function myFunction() {
//    //document.getElementById("AddUser").show();
//    if ($(document.getElementById("CBfilter_client").checked == true)) {
//        $("#ContentPlaceHolder1_GVClient").hide();
//        $("#ContentPlaceHolder1_GVClient_Status").show();
//        return;
//    }


//        alert("fcb");
//        $("#ContentPlaceHolder1_GVClient").show();
//        $("#ContentPlaceHolder1_GVClient_Status").hide();
  
//}


