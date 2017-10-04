<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'search.css')}" />

        <!-- PRICE SLIDER-->
        <script src = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.8.1/bootstrap-slider.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.8.1/css/bootstrap-slider.css">
        
        <!-- DATEPICKER -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        <script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>

        <script type="text/javascript">
            function getCookie(name){
                var re=new RegExp(name+"=([^;]+)");
                var value=re.exec(document.cookie);
                return(value!=null)?unescape(value[1]):null;
            }
        </script>
    </head>

    <body>
        <div class="main-container">

            <div class="list-container">
                <!-- FILTERS / SEARCHBOX -->
                <div class="filters-container">
                    <div class="filters-container-inner">
                        <!-- SEARCH BOX -->
                        <g:form name="form" class="search-box-container">
                            <div class="search-box-cont-inner">
                                <fieldset>
                                    <div class="col-md-3 city-wrapper">
                                        <label class="city-label">Where?</label>
                                        <input type="text" class="city-search" id ="city-search" placeholder="e.g. city, region, district" autocomplete="off" name="query" value="${query}">
                                    </div>

                                    <div class="col-md-2 checkin-wrapper">
                                        <label class="checkin-label">Check-in</label>
                                        <div class="form-group">
                                            <div class='input-group date' id='datetimepicker6'>
                                                <input type='text' class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-2 checkout-wrapper">
                                        <label class="checkout-label">Check-out</label>
                                            <div class="form-group">
                                            <div class='input-group date' id='datetimepicker7'>
                                                <input type='text' class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-2 guests-wrapper">
                                        <label class="guests-label">Guests</label>

                                        <select class="guests-select">
                                            <option value="1-1">1 adult</option>
                                            <option selected="selected" value="2-1">2 adults in 1 room</option>
                                            <option value="3-1">3 adults in 1 room</option>
                                            <option value="4-1">4 adults in 1 room</option>
                                            <option value="2-2">2 adults in 2 rooms</option>
                                            <option value="0">More options...</option>
                                         </select>
                                    </div>

                                    <div class="col-md-3 search-cont">
                                        <label class="guests-label" style="visibility: hidden;">Search</label>
                                        <input id = "submit" class=" btn search-button" value = "Search"/>
                                    </div>
                                    
                                </fieldset>
                            </div>
                        </g:form>

                        <!-- FILTERS BAR -->
                        <div class="filters-bar">
                            <div class="filters-wrapper">
                                <div class="price-range-select filters-select">
                                    Price range: <b>€ 10</b> 
                                        <input id="ex2" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="5" data-slider-value="[250,450]"/> 
                                    <b>€ 1000</b>                                                  
                                </div>
                                
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Filters</button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <div class="checkbox">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Breakfast
                                            </label>
                                        </div>

                                        <div class="checkbox">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">WiFi
                                            </label>
                                        </div>

                                        <div class="checkbox">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Parking
                                            </label>
                                        </div>

                                        <div class="checkbox">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Gym
                                            </label>
                                        </div>

                                        <div class="checkbox">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Pool
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- HOTEL LIST -->
                <div id="list-hotel" class="content scaffold-list" role="main" style="padding: 50px 0;">
                    <f:table collection="${hotelList}" />

                    <div class="pagination">
                        <g:paginate total="${hotelCount ?: 0}" />
                    </div>
                    <a href="#" class="btn btn-lg btn-danger" data-toggle="modal" data-target="#basicModal">Feedback</a>
                </div>
            </div>
            

            <!-- MAP -->
            <div class="map-container">
                <div id="map">
            </div>

        </div>

        <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog" style="width: 450px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">HOTEL NAME</h4>
                    </div>
                    <div class="modal-body" style="padding: 0;">
                    
                        <div class="feedback-image-holder">
                            <img class="feedback-image" src = "https://t-ec.bstatic.com/images/hotel/max500/630/63073963.jpg">
                        </div>

                        <div class="form-group" style="margin: 0;padding: 15px;">
                            <label for="comment">Feedback:</label>
                            <textarea class="form-control" rows="3" id="comment"></textarea>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-danger feedback-btn" data-dismiss="modal" style="float: left;">
                            <span class="glyphicon glyphicon-thumbs-down"></span> 
                        </a>

                        <a href="#" class="btn btn-success feedback-btn" data-dismiss="modal" style="float: right;">
                            <span class="glyphicon glyphicon-thumbs-up"></span> 
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">if(query = getCookie("query")) document.form.query.value = query;</script>
        <script src="${resource(dir:'js', file:'search.js')}" type="text/javascript"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPPFxf8JyiTirmJeZvOWSW4z6NePOuEaU"></script>
        <g:javascript>var getLongAndLatAction = "${createLink(controller:'hotel', action:'getLongitudeAndLatitude')}"</g:javascript>
    </body>
</html>