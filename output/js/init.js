jQuery(function(){
    var $ = jQuery.noConflict();
    $(document)
    .on('click', '.faq', function() {
        $(this).toggleClass('open');
    })
    .on('click', '#nav-toggle', function() {
        $(this).toggleClass('open');
        $('#header-main nav').toggleClass('open');
    });
});
