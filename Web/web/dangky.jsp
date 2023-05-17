<%-- 
    Document   : dangky
    Created on : May 15, 2023, 1:24:18 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/logonho.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/dang-nhap.css">
    <title>MBShop</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-menu">
        <div class = "Menu">
            <div class="logo">
                <a href="index"> <img src="img/logo.png" style="width: 100%; margin-top: 3px;"> </a>
            </div>
            <div class="search">
                <input type="text" placeholder="Bạn cần tìm gì?">
                <button type="submit" class="btn-search">
                    <i class="fa fa-search" aria-hidden="true"></i>
                </button>
            </div>
            <ul class="topnav">
                <li>
                    <a href="index">
                        <i class="fa fa-home" aria-hidden="true"></i>
                        <p>Trang chủ</p>
                    </a>
                </li>
                <li>
                    <a href="category">
                        <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                        <p>Sản phẩm</p> 
                    </a>
                </li>
                <li>
                    <a href="login">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        <p>Giỏ hàng</p>
                    </a>
                </li>
                <li>
                    <a href="intro.jsp">
                        <i class="fa fa-info-circle" aria-hidden="true"></i>
                        <p>Giới thiệu</p>
                    </a>
                </li>
                <li>
                    <a href="login">
                        <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                        <p>Đăng nhập</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-body">
        <form action="register" class="form-login" id="form-1" method="post" onsubmit="return validateForm();">
            <div class="form-content">
                <div class="form-header">
                    <p>MBShop</p>
                </div>
                <div class="form-body">
                    <div class="form-group">
                        <label for="usr" class="form-label">Họ và tên</label>
                        <input required="true" type="text" class="form-control" id="usr" name="fullname" placeholder="VD: Nguyễn Văn A" value="" >
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group">
                        <label for="email" class="form-label">Email</label>
                        <input required="true" type="email" class="form-control" id="email" name="email" placeholder="VD: nguyena@gmail.com" value="">
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input required="true" type="password" class="form-control" id="pwd" name="password" minlength="6" placeholder="Nhập mật khẩu">
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group">
                      <label for="confirmation_pwd" class="form-label">Xác Minh Mật Khẩu:</label>
                      <input required="true" type="password" class="form-control" id="confirmation_pwd" name="confirmation_pwd" minlength="6">
                      <span class="form-message"></span>
                    </div>
                </div>
                <% 
                    String er  = (String) request.getAttribute("error");
                    if(er != null){
                    %>
                    <p style="color:red"><%= er %></p>
                    <%
                        }
                    %>
                    <p>
                        <a href="login" style="margin-top:50x;color:blue">Tôi đã có tài khoản</a>
                    </p>
                <div class="form-footer">                  
                    <button class="form-submit">ĐĂNG KÝ</button>
                </div>
                
            </div>
        </form>
    </div>
    <div class="footer">
        <div class="plc">
            <ul class="flex-contain">
                <li>Giao hàng hỏa tốc trong 1 giờ</li>
                <li>Thanh toán linh hoạt: tiền mặt, visa / master, trả góp</li>
                <li>Trải nghiệm sản phẩm tại nhà</li>
                <li>Lỗi đổi tại nhà trong 1 ngày</li>
                <li>Hỗ trợ suốt thời gian sử dụng.
                    <br>Hotline:
                    <a href="tel:12345678" style="color: #288ad6;">12345678</a>
                </li>
            </ul>
        </div>
        <div class="main-footer">
            <div class="container-main-footer">
                <div class="about-us">
                    <p style="font-size: 19px; font-weight: 600; margin: 11px 0px -6px 0px;">Về chúng tôi</p>
                    <p style="line-height: 1.4;">MBShop là chuỗi cửa hàng điện thoại uy tín, chất lượng hàng đầu Việt Nam.
                    </p>
                    <div class="mxh">
                        <i class="fa fa-facebook-square" aria-hidden="true"></i>
                        <i class="fa fa-instagram" aria-hidden="true"></i>
                        <i class="fa fa-youtube-play" aria-hidden="true"></i>
                        <i class="fa fa-twitter-square" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="information">
                    <p style="font-size: 19px; font-weight: 600; margin: 11px 0px -6px 0px;">Thông tin</p>
                    <ul>
                        <li><a href="index.html">Trang chủ</a></li>
                        <li style="margin: 6px 0px 6px 0px;"><a href="danh-muc-sp.html">Sản phẩm</a></li>
                        <li style="margin: 6px 0px 6px 0px;"><a href="gio-hang.html">Giỏ hàng</a></li>
                        <li><a href="gioi-thieu.html">Giới thiệu</a></li>
                    </ul>
                </div>
                <div class="contact-us">
                    <p style="font-size: 19px; font-weight: 600; margin: 11px 0px -6px 0px;">Liên hệ</p>
                    <div class="contact-us-ele">
                        <i class="fa fa-map-marker" aria-hidden="true" style="margin-top: 10px; zoom: 1.7;"></i>
                        <p>96A Trần Phú, P. Mộ Lao, Hà Đông, Hà Nội</p>
                    </div>
                    <div class="contact-us-ele">
                        <i class="fa fa-envelope" aria-hidden="true" style="margin: 0px 12px 0px 0px; zoom: 1.2;"></i>
                        <p style="margin-top: 1px;">mbshop@gmail.com</p>
                    </div>
                    <div class="contact-us-ele">
                        <i class="fa fa-phone" aria-hidden="true" style="zoom: 1.6;"></i>
                        <p style="margin-top: 2px;">0123456789</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        <p>Copyright © 2022 by Team 14</p>
    </div>
<!--<script src="js/index.js"></script>  -->
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
<style>
    .main-body{
    padding: 140px 0px 50px 0px;
}
.form-login {
    width: 360px;
    border: 1px solid gray;
    border-radius: 4px;
    margin: 0 auto;
    font-family: 'Open Sans', 'Helvetica Neue', sans-serif;
    border: none;
}
.heading{
    text-align: center;
}
.desc{
    text-align: center;
}
.form-content {
    margin: 20px;
}
.form-header p{
    font-size: 40px;
    text-align: center;
    font-weight: 700;
    color: #151f3c;
    margin-bottom: 8px;
}
.form-group{
    display: grid;
}
.form-label{
    padding-bottom: 6px;
    padding-top: 14px;
    font-weight: bold;
    font-size: 14px;
}
.form-group input{
    padding: 16px 12px;
    font-size: 16px;
    border: none;
    background: #837c7c1f;
}
.form-group input:focus{
    outline: none;
}
.form-footer{
    text-align: center;
    margin-top: 35px;
}
.form-submit{
    background-color: #151f3c;
    outline: none;
    font-weight: 600;
    cursor: pointer;
    border: none;
    color: #fff;
    width: 100%;
    padding: 12px 16px;
    border-radius: 8px;
    font-size: 17px;
    height: 50px;
}
.text-footer{
    display: flex;
    font-size: 15px;
}
.text-footer a{
    margin: 14.5px 10px;
    color: #4060bd;
}
</style>
</body>
</html>
