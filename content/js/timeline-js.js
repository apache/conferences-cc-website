jQuery(function(){
    var $ = jQuery.noConflict();
    
    // Create intersection observer to watch home-content-block elements
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                // First, remove "shown" class from all timeline-image elements
                $('.timeline-image').removeClass('shown');
                $('.timeline-content').removeClass('active');
                // Extract the number from the content block ID (e.g., "timeline-content-1" -> "1")
                const blockId = entry.target.id;
                const blockNumber = blockId.match(/\d+/)[0];
                // Add "shown" class to the corresponding timeline-image
                const timelineImage = document.getElementById(`timeline-image-${blockNumber}`);
               document.getElementById(blockId).classList.add('active');
                if (timelineImage) {
                    timelineImage.classList.add('shown');
                }
            }
        });
    }, {
        threshold: 1, // Trigger when 10% of the element is visible
        rootMargin: '0px 0px -50% 0px' // Trigger when element is 100px from top of viewport
    });
    
    // Observe all timeline-content elements
    $('.timeline-content').each(function() {
        observer.observe(this);
    });
    
    
});
 document.addEventListener('DOMContentLoaded', function() {
let collageArr = [
    './images/about-6.webp',
    './images/about-2.webp',
    './images/about-3.webp',
    './images/about-4.webp',
    './images/about-5.webp',
    './images/about-1.webp',
    './images/about-7.webp',
    './images/about-8.webp'
];
// randomly shuffle the collage images on page load
function shuffleCollage() {
    for (let i = collageArr.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [collageArr[i], collageArr[j]] = [collageArr[j], collageArr[i]];
    }
}
shuffleCollage();
console.log('Shuffled Collage Array:', collageArr); // Log the shuffled array to verify
var collageHtml = '';
collageArr.forEach((src, index) => {
    collageHtml += `<div class="image__wrapper"><img src="${src}" loading="lazy" width="267" height="445" alt="ASF Events"></div>`;
});
document.getElementById('about-collage').innerHTML = collageHtml;
});