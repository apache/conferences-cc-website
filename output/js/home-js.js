jQuery(function(){
    var $ = jQuery.noConflict();

    // set random image for events news section
    const eventsNewsImages = [
        '../images/events-news-1.webp',
        '../images/events-news-2.webp',
        '../images/events-news-3.webp',
        '../images/events-news-4.webp',
        '../images/events-news-5.webp',
    ];
    const imgCount = eventsNewsImages.length;
    // get random index to start with
    let currentImageIndex = Math.floor(Math.random() * imgCount);
    $('#events-news-img').attr('src', eventsNewsImages[currentImageIndex]);

    // for mosiaic content blocks
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const blockId = entry.target.id;
                const blockNumber = blockId.match(/\d+/)[0];
                $(`.mosaic-step-${blockNumber}`).addClass('shown');
            }
        });
    }, {
        threshold: 0.5,
        rootMargin: '0px 0px -100px 0px'
    });
    $('.mosaic-content').each(function() {
        observer.observe(this);
    });
    // create a method that applies a class of active when a div with the class of scroll-watch comes into view
    const scrollWatchObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                $(entry.target).addClass('active');
            }
        });
    }, {
        threshold: 0.5,
        rootMargin: '0px 0px -100px 0px'
    });
    $('.scroll-watch').each(function() {
        scrollWatchObserver.observe(this);
    });

});
