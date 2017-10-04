<!doctype html>
<html>
<head>
    <title>Room Cheat</title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

    <!-- FONT -->
    <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
    <g:layoutHead/>
</head>

<body data-hijacking="off" data-animation="parallax">
   <!-- NAVBAR -->
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li style="float: left;"><g:link controller = "main" style="font-size: 18px;font-weight: 600;color:#43b988">ROOM CHEAT</g:link></li>
            <li style="float: right;">
                <g:if test="${session.user==null}">
                    <g:link controller="user" action="login">LOGIN</g:link>
                </g:if>

                <g:if test="${session.user!=null}">
                    <g:link controller="user" action="logout" style="text-transform: uppercase">LOGOUT ${session.user.fullName}</g:link>
                </g:if>
            </li>
            <li style="float: right;"><a>TAB 3</a></li>
            <li style="float: right;"><a>TAB 2</a></li>
            <li style="float: right;"><a>TAB 1</a></li>
        </ul>
    </nav>

    <g:layoutBody/>

    <div class="footer">
        <a href="https://www.fb.com" target="_blank"><img class="footer-icon" src="${createLinkTo(dir:'images', file:'facebook.png')}"/></a>
        <a href="https://www.twitter.com" target="_blank"><img class="footer-icon" src="${createLinkTo(dir:'images', file:'twitter.png')}"/></a>
        <a href="https://www.linkedin.com" target="_blank"><img class="footer-icon" src="${createLinkTo(dir:'images', file:'linkedin.png')}"/></a>
        <a href="https://www.instagram.com" target="_blank"><img class="footer-icon" src="${createLinkTo(dir:'images', file:'instagram.png')}"/></a>
        <a href="https://www.youtube.com" target="_blank"><img class="footer-icon" src="${createLinkTo(dir:'images', file:'youtube.png')}"/></a>
    </div> 

    <script type="text/javascript" src='http://cdn.renderedfont.com/js/renderedfont-0.8.min.js#free'></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'plugins/velocity.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'plugins/velocity.ui.min.js')}"></script>
</body>
</html>