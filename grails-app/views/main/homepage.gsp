<%@ page import="roomcheat.Hotel" %>
<!doctype html>
<html>
<head>
	<link rel="stylesheet" href="${resource(dir:'css',file:'homepage-main.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'search-box.css')}" />
	<script type="text/javascript" src="${resource(dir:'js',file:'plugins/modernizr.js')}"></script>

    <!-- COOKIES FOR SEARCHBOX-->
    <script type="text/javascript">
    
        function getCookie(name){
            var re=new RegExp(name+"=([^;]+)");
            var value=re.exec(document.cookie);return(value!=null)?unescape(value[1]):null;
        }

        var today=new Date();
        var expiry=new Date(today.getTime()+30*24*3600*1000);
        var expired=new Date(today.getTime()-24*3600*1000);

        function setCookie(name,value){
            document.cookie=name+"="+escape(value)+"; path=/; expires="+expiry.toGMTString();
        }
        function deleteCookie(name){
            document.cookie=name+"=null; path=/; expires="+expired.toGMTString();
        }
        function storeValues(form){
            setCookie("query",form.query.value);
            return true;
        }
    </script>

    <!-- DATEPICKER -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
    <script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
</head>

<body>
    <section class="section-1 cd-section visible">
        <div class="ATF">
            <g:form name="form" controller="hotel" action="search" class="search-box-container" onsubmit="return storeValues(this);">
                <div class="search-box-cont-inner">
                    <fieldset>
                        <div class="col-md-12 city-wrapper">
                            <label class="city-label">Where?</label>
                            <input type="text" class="city-search" placeholder="e.g. city, region, district" autocomplete="off" name="query" value="${query}">

                        </div>

                        <div class="col-md-12 search-details">

                            <div class="col-md-3 checkin-wrapper">
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

                            <div class="col-md-3 checkout-wrapper">
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

                            <div class="col-md-3 guests-wrapper">
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

                            <div class="search-cont col-md-3">
                                <label class="guests-label" style="visibility: hidden;">Search</label>
                                <g:actionSubmit action="search" class=" btn search-button" value = "Search"/>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </g:form>
        </div>
    </section>

    <div class="section-2">
        <div class="section-2-1">
            <div class="content-super">
                <div class="content-row row">
                    <div class="col-md-4 content-col">
                        <div class="main-icons"><img class="main-icon" src="${createLinkTo(dir:'images', file:'search.svg')}"/></div>
                        <div class="title">Search</div>
                        <div class="text-content">Over 1,200,000 Hotels, Apartments and Hostels.</div>
                    </div>
                    
                    <div class="col-md-4 content-col">
                        <div class="main-icons"><img class="main-icon" src="${createLinkTo(dir:'images', file:'compare.svg')}"/></div>
                        <div class="title">Compare</div>
                        <div class="text-content">By price, location, rating and more.</div>
                    </div>
                    
                    <div class="col-md-4 content-col">
                        <div class="main-icons"><img class="main-icon" src="${createLinkTo(dir:'images', file:'save.svg')}"/></div>
                        <div class="title">Save</div>
                        <div class="text-content">By finding the best price for your ideal hotel.</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="section-2-2">
            <div class="title2">Top Destinations</div>

            <div class="row destination-row">
                <div class="col-md-2 dest-col">
                    <img class="destination-image" src="https://a0.muscache.com/4ea/air/r:w284-h426-sfit,e:fjpg-c75/pictures/5be8a4f2-0aab-4bb8-b892-61527da7b550.jpg">
                </div>
                
                <div class="col-md-2 dest-col">
                    <img class="destination-image" src="https://a0.muscache.com/4ea/air/r:w284-h426-sfit,e:fjpg-c75/pictures/d915ce17-d822-426d-b549-0c7b641fec56.jpg">
                </div>
                
                <div class="col-md-2 dest-col">
                    <img class="destination-image" src="https://a0.muscache.com/4ea/air/r:w284-h426-sfit,e:fjpg-c75/pictures/1d8ecdb4-da01-4d35-9c9e-2ef6ca604eca.jpg">
                </div>

                <div class="col-md-2 dest-col">
                    <img class="destination-image" src="https://a0.muscache.com/4ea/air/r:w284-h426-sfit,e:fjpg-c75/pictures/be1dee1c-2ce7-4efb-aca8-26d47a59514b.jpg">
                </div>

                <div class="col-md-2 dest-col">
                    <img class="destination-image" src="https://a0.muscache.com/4ea/air/r:w284-h426-sfit,e:fjpg-c75/pictures/ebbb24af-52d6-490c-89e9-16cc560140e8.jpg">
                </div>

                <div class="col-md-2 dest-col">
                    <img class="destination-image" src="https://a0.muscache.com/4ea/air/r:w284-h426-sfit,e:fjpg-c75/pictures/7bff51c1-3c35-47a5-a86c-5ea75ab6be6c.jpg">
                </div>
            </div>
            <div class="row destination-row-text">
                <div class="col-md-2 dest-col">
                    <div class="destination-text">San Francisco</div>
                </div>
                
                <div class="col-md-2 dest-col">
                    <div class="destination-text">Paris</div>
                </div>
                
                <div class="col-md-2 dest-col">
                    <div class="destination-text">Tokyo</div>
                </div>

                <div class="col-md-2 dest-col">
                    <div class="destination-text">Florence</div>
                </div>

                <div class="col-md-2 dest-col">
                    <div class="destination-text">London</div>
                </div>

                <div class="col-md-2 dest-col">
                    <div class="destination-text">Los Angeles</div>
                </div>
            </div>
        </div>
    </div>

    <div class="section-3">
        <div class="title3">How it works</div>

        <div class="row section-3-container">
            <div class="col-md-8">
                <div class="video-holder">
                    <video class="video-main" poster = "${createLinkTo(dir:'images', file:'video-thumb.png')}" src = "https://s3-eu-west-1.amazonaws.com/room2book/assets/videos/Room-Cheat-intro.mp4"></video>
                    <img class = "play-button" src="${createLinkTo(dir:'images', file:'play-button.png')}">
                    <img class = "pause-button" src="http://iconshow.me/media/images/ui/ios7-icons/png/512/pause-outline.png">
                </div>
            </div>

            <div class="col-md-4">
                <div class="text-holder">
                    <div class="text-container">
                        <div class="section-3-titles">1. Title</div>
                        <div class="section-3-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt</div>
                    </div>

                    <div class="text-container" style="padding: 10% 0 10% 0;">
                        <div class="section-3-titles">2. Another title</div>
                        <div class="section-3-text">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris </div>
                    </div>

                    <div class="text-container">
                        <div class="section-3-titles">3. One last title</div>
                        <div class="section-3-text">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="section-4">
        <div class="title2">Trending Hotels</div>

        <div class="row recommendations-row">
            <div class="col-md-3 recom-col">
                <img class="hotel-image" src = "https://media-cdn.tripadvisor.com/media/photo-s/07/e9/41/4a/aria-hotel-budapest.jpg">
            </div>
            <div class="col-md-3 recom-col">
                <img class="hotel-image" src = "https://media-cdn.tripadvisor.com/media/photo-o/0c/a8/64/80/rooftop-atardecer.jpg">
            </div>
            <div class="col-md-3 recom-col">
                <img class="hotel-image" src = "https://media-cdn.tripadvisor.com/media/photo-s/0d/90/ad/45/turin-palace-hotel.jpg">
            </div>
            <div class="col-md-3 recom-col">
                <img class="hotel-image" src = "https://media-cdn.tripadvisor.com/media/photo-s/0a/f3/f8/bb/three-bedroom-villa-swimming.jpg">
            </div>
        </div>    

        <div class="row recommendations-row recommendations-text recomm-title">
            <div class="col-md-3 recom-col">Aria Hotel Budapest</div>
            <div class="col-md-3 recom-col">The Serras</div>
            <div class="col-md-3 recom-col">Turin Palace Hotel</div>
            <div class="col-md-3 recom-col">Mandapa</div>
        </div>   
             
        <div class="row recommendations-row recommendations-text recomm-country">
            <div class="col-md-3 recom-col">Budapest, Hungary</div>
            <div class="col-md-3 recom-col">Barcelona, Spain</div>
            <div class="col-md-3 recom-col">Turin, Italy</div>
            <div class="col-md-3 recom-col">Ubud, Indonesia</div>
        </div>  
    </div>

    <script type="text/javascript">if(query = getCookie("query")) document.form.query.value = query;</script>
    <script type="text/javascript" src="${resource(dir:'js',file:'homepage.js')}"></script>

</body>
</html>