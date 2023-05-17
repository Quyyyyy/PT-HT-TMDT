<%-- 
    Document   : editor.jsp
    Created on : May 13, 2023, 2:15:57 AM
    Author     : HP
--%>

<%@page import="model.Role"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <a class="nav-link" href="list">
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
		<h3>Cập Nhật Người Dùng</h3>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 style="color:red" class="text-center"></h4>
                </div>
                <div class="panel-body">
                    <%
                        if(request.getAttribute("data")!=null){
                            Users d = (Users) request.getAttribute("data");
                    %>
                    <form action="editor" method="post">
                        <div class="form-group">
                          <label for="usr">Họ & Tên:</label>
                          <input required="true" type="text" class="form-control" name="fullname" value="<%=d.getFullname()%>">
                          <input type="text" name="id" value="<%= d.getId()%>" hidden="true">
                        </div>
                        <div class="form-group">
                          <label for="usr">Role:</label>
                          <select class="form-control" name="role_id" required="true">
                              <option>-- Chọn --</option>
                            <%
                                ArrayList<Role> t = (ArrayList<Role>) request.getAttribute("data1");
                                for(Role i:t){
                                    if(i.getId() == d.getRole_id().getId()){
                            %>
                      
                                <option selected value="<%= i.getId()%>"><%= i.getName()%></option>
                            <%
                                }else{
                            %>
                                <option value="<%= i.getId()%>"><%= i.getName()%></option>  
                            <%
                                    }
                                }
                            %>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="email">Email:</label>
                          <input required="true" type="email" class="form-control"name="email" value="<%= d.getEmail()%>">
                        </div>
                        <div class="form-group">
                          <label for="phone_number">Số Điện Thoại:</label>
                          <input required="true" type="tel" class="form-control"name="phone_number" value="<%=d.getPhone_number()%>">
                        <div class="form-group">
                          <label for="address">Địa Chỉ:</label>
                          <input type="text" class="form-control" name="address" value="<%= d.getAddress()%>">
                        </div>
                        <div class="form-group">
                          <label for="pwd">Mật Khẩu: </label>
                          <input type="password" class="form-control" name="password" minlength="6" value="<%= d.getPassword()%>">
                        </div>
                        <button type="submit" class="btn btn-success">Đăng Ký</button>
                    </form>
                        <%
                            }
                        %>
                </div>
            </div>

	</div>
    </div>
      <!-- END -->
    </main>
  </div>
</div>
</body>
</html>
