jQuery(document).ready(function($){
    placeholder = $("#donut-chart");

    if (placeholder.is(":visible")) {
      $.ajax({
        url: "/dashboard/questionnaires.json", 
        dataType: "json",
        type: "get"
    }).done(function(data){
            $.plot(placeholder, data, {
                series: {
                    pie: { 
                        innerRadius: 0.5,
                        show: true
                    }
                }
            });
        });  
    };
});