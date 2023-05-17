<%-- 
    Document   : insert
    Created on : May 13, 2023, 4:26:59 PM
    Author     : HP
--%>

<%@page import="model.Users"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
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
            <a class="nav-link " href="list">
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
      <!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<div class="row" style="margin-top: 20px;">
	<div class="col-md-12  table-responsive">
		<h3>Thêm Sản Phẩm</h3>

        <div class="panel panel-primary">
            <div class="panel-body">
                <form action="insert" method="post">
                <div class="row">
                    <div class="col-md-9 col-12">
                        <div class="form-group">
                            <label for="usr">Tên Sản Phẩm:</label>
                            <input required="true" type="text" class="form-control" id="usr" name="title" value="">
                            <input type="text" name="id" value="" hidden="true">
                        </div>
                        <div class="form-group">
                            <label for="discount">Hãng:</label>
                            <input type="text" class="form-control" id="symbol" name="symbol" value="">
                        </div>
                        <div class="form-group">
                            <label for="discount">Pin:</label>
                            <input type="text" class="form-control" id="pin" name="pin" value="">
                        </div>
                        <div class="form-group">
                            <label for="discount">Ram:</label>
                            <input type="text" class="form-control" id="ram" name="ram" value="">
                        </div>
                        <div class="form-group">
                            <label for="discount">Rom:</label>
                            <input type="text" class="form-control" id="rom" name="rom" value="">
                        </div>
                        <div class="form-group">
                            <label for="discount">CPU:</label>
                            <input type="text" class="form-control" id="CPU" name="CPU" value="">
                        </div>
                        <div class="form-group">
                            <label for="discount">Kích thước màn hình:</label>
                            <input type="text" class="form-control" id="KTmanHinh" name="KTmanHinh" value="">
                        </div>
                        <div class="form-group">
                            <label for="discount">Camera trước:</label>
                            <input type="text" class="form-control" id="cameraTruoc" name="cameraTruoc" value="">
                        </div>
                        <div class="form-group">
                            <label for="discount">Camera sau:</label>
                            <input type="text" class="form-control" id="cameraSau" name="cameraSau" value="">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Nội Dung: </label>
                            <textarea class="form-control" rows="5" id="description" name="description"></textarea>
                        </div>
                        <button type="submit" class="btn btn-success">Lưu Sản Phẩm</button>
                    </div>
                    <div class="col-md-3 col-12" style="border: solid grey 1px; padding-top: 10px; padding-bottom: 10px;">
                        <div class="form-group">
                            <label for="thumbnail">Thumbnail:</label>
                            <input type="file" class="form-control" id="thumbnail" name="thumbnail" accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" >
                            <img id="thumbnail_img" src="../../" style="max-height: 160px; margin-top: 5px; margin-bottom: 15px;">
                        </div>
                        <div class="form-group">
                            <label for="usr">Danh Mục Sản Phẩm:</label>
                            <select class="form-control" name="category_id" id="category_id" required="true">
                                <option>-- Chọn --</option>
                                <%
                                    ArrayList<Category> list = (ArrayList<Category>) request.getAttribute("data");
                                    for(Category i:list){                                
                                        
                                %>                                                                    
                                        <option value="<%=i.getId()%>"><%=i.getName()%></option>
                                <%
                                        }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="price">Giá:</label>
                            <input required="true" type="tel" class="form-control" id="price" name="price" value="">
                        </div>
                        <div class="form-group">
                            <label for="discount">Giảm giá:</label>
                            <input type="text" class="form-control" id="discount" name="discount" value="">
                        </div>
                    </div>
                </div>                   
                </form>
            </div>
        </div>

	</div>
</div>
<script>
    $('#description').summernote({
    placeholder: 'Nhập nội dung dữ liệu',
    tabsize: 2,
    height: 300,
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['link', 'picture', 'video']],
      ['view', ['fullscreen', 'codeview', 'help']]
    ]
  });
</script>

      <!-- END -->
    </main>
  </div>
</div>
</body>
</html>