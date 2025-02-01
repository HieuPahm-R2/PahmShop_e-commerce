(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);


    // Fixed Navbar
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow');
            } else {
                $('.fixed-top').removeClass('shadow');
            }
        } else {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow').css('top', 0);
            } else {
                $('.fixed-top').removeClass('shadow').css('top', 0);
            }
        } 
    });
    
    
   // Back to top button
   $(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
        $('.back-to-top').fadeIn('slow');
    } else {
        $('.back-to-top').fadeOut('slow');
    }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0:{
                items:1
            },
            576:{
                items:1
            },
            768:{
                items:1
            },
            992:{
                items:2
            },
            1200:{
                items:2
            }
        }
    });


    // vegetable carousel
    $(".vegetable-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0:{
                items:1
            },
            576:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            },
            1200:{
                items:4
            }
        }
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })
    });



    // Product Quantity
    $('.quantity button').on('click', function () {
        let changeAmount = 0;
        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if(button.hasClass('btn-plus')){
            var newVal = parseFloat(oldValue) + 1;
            changeAmount = 1;
        }else{
            if(oldValue > 1){
                var newVal = parseFloat(oldValue) - 1;
                changeAmount = -1;
            }else{
                newVal = 1;
            }
        }
        const input = button.parent().parent().find('input');
        input.val(newVal);
        //get ready for submit form (index)
        const index = input.attr("data-cartDetail-index");
        const el = document.getElementById(`cartDetails${index}.quantity`);
        $(el).val(newVal);
        /**get price to show on jsp */
        const priceNow = input.attr("data-cartDetail-price");
        const id = input.attr("data-cartDetail-id");
        const priceELement = $(`p[data-cartDetail-id='${id}']`);
        if(priceELement){
            const newPrice = +priceNow * newVal;
            priceELement.text(formatCurrency(newPrice.toFixed(2)) + "vnd");
        }
        /**update total cart price */
        const totalPriceElement = $(`p[data-cartTotal-price]`);
        if(totalPriceElement && totalPriceElement.length){
            const currentTotal = totalPriceElement.first().attr("data-cartTotal-price");
            let newTotal = +currentTotal;
            if(changeAmount === 0){
                newTotal = +currentTotal;
            }else{
                newTotal = changeAmount * (+priceNow) + (+currentTotal);
            }
            //reset changeAmount
            changeAmount = 0;
            //update
            totalPriceElement?.each(function (index, element){
                 //update text
                 $(totalPriceElement[index]).text(formatCurrency(newTotal.toFixed(2)) + "vnd")
                 //update data-attr
                 $(totalPriceElement[index]).attr("data-cartTotal-price", newTotal)
                });
            }
        })
    //function convert VND Currency
    function formatCurrency(value){
        const formatter = new Intl.NumberFormat('vi-VN',{
            style: 'decimal',
            minimumFractionDigits: 0, //NO decimal part for whole
        });
        let formatted = formatter.format(value);
        formatted = formatted.replace(/\./g,',');
        return formatted;
    }
})(jQuery);

