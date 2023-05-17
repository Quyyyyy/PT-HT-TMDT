<%-- 
    Document   : index
    Created on : May 13, 2023, 8:10:43 PM
    Author     : HP
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Users"%>
<%@page import="model.Orders"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        Users m = (Users) session.getAttribute("account");
        if(m.getRole_id().getId()==2){
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "/Web/login");
        }

%>
<!DOCTYPE html>
<html>
<head>
  <title>Quản lý</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" type="image/png" href="https://gokisoft.com/uploads/2021/03/s-568-ico-web.jpg" />

  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

  <link rel="stylesheet" type="text/css" href="../../css/dashboard.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">MBShop</a>
  <input class="form-control form-control-dark w-100" type="text" placeholder="Tìm kiếm" aria-label="Search">
  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="/Web/logout">Đăng xuất</a> 
    </li>
  </ul>
</nav>  
<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="../">
              <i class="bi bi-house-fill"></i>
              Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="../category/list">
              <i class="bi bi-folder"></i>
              Danh Mục Sản Phẩm
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="../product/list">
              <i class="bi bi-file-earmark-text"></i>
              Sản Phẩm
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="">
              <i class="bi bi-minecart"></i>
              Quản Lý Đơn Hàng
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="../feedback/list">
              <i class="bi bi-question-circle-fill"></i>
              Quản Lý Phản Hồi
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../user/list">
              <i class="bi bi-people-fill"></i>
              Quản Lý Người Dùng
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <!-- hien thi tung chuc nang cua trang quan tri START-->
      <div class="row" style="margin-top: 20px;">
    <div class="col-md-12  table-responsive">
        <h3>Quản Lý Phản Hồi</h3>

        <table class="table table-bordered table-hover" 
            style="margin-top: 20px;">
            <thead>
                <th>STT</th>
                <th>Họ & Tên</th>
                <th>SĐT</th>
                <th>Email</th>
                <th>Địa Chỉ</th>
                <th>Nội Dung</th>
                <th>Tổng Tiền</th>
                <th>Ngày Tạo</th>
                <th style="width: 50px;"></th>
            </thead>
            <tbody>
                <%
                     Locale localeVN = new Locale("vi", "VN");
                        NumberFormat df = NumberFormat.getCurrencyInstance(localeVN);
                int index=0;
                int x = 1, y=2;
                ArrayList<Orders> l = (ArrayList<Orders>) request.getAttribute("data");
                for(Orders i:l){
            %>
            <tr>
                <th><%= (++index)%></th>
                <td><a href="detail?id=<%=i.getId()%>"><%=i.getFullname()%></a></td>
                <td><a href="detail?id=<%=i.getId()%>"><%=i.getPhone_number()%></a></td>
                <td><a href="detail?id=<%=i.getId()%>"><%=i.getEmail()%></a></td>
                <td><%=i.getAddress()%></td>
                <td><%=i.getNote()%></td>
                <td><%=df.format(i.getTotal_money())%></td>
                <td><%=i.getOrder_date()%></td>
                <th>
                    <%
                        if(i.getStatus()==0){
                    %>
                    <button onclick ="changeStatus(<%=i.getId()%>,1)" class="btn btn-sm btn-success" style="margin-bottom:10px;">Approve</button>
                    <button onclick ="changeStatus(<%=i.getId()%>,2)" class="btn btn-sm btn-danger">Cancel</button>
                    <%
                        }else if(i.getStatus()==1){
                    %>
                    <label class="badge badge-success">Approved</label>
                    <%
                        } else{
                    %>
                    <label class="badge badge-danger">Cancel</label>
                    <%
                        }
                    %>
                </th>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">
    function changeStatus(id, status){
        $.post('/Web/admin/order/list',{
            'id':id,
            'status':status,
        }, function(data) {
            location.reload()
        })
    }
</script>
      <!-- END -->
    </main>
  </div>
</div>
</body>
</html>