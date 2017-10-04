$(window).load(function (){
  getLongitudeAndLatitude();
  buildMap();
});

$(function (){
    $('#datetimepicker6').datetimepicker({
      format: 'DD/MM/YYYY'
    });
    $('#datetimepicker7').datetimepicker({
        useCurrent: false,
        format: 'DD/MM/YYYY'
    });
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
});

// price slider & filters
$("#ex2").slider({});
$('.dropdown-toggle').dropdown();

$('.dropdown-menu').click(function(e) {
    e.stopPropagation();
});

var LongAndLat = "";

function getLongitudeAndLatitude(){
  $.ajax(
  {
    type: "GET",
    url: getLongAndLatAction,

    success: function(LongAndLat){
      buildMap(LongAndLat);
    }
  });
}

function buildMap(LongAndLat){
  var map;
  var icon = "https://s3.amazonaws.com/roomcheat/assets/images/roomcheatlogo.png";

  map = new google.maps.Map(document.getElementById('map'), {     
    zoom: 12,
    scrollwheel: false,
    clickableIcons: false,
    disableDefaultUI: true
  });  

  // geocoder for searching location and map moving to it
  var geocoder = new google.maps.Geocoder();
  geocodeAddress(geocoder, map);

  document.getElementById('submit').addEventListener('click', function() {
      geocodeAddress(geocoder, map);
  });

  // Split and remove some characters from string
  LongAndLat = LongAndLat.replace(/\'/g, '');
  console.log(LongAndLat)

  var parts = LongAndLat.split(/[[\]]{1,2}/);
  parts.length--;
  console.log(parts);

  // Array of hotel details in an array of hotels
  var location = [];
  var locations = [location];

  for (i = 0; i < parts.length; i++) 
  {
    locations.push(parts[i].split(","));
  }

  var infowindow = new google.maps.InfoWindow();
  var marker, i;

  for (i = 0; i < locations.length; i++) {  

    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i][4], locations[i][5]),
      icon: icon,
      map: map
    });

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {

        var contentString = 
        '<div class = "popup-container"><div class = "popup-image-container"><img class = "popup-image" src = "' + locations[i][0] + '"></div><div class = "popup-body"><div class = "popup-details"><div class="popup-title"><div class = "popup-name"> ' + locations[i][1] + ' </div><div class = "popup-price">£' + locations[i][3] + ' per night</div></div><div class = "popup-info"> ' + locations[i][2] +' </div></div><div class = "popup-book"><div class = "btn popup-button" data-toggle="modal" data-target="#smallModal">Book</div></div></div></div>';

        infowindow.setContent(contentString);
        infowindow.open(map, marker);

        // pass locations data to bookHotel function upon click
        var bookButton = $('.popup-button');
        bookButton.click(function() {
          bookHotel(locations, i);
        });

      }
    })(marker, i));

    google.maps.event.addListener(map, 'click', function() {
      infowindow.close();
    });

    // override some google maps styles
    google.maps.event.addListener(infowindow, 'domready', function() {
        var iwOuter = $('.gm-style-iw');
        var iwBackground = iwOuter.prev();
        // Removes background shadow DIV
        iwBackground.children(':nth-child(2)').css({'display' : 'none'});
        // Removes white background DIV
        iwBackground.children(':nth-child(4)').css({'display' : 'none'});
        // Moves the infowindow to the right.
        iwOuter.parent().parent().css({left: '89px'});
        // Moves the shadow of the arrow to the left margin.
        iwBackground.children(':nth-child(1)').attr('style', function(i,s){ return s + 'left: 76px !important;'});
        // Moves the arrow 76px to the left margin.
        iwBackground.children(':nth-child(3)').attr('style', function(i,s){ return s + 'left: 76px !important;'});
        // Changes the desired tail shadow color.
        iwBackground.children(':nth-child(3)').find('div').children().css({'box-shadow': 'rgba(72, 181, 233, 0.6) 0px 1px 6px', 'z-index' : '1'});

        // Reference to the div that groups the close button elements.
        var iwCloseBtn = iwOuter.next();
        // the close button
        iwCloseBtn.css({display: 'none'});
        /* iwCloseBtn.css({opacity: '1', right: '38px', top: '3px', border: '7px solid #48b5e9', 'border-radius': '13px', 'box-shadow': '0 0 5px #3990B9'});
        iwCloseBtn.mouseout(function(){
          $(this).css({opacity: '1'});
        });*/

        // If the content of infowindow not exceed the set maximum height, then the gradient is removed.
        if($('.iw-content').height() < 140){
          $('.iw-bottom-gradient').css({display: 'none'});
        }
    });
  }

  console.log(locations);
}

