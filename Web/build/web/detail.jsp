<%-- 
    Document   : detail
    Created on : May 14, 2023, 4:40:50 PM
    Author     : HP
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MBShop</title>
        <link rel="shortcut icon" href="img/logonho.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css">  
        <link rel="stylesheet" href="css/chi-tiet-sp.css">


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
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
                        //NguoiDung tmp = (NguoiDung) session.getAttribute("account");
                        if (tmp != null) {
                    %>                                   
                    <li>
                        <a href="logout">
                            <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                            <p>Đăng xuất</p>
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
        <section>
            <div id="productNotFound" style="min-height: 50vh; text-align: center; margin: 50px; display: none;">
                <h1 style="color: red; margin-bottom: 10px;">Không tìm thấy sản phẩm</h1>
                <a href="index.php" style="text-decoration: underline;">Quay lại trang chủ</a>
            </div>

            <div class="chitietSanPham" style="margin-bottom: 100px;">
                <%
                     Locale localeVN = new Locale("vi", "VN");
                        NumberFormat df = NumberFormat.getCurrencyInstance(localeVN);
                    if(request.getAttribute("data")!=null){
                        Product p = (Product) request.getAttribute("data");
                %>

                <div class="ctsanpham">
                    <h1 class="title">Điện thoại <%=p.getTitle()%></h1>
                    <div class="rating">
                        <%
                            for (int j = 0; j < (int) p.trungbinhSosao(); j++) {
                        %>
                        <i class="fa fa-star"></i>                           
                        <%
                            } for (int j = (int) p.trungbinhSosao(); j < 5; j++) {
                        %>
                        <i class="fa fa-star-o"></i>                           
                        <%
                            }
                        %>
                        <span><%=p.soDanhGia(0)%> đánh giá</span>  
                    </div>
                </div>

                <div class="rowdetail group">
                    <div class="picture">
                        <img src="<%=p.getThumbnail()%>"> 
                    </div>
                    <div class="price_sale">
                        <div class="area_price">
                            <p class="price" style="font-size: 25px; padding: 5px 0px;"><%=df.format(p.getDiscount())%></p>
                        </div>
                        <!-- <div class="ship" style="display: none;"> 
    
                        </div> -->
                        <div class="area_promo">
                            <strong>Khuyến mãi</strong>
                            <div class="promo">
                                <img src="img/icon-tick.png" alt="">
                                <div id="detailPromo"><p style="margin: 0px;">Khách hàng có thể mua trả góp sản phẩm với lãi suất 0% với thời hạn 6 tháng kể từ khi mua hàng.</p></div>
                            </div>
                            <div class="promo">
                                <img src="img/icon-tick.png" alt="">
                                <div id="detailPromo"><p style="margin: 0px;">Giảm giá 5% khi mua phụ kiện.</p></div>
                            </div>
                            <div class="promo">
                                <img src="img/icon-tick.png" alt="">
                                <div id="detailPromo"><p style="margin: 0px;">Thu cũ đổi mới: Giá thu cao - Thủ tục nhanh chóng - Trợ giá tốt nhất.</p></div>
                            </div>
                        </div>

                        <div class="policy">
                            <div>
                                <img src="img/box.png" alt="">
                                <p>Bộ sản phẩm gồm: Hộp, Sách hướng dẫn, Cây lấy sim, Củ sạc nhanh rời đầu Type A, Cáp Type C</p>
                            </div>
                            <div>
                                <img src="img/icon-baohanh.png" alt="">
                                <p>Bảo hành chính hãng 12 tháng</p>
                            </div>
                            <div class="last">
                                <img src="img/1-1.jpg" alt="">
                                <p>1 đổi 1 trong 1 tháng nếu lỗi, đổi trong vòng 1 ngày hoặc đổi tại cửa hàng</p>
                            </div>
                        </div>
                    <%
                        //NguoiDung tmp = (NguoiDung) session.getAttribute("account");
                        if (tmp != null) {
                    %>
                        <div class="area_order">
                            <button style="border: solid #e0dede 2px; border-radius: 5px; background: #202c4f; color:#fff;width: 30px; height: 2em;" onclick="addMoreCart(-1)">-</button>
                            <input type="number" name="num" class="form-control" step="1" value="1" style="max-width: 90px;border: solid #e0dede 2px; border-radius: 3px; text-align:center; background:#f2f2f2; height:30px;width: 70px; font-size:15px" onchange="fixCartNum()">
                            <button style="border: solid #e0dede 2px; border-radius: 5px; background: #202c4f; color: #fff;width: 30px; height: 2em;" onclick="addMoreCart(1)">+</button>
                            <button onclick="addCart(<%=p.getId()%>, $('[name=num]').val())" class="buy_now" style="width: 376px; margin-top:9px; ">
                                <b><i class="fa fa-cart-plus"></i> Thêm vào giỏ hàng</b>
                            </button>
                        </div>
                    <%
                        } else {
                    %>
                    <div class="area_order">
                            <a href="login" class="buy_now">
                                <b><i class="fa fa-cart-plus"></i> Thêm vào giỏ hàng</b>
                            </a>
                        </div>
                    <%
                        }
                    %>
                    </div>
                    <div class="info_product">
                        <h2>Cấu hình điện thoại</h2>
                        <ul class="info">
                            <li>
                                <p>Màn hình: </p>
                                <div><%=p.getKTmanHinh()%></div>
                            </li>
                            <li>
                                <p>Camera trước: </p>
                                <div><%=p.getCameraTruoc()%> MP</div>
                            </li>
                            <li>
                                <p>Camera sau: </p>
                                <div><%=p.getCameraSau()%> MP</div>
                            </li>
                            <li>
                                <p>CPU: </p>
                                <div><%=p.getCPU()%></div>
                            </li>
                            <li>
                                <p>RAM: </p>
                                <div><%=p.getRam()%> GB</div>
                            </li>
                            <li>
                                <p>Bộ nhớ trong: </p>
                                <div><%=p.getRom()%> GB</div>
                            </li>
                            <li>
                                <p>Dung lượng pin: </p>
                                <div><%=p.getPin()%> mAh</div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="overlaycertainimg" class="overlaycertainimg">
                    <div class="close" onclick="closecertain()">&times;</div>
                    <div class="overlaycertainimg-content">
                        <img id="bigimg" class="bigimg" src="img/oppo-f9-red-2-400x460.png" alt="">
                    </div>
                </div>
            </div>
            <div class="box-border">
                <div class="rate">
                    <%
                        ArrayList<Review> dg = (ArrayList<Review>) request.getAttribute("data1");

                    %>
                    <h2 class="rating_title">Đánh giá sản phẩm</h2>
                    <div class="rating-star left">
                        <div class="rating-left">
                            <div class="rating-top">
                                <p class="point"><%=String.format("%.1f", p.trungbinhSosao())%></p>        
                                <div class="list-star">
                                    <i class="fa fa-star">

                                    </i>
                                </div>
                                <a href="" class="rating-total"><%=p.soDanhGia(0)%> đánh giá </a>
                            </div>
                            <div class="product-rating">
                                <div class="all">Tất cả</div>
                                <div class="product-rating-rate">5 sao (<%= p.soDanhGia(5)%>)</div>
                                <div class="product-rating-rate">4 sao (<%= p.soDanhGia(4)%>)</div>
                                <div class="product-rating-rate">3 sao (<%= p.soDanhGia(3)%>)</div>
                                <div class="product-rating-rate">2 sao (<%= p.soDanhGia(2)%>)</div>
                                <div class="product-rating-rate">1 sao (<%= p.soDanhGia(1)%>)</div> 
                            </div>
                        </div>
                        <div class="rating-list">
                            <div class="rating-comment">
                                <div class="rating-comment-product">
                                    <a class="rating-avata" href="">
                                        <div class="comment-avata">
                                            <div class="avata-placeholder">

                                            </div>
                                        </div>
                                    </a>
                                    <%
                                        for(Review i: dg) { 
                                    %>

                                    <div class="comment-all">
                                        <div class="comment-item">
                                            <div class="item-top">
                                                <p class="txtname"><%=i.getId_user().getFullname()%></p>
                                            </div>
                                        </div>
                                        <div class="item-rate">
                                            <div class="comment-rate">
                                                <%
                                                    if(i.getStar()!=0){
                                                    for (int j = 0; j < (int ) i.getStar(); j++) {
                                                %>
                                                <i class="fa fa-star"></i>                           
                                                <% 
                                                    } for (int j = (int ) i.getStar(); j < 5; j++) {
                                                %>
                                                <i class="fa fa-star-o"></i>                           
                                                <%
                                                    } 
                                                }
                                                %>
                                            </div>
                                        </div>
                                        <div class="product-rating-time">
                                            <%= i.getCreated_at()%> 
                                        </div>
                                        <div class="comment-content">
                                            <p class="cmt-txt"><%=i.getContent()%></p>
                                        </div>
                                        <div class="item-click">
                                            <a href="" class="clicklike">
                                                <i class="fa fa-thumbs-up"></i>
                                                Hữu ích
                                            </a>
                                            <a href="" class="clicklike">
                                                <i class="fa fa-thumbs-down"></i>
                                                Không hữu ích
                                            </a>
                                            <a href="" class="clicklike">
                                                <i class="fa fa-envelope"></i>
                                                Trả lời
                                            </a>
                                        </div>
                                    </div>


                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                        <div class="pagecomment">
                            <%
                                //for ($i = 1; $i <= $page; $i++) {
                                int page1 = (int) request.getAttribute("page");
                                int num = (int) request.getAttribute("num");
                                for (int i = 1; i <= num; i++) {
                                    if (i == page1) {
                            %> 
                             <a href="" class="active"><%= i%></a>  
                            <%
                             } else {
                            %> 
                            <a href="detail?id=<%=p.getId()%>&page=<%= i%>" class="active1"><%= i%></a>
                            <%
                                     }
                                }
                            %> 
                        </div>
                        <%
                            //NguoiDung tmp =(NguoiDung) session.getAttribute("account");
                            if (tmp != null) {
                        %>
                        
                        <div>
                            <form action="" method="post">
<!--                                <br><br>-->
<!--                                <label >Ðánh giá sản phẩm <input type="text" id="ten_sp" name="ten_sp" value="<= p.getTitle() %>" readonly>:</label>-->
                                 <br>
                                <input type="text" name="id_u" hidden="true" value="<%= tmp.getId()%>"> 
                                <input type="text" name="id_p" hidden="true" value="<%= p.getId()%>" > 
                                <textarea id="contentRate" rows="" cols="" name="content" placeholder="Hãy để lại đánh giá của bạn" style="max-width: 800px; min-width: 800px; height: 100px;"></textarea>
                                <!-- <input type="text" id="text_danh_gia" name="content" placeholder="Mời bạn để lại bình luận"  ><br> -->
                                <br>
                                <p style="text-align: center; font-size: 16px; font-weight: bold;">Bạn nghĩ sao về sản phẩm này?</p>
                                <div id="rateContainer" style="display: flex; justify-content: center;">
                                    <div style="display: flex; align-items: baseline; margin-right: 20px;">
                                        <input checked="checked" type="radio" name="star" value="0" hidden="true">
                                        <input type="radio" id="1sao" name="star" value="1">
                                        <div class="starContainer">
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star-o"></i>   
                                            <i class="fa fa-star-o"></i>   
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div> 
                                    </div>
                                    <br>
                                    <div style="display: flex; align-items: baseline; margin-right: 20px;">
                                        <input type="radio" id="2sao" name="star" value="2">
                                        <div class="starContainer">
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star-o"></i>   
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div> 
                                    </div>
                                    <br>
                                    <div style="display: flex; align-items: baseline; margin-right: 20px;">
                                        <input type="radio" id="3sao" name="star" value="3">
                                        <div class="starContainer">
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div> 
                                    </div>
                                    <br>
                                    <div style="display: flex; align-items: baseline; margin-right: 20px;">
                                        <input type="radio" id="4sao" name="star" value="4">
                                        <div class="starContainer">
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div> 
                                    </div>
                                    <br>
                                    <div style="display: flex; align-items: baseline; margin-right: 20px;">
                                        <input type="radio" id="5sao" name="star" value="5">
                                        <div class="starContainer">
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star"></i>   
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div> 
                                    </div>
                                    <br>
                                </div>
                                <div style="display: flex; justify-content: center;">
                                    <input id="btnSubmit" type="submit" value="Gửi">
                                </div>
                            </form>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <div class="product-list">
                <div class="name-text-container">
                    <p class="name-text">Bạn có thể thích</p>
                </div>
                <div class="product">

                    <%
                        ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("data2");
                        for(Product i:list){
                    %>
                    <div class="card">
                        <div class="product-promo-container">
                            <div class="product-promo">
                                <p> Đề xuất </p>
                            </div>
                        </div>
                        <img src="<%=i.getThumbnail()%>" style="width:100%">
                        <a href="detail?id=<%=i.getId()%>"><%=i.getTitle()%></a>
                        </br>
                        </br>
                        </br>                    
                        <p class="price"><%=df.format(i.getDiscount())%> </p> 
                        </br>
                        <div class="ratingresult">
                            <%
                                for (int j = 0; j < (int) i.trungbinhSosao(); j++) {
                            %> 
                            <i class="fa fa-star"></i>                           
                            <%
                                } for (int j = (int) i.trungbinhSosao(); j < 5; j++) {
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
}
                    %>

                </div>
            </div> 
        </section>
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
        <style>
            .product-promo-container .product-promo p{
                font-size: 12px;
                font-weight: 700;
                text-align: center;
                color: #fff;
                width: 100%;
                margin: 5px 0 0;
                padding: 9px 0px 0px 0px;
            }
            .product-promo-container .product-promo{
                width: 96px;
                height: 31px;
                top: -1px;
                left: -15px;
                background: #151f3c;
                border-radius: 21px;
            }

            .product-promo-container{
                width: 66px;
                background: #151f3c;
            }
            .card{
                height: 364px;
            }
            .product-list p.name-text {
                text-align: center;
                font-size: 20px;
                font-weight: bold;
                color: white;
                margin-bottom: 35px;
                background: #151f3c;
                width: 1000px;
                border-radius: 27px;
                height: 40px;
                padding: 8px 0px 0px 0px;
                margin: 0 auto;
            }
            .name-text-container{
                margin-top: 65px;
                margin-bottom: 25px;
            }
            .banner{
                margin-bottom: 55px;
            }
            
                #btnSubmit{
                    background: #151f3c;
                    color: white;
                    border-radius: 3px;
                    width: 110px;
                    height: 45px;
                    font-size: 17px;
                    font-weight: bold;
                    cursor: pointer;
                    margin-top: 20px;
                }
                #rateContainer{
                    margin-top: 10px;
                }
                #contentRate{
                    font-family: arial;
                    padding: 10px;
                    font-size: 14px;
                }
                .starContainer{
                    margin-left: 2px;
                }
            </style>
        </style>
        <script src="js/back-to-top.js"></script>
        <script type="text/javascript">
            function addMoreCart(delta) {
                num = parseInt($('[name=num]').val())
                num += delta
                if(num < 1) num = 1;
                $('[name=num]').val(num)
            }

            function fixCartNum() {
                $('[name=num]').val(Math.abs($('[name=num]').val()))
            }

            function addCart(productId, num) {
                $.get('/Web/cart', {
                    'action': 'cart',
                    'id': productId,
                    'num': num
                }, function(data){
                    //location.reload()
               }) 
           }
        </script>
    </body>
</html>