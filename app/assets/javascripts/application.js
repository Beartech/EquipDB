// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.mouse
//= require jquery.ui.draggable
//= require bootstrap
//= require bootstrap-datepicker
//= require server-time
//= require jquery-table
//= require gritter
//= require_tree .



$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 0, "autoclose": true });
});

$(document).ready(function() {
    $('.alert').delay(500).fadeIn('normal', function() {
        $(this).delay(500).fadeOut();
    });

    $(function() {
        $( "#draggable" ).draggable();
    });

    $('#filter1').focus();
    $('#part').focus();

    $('#part_sku').focus();

    $('#selectAll').click(function() {
        if (this.checked) {
            $('.app_tools').each(function() {
                this.checked = true;
            });
        } else {
            $('.app_tools').each(function() {
                this.checked = false;
            });
        }
    });
    $('#part_list').on('ajax:success', 'li a', function() {
        $(this).closest('li').remove();
        });
    $('#removed_part_list').on('ajax:success', 'li a', function(){
        $(this).closest('li').remove();

    })

});





