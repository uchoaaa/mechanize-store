function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".row").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

jQuery(document).ready(function($){
    $("#question_question_type").change(function(e){
        if ($(this).val() == 1 || $(this).val() == 2) {
            if ($(this).val() == 1) {
              $("#option-title-field").removeClass("col-lg-12");

              if(!$("#option-title-field").hasClass("col-lg-10")){
                $("#option-title-field").addClass("col-lg-10");
              }
              
              $("#next-question-selector").show();
            } else {
              $("#option-title-field").removeClass("col-lg-10");

              if(!$("#option-title-field").hasClass("col-lg-12")){
                $("#option-title-field").addClass("col-lg-12");
              }

              $("#next-question-selector").hide();
            }
            $("#option-fields-container").show();
        }else{
            $("#option-fields-container").hide();
        }
    });

    $('a').tooltip();


    $('body').on("click", '[data-toggle="modal"]', function(e) {
        e.preventDefault();

        var url = "" + $(this).attr('href');

        if (url.indexOf('#') == 0) {
            $(url).modal();
        } else {
            $.get(url, function(data) {
              $('<div class="modal fade" id="datemodal">' + data + '</div>').modal({
                  keyboard: true
              });
            }).success(function() { $('input:text:visible:first').focus(); });
        }
    });
    

});