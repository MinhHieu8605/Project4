<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerListURL" value="/admin/customer-list"></c:url>
<c:url var="customerAPI" value="/api/customer/"></c:url>
<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Quản lí khách hàng</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="widget-box ui-sortable-handle">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm</h5>

                                <div class="widget-toolbar">
                                    <div class="widget-menu">
                                        <a href="#" data-action="settings" data-toggle="dropdown">
                                            <i class="ace-icon fa fa-bars"></i>
                                        </a>

                                        <ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
                                            <li>
                                                <a data-toggle="tab" href="#dropdown1">Option#1</a>
                                            </li>

                                            <li>
                                                <a data-toggle="tab" href="#dropdown2">Option#2</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <a href="#" data-action="fullscreen" class="orange2">
                                        <i class="ace-icon fa fa-expand"></i>
                                    </a>

                                    <a href="#" data-action="reload">
                                        <i class="ace-icon fa fa-refresh"></i>
                                    </a>

                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>

                                    <a href="#" data-action="close">
                                        <i class="ace-icon fa fa-times"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                                <div class="widget-main">
                                    <form:form id="listForm" modelAttribute="modelSearch" action="${customerListURL}" method="GET">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-12" style="margin-bottom: 10px; margin-top: 10px">
                                                    <div class="col-xs-4">
                                                        <label for="" class="name">Tên khách hàng</label>
                                                        <form:input class="form-control" path="fullName" placeholder="Nhập tên khách hàng"></form:input>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label for="" class="name">Số điện thoại di dộng</label>
                                                        <form:input class="form-control" path="phone" placeholder="Nhập số điện thoại"></form:input>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label for="" class="name">Email</label>
                                                        <form:input class="form-control" placeholder="Nhập email" path="email"></form:input>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12" style="margin-bottom: 15px;">
                                                    <div class="col-xs-2">
                                                        <label for="" class="name">Nhân viên</label>
                                                        <form:select class="form-control" path="staffId">
                                                            <form:option value="">--Chọn nhân viên--</form:option>
                                                            <form:options items="${listStaffs}"></form:options>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <button type="button" class="btn btn-danger" id="btnSearchCustomer">
                                                            Tìm kiếm
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>

                            <div class="pull-right">
                                <button class="btn btn-info" title="Thêm khách hàng">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                        <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                    </svg>
                                </button>

                                <button type="button" class="btn btn-danger" title="Xóa khách hàng">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                        <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- bảng danh sách -->
                <div class="row" style="margin-top: 50px">
                    <div class="col-xs-12">
                        <table id="simple-table" class="table table-striped table-bordered table-hover" style="font-family: 'Times New Roman', Times, serif;">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên khách hàng</th>
                                <th>Số điện thoại</th>
                                <th>Email</th>
                                <th>Nhu cầu</th>
                                <th>Người thêm</th>
                                <th>Ngày thêm</th>
                                <th>Tình trạng</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="item" items="${customerList}">
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" value="${item.id}">
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td>${item.fullName}</td>
                                    <td>${item.phone}</td>
                                    <td>${item.email}</td>
                                    <td>${item.demand}</td>
                                    <td>${item.createdBy}</td>
                                    <td>${item.createdDate}</td>

                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-xs btn-success" title="Giao khách hàng cho nhân viên" onclick="assignmentCustomer(${item.id})">
                                                <i class="ace-icon glyphicon glyphicon-list"></i>
                                            </button>

                                            <button class="btn btn-xs btn-info" title="Sửa thông tin">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </button>

                                            <button class="btn btn-xs btn-danger" title="Xóa khách hàng">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </button>
                                        </div>

                                        <div class="hidden-md hidden-lg">
                                            <div class="inline pos-rel">
                                                <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                                                    <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                                </button>

                                                <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                    <li>
                                                        <a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
                                                                            <span class="blue">
                                                                                <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                                                            </span>
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
                                                                            <span class="green">
                                                                                <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                                                            </span>
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
                                                                            <span class="red">
                                                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                                            </span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div><!-- /.span -->
                </div>
                <!-- End bảng danh sách -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
    <div class="modal fade" id="assignmentCustomerModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Danh sách nhân viên</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <table class="table table-striped table-bordered table-hover" id="staffList">
                                <thead>
                                <tr>
                                    <th class="center">Chọn</th>
                                    <th class="center">Tên tên nhân viên</th>
                                </tr>
                                </thead>

                                <tbody>
                                <%--                    <tr>--%>
                                <%--                      <td class="center">--%>
                                <%--                        <input type="checkbox" id="checkbox_1" value="1">--%>
                                <%--                      </td>--%>

                                <%--                      <td class="center">Nguyen Van B</td>--%>

                                <%--                    </tr>--%>

                                <%--                    <tr>--%>
                                <%--                      <td class="center">--%>
                                <%--                        <input type="checkbox" id="checkbox_2" value="2">--%>
                                <%--                      </td>--%>

                                <%--                      <td class="center">Nguyen Van C</td>--%>
                                <%--                    </tr>--%>
                                </tbody>
                            </table>
                        </div><!-- /.span -->
                    </div>
                    <input type="hidden" id="customerId" name="Customer" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnAssignmentCustomer">Giao khách hàng</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>

        </div>
    </div>

    <script>
        $('#btnSearchCustomer').click(function (e){
            e.preventDefault();
            $('#listForm').submit();
        });

        function assignmentCustomer(customerId){
            $('#assignmentCustomerModal').modal();
            tableStaff(customerId);
            $('#customerId').val(customerId);
        }
        function tableStaff(customerId){
            $.ajax({
                type: "GET",
                url: "${customerAPI}" + customerId + "/staffs",
                dataType: "JSON",
                success: function (response){
                    var row = '';
                    $.each(response.data, function (i, item){
                        row += '<tr>';
                        row += '<td class="text-center"><input type="checkbox" value="' + item.staffId + '" id="checkbox_' + item.staffId + '"' + item.checked + '></td>';
                        row += '<td class="text-center">' + item.fullName + '</td>';
                        row += '</tr>';
                    });
                    $('#staffList tbody').html(row);
                    console.info("success")
                },
                error: function (response){
                    console.info("failed")
                    window.location.href = "<c:url value="admin/customer-list?message=error"></c:url>"
                }
            });
        }

        <%--$('#btnAssignmentCustomer').click(function (e){--%>
        <%--  e.preventDefault();--%>
        <%--  var data = {};--%>
        <%--  data['buildingId'] = $('#buildingId').val();--%>
        <%--  var staffs = ${'#staffList'}.find('tbody input[type = checkbox]:checked').map(function (){--%>
        <%--      return $(this).val();--%>
        <%--  }).get();--%>
        <%--  data['staffs'] = staffs;--%>
        <%--  if(data['staffs'] != ' '){--%>
        <%--      assignmentOfCustomer(data);--%>
        <%--  }--%>

        <%--});--%>

        <%--function assignmentOfCustomer(data){--%>
        <%--    $.ajax({--%>
        <%--      type: "POST",--%>
        <%--      // url: "http://localhost:8081/admin/building",--%>
        <%--      url: "${customerAPI}/" + "assignment",--%>
        <%--      data: JSON.stringify(data),       // chuyển data về dạng json--%>
        <%--      contentType: "application/json",   //Khai báo kiểu dữ liệu bạn gửi lên server là JSON--%>
        <%--      dataType: "JSON",     // định dạng dữ liệu từ server gửi lên--%>
        <%--      success: function(response){--%>
        <%--          alert("Giao khách hàng thành công");--%>
        <%--          window.location.href = "<c:url value="/admin/customer-list"></c:url>"--%>
        <%--      },--%>
        <%--      error: function(response){--%>
        <%--          window.location.href = "<c:url value="/admin/customer-list?message=error"></c:url>"--%>
        <%--          console.log(response);--%>
        <%--      }--%>
        <%--  });--%>
        <%--}--%>
    </script>
</body>
</html>
