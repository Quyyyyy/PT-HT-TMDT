<%-- 
    Document   : register
    Created on : May 12, 2023, 9:52:55 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký</title>

    <meta charset="utf-8">

    <link rel="stylesheet" type="image/png" href="https://gokisoft.com/uploads/2021/03/s-568-ico-web.jpg">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-image: url(img/e-commerce.jpg);
        background-size: cover; background-repeat: no-repeat;">
    <div class="container">
        <div class="panel panel-primary" style="width:500px; margin: 0px auto; margin-top: 50px; 
        background-color: white; padding: 10px; border-radius: 5px; box-shadow: 2px 2px #9ac9f5;">
            <div class="panel-heading">
                <h2 class="text-center">Đăng Ký Tài Khoản</h2>
                <% 
                    String $msg  = (String) request.getAttribute("error");
                    if($msg != null){
                %>
                <h4 style="color:red" class="text-center"><%=$msg%></h4>
                <%
                    }
                %>
            </div>
            <div class="panel-body">
                <form action="register" method="post" onsubmit="return validateForm();">
                    <div class="form-group">
                      <label for="usr">Họ & Tên:</label>
                      <input required="true" type="text" class="form-control" id="usr" name="fullname" value="">
                    </div>
                    <div class="form-group">
                      <label for="email">Email:</label>
                      <input required="true" type="email" class="form-control" id="email" name="email" value="">
                    </div>
                   <!--  <div class="form-group">
                      <label for="birthday">Số Điện Thoại:</label>
                      <input type="date" class="form-control" id="birthday" name="birthday">
                    </div> -->
                    <div class="form-group">
                      <label for="pwd">Mật Khẩu: </label>
                      <input required="true" type="password" class="form-control" id="pwd" name="password" minlength="6">
                    </div>
                    <div class="form-group">
                      <label for="confirmation_pwd">Xác Minh Mật Khẩu:</label>
                      <input required="true" type="password" class="form-control" id="confirmation_pwd" name="confirmation_pwd" minlength="6">
                    </div>
                    <!-- <div class="form-group">
                      <label for="address">Địa Chỉ:</label>
                      <input type="text" class="form-control" id="address" name="address">
                    </div> -->
                    <p>
                        <a href="login.jsp">Tôi đã có tài khoản</a>
                    </p>
                    <button class="btn btn-success">Đăng Ký</button>
                </form>
            </div>
        </div>
    </div>
<script type="text/javascript">
    function validateForm() {
        $pwd = $('#pwd').val();
        $confirmPwd = $('#confirmation_pwd').val();
        if($pwd != $confirmPwd){
            alert("Mật khẩu không khớp, vui lòng kiểm tra lại")
            return false
        }
        return true
    }
</script>
</body>
</html>
