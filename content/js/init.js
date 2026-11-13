jQuery(function(){
    var $ = jQuery.noConflict();

    function setNavOpen(open) {
        $('#nav-toggle').toggleClass('open', open).attr('aria-expanded', open ? 'true' : 'false');
        $('#header-main .nav-wrapper').toggleClass('open', open);
        $('html, body').toggleClass('nav-open', open);
    }

    $(document)
    .on('click', '.faq', function() {
        $(this).toggleClass('open');
    })
    .on('click', '#nav-toggle', function() {
        setNavOpen(!$(this).hasClass('open'));
    })
    .on('keydown', function(e) {
        if (e.key === 'Escape' && $('#nav-toggle').hasClass('open')) {
            setNavOpen(false);
            $('#nav-toggle').trigger('focus');
        }
    });

    // Close the mobile drawer if the viewport grows back to desktop width.
    $(window).on('resize', function() {
        if (window.innerWidth > 1000 && $('#nav-toggle').hasClass('open')) {
            setNavOpen(false);
        }
    });

    // Mark nav links that point at the current page with aria-current="page".
    function normalizePath(path) {
        return path
            .replace(/\/index\.html$/, '/')
            .replace(/\.html$/, '')
            .replace(/\/+$/, '') || '/';
    }
    var here = normalizePath(window.location.pathname);
    $('#header-main nav a[href]').each(function() {
        var link = this;
        var href = link.getAttribute('href');
        // skip placeholder (#), in-page and external links
        if (!href || href.charAt(0) === '#' || link.hash || link.hostname !== window.location.hostname) { return; }
        if (normalizePath(link.pathname) === here) {
            $(link).attr('aria-current', 'page');
            // Highlight the parent item of an active sub-menu link too.
            $(link).closest('li.has-sub-menu').children('a').addClass('is-current-parent');
        }
    });
});
