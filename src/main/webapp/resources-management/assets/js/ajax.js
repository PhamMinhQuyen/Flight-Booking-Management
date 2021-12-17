        // id muốn bắt sự kiện
$('#departure').change(function () {
    var departure = $('#departure').val();
    
    $.ajax({
        url:'/PR38_JV44_Flight_Booking/api-load-fligt-routes',
        type:'get', 
        data: {
            departureId: departure
        },
        success: function (value) { // nhận đc dữ liệu của trang load-flight-routes.jsp
            
            $('#destination').html(value); 
        }
    });
});
//ajax gởi lên, controller nhận về
