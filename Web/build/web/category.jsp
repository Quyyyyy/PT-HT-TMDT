<%-- 
    Document   : category
    Created on : May 14, 2023, 6:06:41 PM
    Author     : HP
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/logonho.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/danh-muc-sp.css">
        <link rel="shortcut icon" href="https://t004.gokisoft.com/uploads/2021/07/1-s-1637-ico-web.jpg">

        
        <title>MBShop</title>
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
                <%
                        Users tmp = (Users) session.getAttribute("account");
                        if (tmp != null) {
                    %>
                <li>
                    <a href="cart.jsp">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        <p>Giỏ hàng</p>
                    </a>
                </li>
                <%
                    } else {
                %>
                <li>
                    <a href="login">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        <p>Giỏ hàng</p>
                    </a>
                </li>
                <%
                    }
                %>                   
                    
                <li>
                    <a href="intro.jsp">
                        <i class="fa fa-info-circle" aria-hidden="true"></i>
                        <p>Giới thiệu</p>
                    </a>
                </li>                    
                    
                <%
                    if (tmp != null) {                
                %>
                <li>
                    <a href="logout">
                        <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                        <p>Đăng xuât</p>
                    </a>
                </li>
                <%
                    } else {
                %>
                <li>
                    <a href="login">
                        <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                        <p>Đăng nhập</p>
                    </a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
    <a onclick="topFunction()" id="back-to-top" title="Go to top">
        <div class="top">
            <i class="fa fa-lg fa-chevron-up" aria-hidden="true" style="zoom: 0.75;"></i>
        </div>
    </a>
        <div class="slideshow-container">

            <div class="mySlides fade">
                <img src="img/banners/banner4.png" style="width:100%">
            </div>

            <div class="mySlides fade">
                <img src="img/banners/banner8.png" style="width:100%">
            </div>

            <div class="mySlides fade">
                <img src="img/banners/banner7.png" style="width:100%">
            </div>
            <div class="mySlides fade">
                <img src="img/banners/banner9.png" style="width:100%">
            </div>
            <div class="mySlides fade">
                <img src="img/banners/banner6.png" style="width:100%">
            </div>

        </div>
        <br>
        <div style="text-align:center">
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
        </div>
        <div class="banner">
            <a href="#"> <img src="img/banners/blackFriday.gif" style="width:100%"> </a>
        </div>  
        <div class="company-menu">
            <div class="company-menu-line">
                <a href="#" onclick="layUrl('thuong-hieu', 'apple')"><img src="img/company/Apple.jpg"></a>
                <a href="#" onclick="layUrl('thuong-hieu', 'coolpad')"><img src="img/company/Coolpad.png"></a>
                <a href="#" onclick="layUrl('thuong-hieu', 'xiaomi')"><img src="img/company/Xiaomi.png"></a>
                <a href="#" onclick="layUrl('thuong-hieu', 'huawei')"><img src="img/company/Huawei.jpg"></a>
            </div>
            <div class="company-menu-line">
                <a href="#" onclick="layUrl('thuong-hieu', 'samsung')"><img src="img/company/Samsung.jpg"></a>
                <a href="#" onclick="layUrl('thuong-hieu', 'oppo')"><img src="img/company/Oppo.jpg"></a>
                <a href="#" onclick="layUrl('thuong-hieu', 'nokia')"><img src="img/company/Nokia.jpg"></a>
                <a href="#" onclick="layUrl('thuong-hieu', 'realme')"><img src="img/company/Realme.png"></a>
            </div>
        </div>
        <div class="button-container">
            <div class="dropdown">
                <button class="all">Giá bán</button>
                <div class="dropdown-content">
                    <a href="#" onclick="layUrl('gia', 'duoi2trieu')">Dưới 2 triệu</a>
                    <a href="#" onclick="layUrl('gia', 'tu2den4trieu')">Từ 2 - 4 triệu</a>
                    <a href="#" onclick="layUrl('gia', 'tu4den7trieu')">Từ 4 - 7 triệu</a>
                    <a href="#" onclick="layUrl('gia', 'tu7den13trieu')">Từ 7 - 13 triệu</a>
                    <a href="#" onclick="layUrl('gia', 'tren13trieu')">Trên 13 triệu</a>
                </div>
            </div>
            <div class="dropdown">
                <button class="sale">Khuyến mãi</button>
                <div class="dropdown-content">
                    <a href="#" onclick="layUrl('khuyen-mai', 'giamgia')">Giảm giá</a>
                    <a href="#" onclick="layUrl('khuyen-mai', 'tragop')">Trả góp</a>
                    <a href="#" onclick="layUrl('khuyen-mai', 'moiramat')">Mới ra mắt</a>
                </div>
            </div>
            <div class="dropdown">
                <button class="sort">Sắp xếp</button>
                <div class="dropdown-content">
                    <a href="#" onclick="layUrl('sap-xep', 'giatangdan')">Giá tăng dần</a>
                    <a href="#" onclick="layUrl('sap-xep', 'giagiamdan')">Giá giảm dần</a>
                </div>
            </div>
        </div>
        
        <div class="filter" style="margin-bottom: 20px">

        </div>

        <div class="product-list container">
                <div class="product" style="display: grid; grid-template-columns: auto auto auto auto;">  
                    <%
                         Locale localeVN = new Locale("vi", "VN");
                        NumberFormat df = NumberFormat.getCurrencyInstance(localeVN);
                        ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("data");
                        for(Product i: list) {
                    %>
                                <div class="card" style="margin-bottom:20px">
                                    <div class="product-promo-container">
                                    </div>
                                    <img src="<%=i.getThumbnail()%>" style="width:100%">
                                    </br>
                                    <div class="titlePrice">
                                         <a class="title" href="detail?id=<%=i.getId()%>"><%=i.getTitle()%></a>
                                         <p class="price"><%=df.format(i.getDiscount())%> </p>
                                    </div>
                                   
                                    <div class="ratingresult">
                                    <%
                                        for (int j = 0; j < (int)i.trungbinhSosao(); j++) {
                                    %> 
                                        <i class="fa fa-star"></i>                           
                                    <%
                                        } for (int j = (int)i.trungbinhSosao(); j < 5; j++) {
                                    %>
                                        <i class="fa fa-star-o"></i>                           
                                    <%
                                        }
                                    %> 
                                        <span><%=i.soDanhGia(0)%> đánh giá</span> 
                                   </div>
                                </div> 
                    <%
                            }                          
                    %>
                </div>
            </div>
            <div class="listPage">
                <%
                    int page1 = (int) request.getAttribute("page");
                    int num = (int) request.getAttribute("num");
                    for (int i = 1; i <= num; i++) {
                        if (i == page1) {
                %>
                       <button class="pageNum" ><a href=""><%= i%></a></button> 
                <%
                       }else{
                %>
                       <button class="pageNum" onclick="layUrl('page','<%= i%>')"><%= i%></button>
                <%
                       }
                    } 
                %>
            </div>
            <style type="text/css">
                .titlePrice{
                    display: grid;
                }
                .title{
                    text-align: left;
                    word-wrap: break-word;
                    width: 190px;
                }
                .price{
                    text-align: left;
                }
                .ratingresult{
                    margin-left: 13px;
                }
                .pageNum{
                    cursor: pointer;
                    background: #151f3c;
                    color: white;
                    border-radius: 5px;
                    width: 30px;
                    height: 30px;
                }
                .listPage{
                    text-align: center;
                }
            </style>
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
        <script src="js/index.js"></script> 
        <script>
                        const thuongHieu = {
                            apple: 'IPHONE',
                            coolpad: 'COOLPAD',
                            xiaomi: 'XIAOMI',
                            huawei: 'HUAWEI',
                            samsung: 'SAMSUNG',
                            oppo: 'OPPO',
                            nokia: 'NOKIA',
                            realme: 'REALME'
                        };
                        const gia = {
                            duoi2trieu: 'Dưới 2 triệu',
                            tu2den4trieu: 'Từ 2 - 4 triệu',
                            tu4den7trieu: 'Từ 4 - 7 triệu',
                            tu7den13trieu: 'Từ 7 - 13 triệu',
                            tren13trieu: 'Trên 13 triệu'
                        };
                        const khuyenMai = {
                            giamgia: 'Giảm giá',
                            tragop: 'Trả góp',
                            moiramat: 'Mới ra mắt'
                        };
                        const sapXep = {
                            giatangdan: 'Giá tăng dần',
                            giagiamdan: 'Giá giảm dần'

                        };

                        let thuongHieuActive = null;
                        let giaActive = null;
                        let khuyenMaiActive = null;
                        let sapXepActive = null;

                        locGia();
                        locThuongHieu();
                        locKhuyenMai();
                        locSapXep();

                        function locThuongHieu() {
                            thuongHieuActive = layUrlParameter('thuong-hieu');
                            if (!thuongHieuActive) {
                                return 0;
                            }
                            let html = '';
                            html += '<div class="choose-filter-container">';
                            html += `<button class="choose-filter-btn">`;
                            html += `<p style="margin: 0px 0px;">`;
                            html += thuongHieu[thuongHieuActive];
                            html += `</p>`;
                            html += `</button>`;
                            html += `</div>`;
                            document.querySelector('.filter').innerHTML += html;
                        }

                        function locGia() {
                            giaActive = layUrlParameter('gia');
                            if (!giaActive) {
                                return 0;
                            }
                            let html = '';
                            html += '<div class="price-filter-container">';
                            html += `<button class="choose-filter-btn">`;
                            html += `<p style="margin: 0px 0px;">`;
                            html += gia[giaActive];
                            html += `</p>`;
                            html += `</button>`;
                            html += `</div>`;
                            document.querySelector('.filter').innerHTML += html;
                        }

                        function locKhuyenMai() {
                            khuyenMaiActive = layUrlParameter('khuyen-mai');
                            if (!khuyenMaiActive) {
                                return 0;
                            }
                            let html = '';
                            html += '<div class="sale-filter-container">';;
                            html += `<button class="choose-filter-btn">`;;
                            html += `<p style="margin: 0px 0px;">`;
                            html += khuyenMai[khuyenMaiActive];
                            html += `</p>`;
                            html += `</button>`;
                            html += `</div>`;
                            document.querySelector('.filter').innerHTML += html;
                        }

                        function locSapXep() {
                            sapXepActive = layUrlParameter('sap-xep');
                            if (!sapXepActive) {
                                return 0;
                            }
                            let html = '';
                            html += '<div class="sort-filter-container">';
                            html += `<button class="choose-filter-btn">`;
                            html += `<p style="margin: 0px 0px;">`;
                            html += sapXep[sapXepActive];
                            html += `</p>`;
                            html += `</button>`;
                            html += `</div>`;
                            document.querySelector('.filter').innerHTML += html;
                        }

                        if (((thuongHieuActive !== null) || (giaActive !== null)
                                || (khuyenMaiActive !== null)||(sapXepActive !== null))
                                && (!document.querySelector('.delete-filter-container'))) {
                            let html = '';
                            html += '<div class="delete-filter-container">';
                            html += '<a href="category"><button class="delete-filter-btn">Xóa bộ lọc</button></a>';
                            html += '</div>';
                            document.querySelector('.filter').innerHTML += html;
                        }


                        function layUrl(key, value) {
                            const url_string = window.location.href;
                            const url = new URL(url_string);
                            url.searchParams.set(key, value);
                            window.location.href = url.href;
                        }

                        function layUrlParameter(key) {
                            let url_string = window.location.href;
                            let url = new URL(url_string);
                            let value = url.searchParams.get(key);
                            return value;
                        }
        </script>    
    </body>
</html>
