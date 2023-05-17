<%-- 
    Document   : index
    Created on : May 13, 2023, 12:38:54 AM
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        Users x = (Users) session.getAttribute("account");
        if(x.getRole_id().getId()==2){ 
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
            <a class="nav-link " href="../order/list">
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
            <a class="nav-link" href="">
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
		<h3>Quản lý người dùng</h3>

            <a href="insert"><button class="btn btn-success">Thêm Tài Khoản</button></a>

            <table class="table table-bordered table-hover" 
                style="margin-top: 20px;">
                <thead>
                    <th>STT</th>
                    <th>Họ & Tên</th>
                    <th>Email</th>
                    <th>SĐT</th>
                    <th>Địa Chỉ</th>
                    <th>Quyền</th>
                    <th style="width: 50px;"></th>
                    <th style="width: 50px;"></th>
                </thead>
                <tbody>
                <%
                    int index=0;
                    ArrayList<Users> l = (ArrayList<Users>) request.getAttribute("data");
                    for(Users i:l){
                %>
                <tr>                  
                    <th><%= (++index)%></th>
                    <td><%= i.getFullname()%></td>
                    <td><%= i.getEmail()%></td>
                    <td><%= i.getPhone_number()%></td>
                    <td><%= i.getAddress()%></td>
                    <td><%= i.getRole_id().getName()%></td>
                    <th style="width: 50px;">
                        <a href = "editor?id=<%= i.getId()%>"><button class="btn btn-warning">Sửa</button></a>
                    </th>
                    <th style="width: 50px;">
                    <%
                        if(x.getId()!=i.getId()&&i.getRole_id().getId() != 1){
                    %>
                    
                    <button onclick ="deleteUser(<%= i.getId()%>)" class="btn btn-danger">Xóa</button>
                    <%
                            }
                        }
                    %>
                
                    </th>
                </tr>
                </tbody>
            </table>
	</div>
</div>

<script type="text/javascript">
    function deleteUser(id){
        option = confirm('Bạn có chác chắn muốn xóa tài khoản này không?');
        if(!option) return;
        $.post('/Web/admin/user/list',{
            'id':id,
            'action': 'delete' 
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