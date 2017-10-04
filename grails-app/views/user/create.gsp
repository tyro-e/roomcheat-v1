<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'user.css')}" />
</head>

<body>
	<div class = "login-container">   

        <div id = "one" >
            <div class="login-form col-md-4 col-md-offset-4 ">         
                <g:form action="save" class="form-horizontal" >
                    <div class="preferences-question">Who are you?</div>
                    <input type="text" name="fullName" class=" login-field" autocomplete="off" placeholder="Name"/>
                    <input type="text" name="email" class=" login-field" autocomplete="off" placeholder="Email"/>
                    <input type="password" id="password" name="password" class=" login-field" autocomplete="new-password" placeholder="Password"/>
                    
                    <!--<input type = "submit" name="register" value="Register" class="btn login-btn"/>-->       

                    <div class="arrow-holder">
                        <a id = "scroll-two" class="arrow-forward"><img class="arrow" src = "https://s3.amazonaws.com/roomcheat/assets/images/arrow-forward.svg"></a>
                    </div>                    
                </g:form>
            </div>
        </div>

        <div id="two">
            <div class="login-form col-md-4 col-md-offset-4 "> 
                <g:form action="save" class="form-horizontal" >
                    <div class="preferences-question">What are the last 3 cities you visited?</div>
                    <input type="text" name="city1" class=" login-field" autocomplete="off" placeholder="City #1"/>
                    <input type="text" name="city2" class=" login-field" autocomplete="off" placeholder="City #2"/>
                    <input type="text" name="city3" class=" login-field" autocomplete="off" placeholder="City #3"/>

                    <div class="arrow-holder">
                        <a id = "scroll-one" class="arrow-back"><img class="arrow" src = "https://s3.amazonaws.com/roomcheat/assets/images/arrow-back.svg"></a>
                        <a id = "scroll-three" class="arrow-forward"><img class="arrow" src = "https://s3.amazonaws.com/roomcheat/assets/images/arrow-forward.svg"></a>
                    </div>
                </g:form>
            </div>
        </div>

        <div id="three">
            <div class="login-form col-md-4 col-md-offset-4 "> 
                <g:form action="save" class="form-horizontal">
                    <div class="preferences-question">Your payment details</div>
                    <input type="text" name="city1" class=" login-field" autocomplete="off" placeholder="Card type"/>
                    <input type="text" name="city2" class=" login-field" autocomplete="off" placeholder="Card #"/>
                    <input type="text" name="city3" class=" login-field" autocomplete="off" placeholder="Expiry"/>
                    <input type="text" name="city3" class=" login-field" autocomplete="off" placeholder="CSV"/>
                    
                    <div class="arrow-holder">
                        <a id = "scroll-two" class="scroll-two button arrow-back"><img class="arrow" src = "https://s3.amazonaws.com/roomcheat/assets/images/arrow-back.svg"></a>
                        <a class="arrow-forward"><img class="arrow" src = "https://s3.amazonaws.com/roomcheat/assets/images/check2.svg"></a>
                    </div>
                </g:form>
            </div>


        </div>

    </div>


    <div id="bottom-container">

        <div id="percentage"></div>
    </div>

    <script type="text/javascript">

        $('body').on('click', 'a', function() 
        {
          var target = '#' + this.id.split('-')[1]
          var offsetLeft = $(target).offset().left

          $('html, body').animate({
            scrollLeft: offsetLeft
          }, 350);

        });

    </script>
    <script type="text/javascript" src="https://rawgit.com/kimmobrunfeldt/progressbar.js/master/dist/progressbar.js"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'user.js')}"></script>
</body>
</html>