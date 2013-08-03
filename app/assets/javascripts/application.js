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
//= require bootstrap
//= require bootstrap-datepicker
//= require server-time
//= require advancedtable
//= require_tree .



$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 0, "autoclose": true });
});



$(document).ready(function() {

    $('.multiSort').click(function(){
        window.location.href = $(this).data('link');
    });
    $('#tools th a, #tools .pagination a').on('click', function () {
        $.getScript(this.href);
        return false;
    });
    $('.alert').delay(500).fadeIn('normal', function() {
        $(this).delay(2500).fadeOut();
    });
    $("#searchtable").show();
    $("#table0").advancedtable(
        {searchField: "#search", loadElement: "#loader", searchCaseSensitive: false, ascImage: "assets/up.png", descImage: "assets/down.png"
    });

});

