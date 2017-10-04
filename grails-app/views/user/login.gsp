<!DOCTYPE html>
<html>
<head>
	<meta name='layout' content='main'/>
	<link rel="stylesheet" href="${resource(dir:'css',file:'user.css')}" />
</head>

<body>
	<div class="login-container" style="width: 100%;">
		<div id = "one" style="width: 100%" >
            
            <div class="login-form col-md-4 col-md-offset-4 ">         
                <g:form action="authenticate" method="post" class="form-horizontal">
                    <input type="text" id="email" name="email" class=" login-field" autocomplete="off" placeholder="Email"/>
					<input type="password" id="password" name="password" class=" login-field" autocomplete="new-password" placeholder="Password"/>
					<input type="submit" value="Sign in" class="btn login-btn"/>
                </g:form>

                <div class="register-notif" style="height: auto;width: 100%">
					No account? <g:link action="create" style="font-weight:600;color:white">Register</g:link></div>
				</div>
            </div>

        </div>
	</div>
</body>
</html>