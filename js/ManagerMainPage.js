



















$(document).ready(function () {

    $.ajax({
        type: "POST",
        url: "WebService.asmx/getOpenBid",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: successGetOpenBidCB,
        error: errorGetOpenBidCB
    });

});










function successGetOpenBidCB(resutls) {

    resutls = $.parseJSON(resutls.d);
    var countStutus0 = 0;
    var countStutus1 = 0;
    var countStutus2 = 0;
    var countStutus3 = 0;

    $.each(resutls, function (i, row) {

        if (row.Status == 0) { countStutus0++; }
        if (row.Status == 1) { countStutus1++; }
        if (row.Status == 2) { countStutus2++; }
        if (row.Status == 3) { countStutus3++; }
    });

    var doughnutManagerData = [
  {
      value: countStutus0,
      color: "#F7464A",
      title:'aiiii'
      
  },
  {
      value: countStutus1,
      color: "#46BFBD"
  },
  {
      value: countStutus2,
      color: "#FDB45C"
  },
  {
      value: countStutus3,
      color: "#949FB1"
  }

    ];

    new Chart(document.getElementById("doughnutManager").getContext("2d")).Doughnut(doughnutManagerData);


   


    }




function errorGetOpenBidCB(e) {
    alert("I caught the exception : failed in someAjaxFunc \n The exception message is : " + e.responseText);
}