function bookHotel(locations, i){

  var bookHotelModal = 
  '<div class="modal fade" id="smallModal" role="dialog" aria-labelledby="smallModal" aria-hidden="true">' +
         ' <div class="modal-dialog modal-sm">' +
            ' <div class="modal-content">' +

              ' <div class="modal-header">' +
                ' <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' +
                ' <h4 class="modal-title" id="myModalLabel">Confirm Booking</h4>' +
              ' </div>' +

              ' <div class="modal-body" style="padding: 0 0 30px 0;">' +
                ' <div class="popup-field-header">' +
                  '   <div class="hotel-title-popup">'+ locations[i][1] +'</div>' +
                    ' <div class="hotel-title-rating">⋆⋆⋆⋆⋆</div>' +
                ' </div>' +
                ' <div class="popup-fields">' +
                  '   <div class="popup-field" style="border: none;padding: 5px 0;">' +
                    '     <div class="popup-field-title GUEST">Guest Name</div>' +
                      '   <div class="popup-field-text">Brian Reeves</div>' +
                    ' </div>' +

                    ' <div class="popup-field">' +
                      '   <div class="popup-times">' +
                        '     <div class="popup-field-title CHECKIN">Check-in</div>' +
                          '   <div class="popup-field-text">Wed, 11 Feb </div>' +
                        ' </div>' +

                        ' <div class="popup-times">' +
                          '   <div class="popup-field-title CHECKIN">Check-out</div>' +
                            ' <div class="popup-field-text">Thurs, 12 Feb </div>' +
                        ' </div>' +
                    ' </div>' +

                    ' <div class="popup-field">' +
                      '   <div class="popup-field-title ROOMTYPE">Room Type</div>' +
                        ' <div class="popup-field-text">Room with 1 bed</div>' +
                    ' </div>' +

                    ' <div class="popup-field">' +
                      '   <div class="popup-field-title ROOMPRICE">Room (1 Night)</div>' +
                        ' <div class="popup-field-text">£' + locations[i][3] + '</div>' +
                    ' </div>' +

                    ' <div class="popup-field">' +
                      '   <div class="popup-field-title PAYMENT">Payment Method</div>' +
                        ' <div class="popup-field-text">Visa 1234</div>' +
                    ' </div>' +

                    ' <div class="popup-field">' +
                      '   <div class="popup-field-title TOTAL">Total</div>' +
                        ' <div class="popup-field-text" style="font-weight: 600">£' + locations[i][3] + '</div>' +
                    ' </div>' +
                ' </div>' +
              ' </div>' +

              ' <div class="modal-footer" style="border: none;">' +
                ' <button type="button" class="btn popup-button confirm-booking" data-dismiss="modal" >Confirm</button>' +
              ' </div>' +

            ' </div>' +
          ' </div>' +
        ' </div>';

  // append modal to body
  $('body').append(bookHotelModal);

  // remove modal after clicking x or book button
  $('.close, .confirm-booking').click(function(){
    $('#smallModal').remove();
    $('body').removeClass('modal-open');
    $('body').css('padding-right','0');

  });
}

function leaveFeedback(locations, i){
}

function geocodeAddress(geocoder, resultsMap) {
  var address = document.getElementById('city-search').value;

  geocoder.geocode({'address': address}, function(results, status){

    if (status === 'OK') {
      resultsMap.setCenter(results[0].geometry.location);
    } 

    else {
      alert('Unsuccessful: ' + status);
    }
  });
}
