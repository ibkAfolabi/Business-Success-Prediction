<%-- 
    Document   : form2
    Created on : Mar 9, 2018, 1:38:11 PM
    Author     : Seniorita Cordelia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page import="java.util.*"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href=" assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href=" assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Get Started</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href=" assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href=" assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href=" assets/css/demo.css" rel="stylesheet" />
</head>

<body class="login-page sidebar-collapse" style="overflow:hidden">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-primary fixed-top navbar-default " color-on-scroll="400">

        <div>
            <img src="assets/img/favicon.ico" alt="" width="30px"> <a class="navbar-brand" href="index.html">
                  DALIA
                </a>

        </div>

        
    </nav>
    <!-- End Navbar -->
    <div class="page-header" filter-color="black">
        <div class="page-header-image" style="background-image:url( assets/img/login2.jpeg)"></div>
        <!-- End Navbar -->
        <div class="section-tab wrapper container">
            <div class="section container col-md-6" data-background-color="orange" style="top:10px">
                <div class="col-md-12">
                    <div class="card card-plain">
                        <form class="container" method="" action="">
                            <div class="header header-primary text-center">
                                <div class="logo-container">
                                    <!-- <img src=" assets/img/favicon.ico" alt=""> -->
                                    <h6> AGREEMENT</h6>
                                    <div class="space-10"></div>
                                </div>
                            </div>
                            <div class="content">
                                <h6 class> What do you define success to be?
                                </h6>
                                <div class="input-group form-group-no-border input-group-lg justify-content-center">
                                    <!-- <span class="input-group-addon">
                                    <i class="now-ui-icons users_circle-08"></i>
                                </span> {% endcomment %}-->
                                    <input type="text" class="form-control" placeholder="">
                                </div>
                                <div class="space-10"></div>
                                <h6> Do you want to know if your business will be successful....if yes click the button below </h6>
                                <div class="input-group form-group-no-border input-group-lg justify-content-center">
                                    <!-- <span class="input-group-addon">
                                    <i class="now-ui-icons users_circle-08"></i>
                                </span> {% endcomment %}-->
                                    <a class="btn btn-primary" href="form3.html">CLICK</a>
                                </div>

                            </div>
                            <h6> Do you want to know how long your business will succeed....if yes click the button below </h6>
                            <div class="input-group form-group-no-border input-group-lg justify-content-center">
                                <!--<span class="input-group-addon">
                                    <i class="now-ui-icons users_circle-08"></i>
                                </span>-->
                                <a class="btn btn-primary" href="form3.html">CLICK</a>
                            </div>

<%
 String email =request.getParameter("email");
 String pass =request.getParameter("password");
         
 //String get= "INSERT INTO login VALUES(NULL,'"+email+"','"+pass+"')";
     try{
Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/form1?zeroDateTimeBehavior=convertToNull","root","password");
Statement st=conn.createStatement();

//st.executeUpdate(get);
conn.setAutoCommit(true);
ResultSet res = st.executeQuery("SELECT * FROM  account WHERE email = '"+email+"' AND password ='"+pass+"'");
       // ResultSet res2 = st.executeQuery("SELECT * FROM  form_2");
        while (res.next()){
        String dbemail=res.getString("email").trim(); 
        String dbpasss=res.getString("password").trim();
        boolean entrance;
        entrance = false;
        if ((email.equals(dbemail)) &&(pass.equals(dbpasss)))
        {
          entrance = true;  
        }
        else{
            entrance = false;
            out.println("<h3>sorry, invalid detals</h3>");
        }
        if(entrance==true)
        {%>
                <jsp:forward page="form2.jsp"/><%}
        else{%>
        <jsp:forward page="login.html"/>
<%
        }
        }
     }
catch (Exception e){  
out.println(e.getMessage());
}
     
%>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container">
                <div class="copyright">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>, Designed by
                    <a href="#" target="_blank">D</a>.
                    <a href="#" target="_blank">A</a>.
                </div>
            </div>
        </footer>
    </div>
    
</body>
<!--   Core JS Files   -->
<script src=" assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src=" assets/js/core/popper.min.js" type="text/javascript"></script>
<script src=" assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src=" assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src=" assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src=" assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src=" assets/js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>

</html>

