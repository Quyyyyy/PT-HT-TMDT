<%-- 
    Document   : cart
    Created on : May 15, 2023, 12:28:28 AM
    Author     : HP
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
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
        <link rel="stylesheet" href="css/gio-hang.css">
        <link rel="stylesheet" href="css/index.css">

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
        <section>
            <table class="listSanPham" style="width: 100%;">
                <thead>
                    <tr>
                    <th>STT</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                    <th>Xoá</th>
                    </tr>
                </thead>
                <tbody>
            <%
                int index = 0;
                int total = 0;
                Locale localeVN = new Locale("vi", "VN");
                        NumberFormat df = NumberFormat.getCurrencyInstance(localeVN);
                if(session.getAttribute("cart")!=null){
                    Cart c = (Cart) session.getAttribute("cart");
                    for(Item  i: c.getItems()){ 
            %>  
                    <tr>
                        <td><%=(++index)%></td>
                        <td class="noPadding">
                            <a href="detail?id=<%=i.getP().getId()%>" target="_blank" title="Xem chi tiết"><%=i.getP().getTitle()%></a>
                        </td>
                        <td class="alignRight"><%=df.format(i.getP().getDiscount())%> </td> 
                        <td class="soluong">
                            <button  onclick="addMoreCart(<%=i.getP().getId()%>,-1)" style="background: #202c4f; color:#fff;"><i class="fa fa-minus"></i></button>
<!--                            <a href="cart?num=-1&id=<=i.getP().getId()%>"><i class="fa fa-minus"></i></a>-->
                            <input type="number "size="1" id="num_<%=i.getP().getId()%>" onchange="fixCartNum(<%=i.getP().getId()%>)" value="<%=i.getNum()%>"> 
                            <button onclick="addMoreCart(<%=i.getP().getId()%>,1)" style="background: #202c4f; color:#fff;"><i class="fa fa-plus"></i></button>
<!--                            <a href="cart?num=1&id=<=i.getP().getId()%>"><i class="fa fa-minus"></i></a>-->
                        </td>
                        <td class="alignRight"><%=df.format(i.getPrice()*i.getNum())%></td>
                        <td class="noPadding1">
<!--                            <form action="cart" method="post">
                                <input type="hidden" name="id" value="<=i.getP().getId()%>"> 
                                <button type="submit"><i class="fa fa-trash"></i></button>
                            </form>-->
                            <button onclick="updateCart(<%=i.getP().getId()%>, 0)"><i class="fa fa-trash"></i></button>
                        </td>
                    </tr>                    
                    
                    <%
                            }
                            total = c.getTotalMoney();
                        }
                    %> 
                </tbody>
            </table>
                <div class="thanhtien">
                    Thành tiền (VNĐ):
                    <span class="gia"><%=df.format(total)%> </span>
                </div>
            <%
                if(session.getAttribute("cart")!=null){
                   Cart c = (Cart) session.getAttribute("cart");
                   if(!c.getItems().isEmpty()){
            %>    
            <div class="delete">
                <a href="checkout.jsp"><input type="button" class="deleteall" value="Thanh toán"></a>
            </div>
            <%
                }
}
            %>
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
        <script type="text/javascript">
             function addMoreCart(id, delta) {
                //num = parseInt($('#num_'+id).val())
                num = delta
                $('#num_'+id).val(num)

                updateCart(id,num)
            }

            function fixCartNum(id) {
                $('#num_'+id).val(Math.abs($('#num_'+id).val()))

                updateCart(id,$('#num_'+id).val())
            }

            function updateCart(productId, num) {
                $.post('/Web/cart', {
                    'action': 'update_cart',
                    'id': productId,
                    'num': num
                }, function(data) {
                    location.reload()
                })
            }
       </script>
    </body>
</html>