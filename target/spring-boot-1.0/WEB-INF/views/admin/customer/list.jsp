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
                                                        <form:input class="form-control" path="name" placeholder="Nhập tên khách hàng"></form:input>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label for="" class="name">Số điện thoại di dộng</label>
                                                        <form:input class="form-control" path="customerPhone" placeholder="Nhập số điện thoại"></form:input>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label for="" class="name">Email</label>
                                                        <form:input class="form-control" placeholder="Nhập email" path="email"></form:input>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12" style="margin-bottom: 15px;">
                                                    <security:authorize access="hasRole('MANAGER')">
                                                        <div class="col-xs-2">
                                                            <label for="" class="name">Nhân viên</label>
                                                            <form:select class="form-control" path="staffId">
                                                                <form:option value="">--Chọn nhân viên--</form:option>
                                                                <form:options items="${listStaffs}"></form:options>
                                                            </form:select>
                                                        </div>
                                                    </security:authorize>
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

                            <security:authorize access="hasRole('MANAGER')">
                                <div class="pull-right">
                                    <a href="/admin/customer-edit">
                                        <button class="btn btn-info" title="Thêm khách hàng">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                                <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                            </svg>
                                        </button>
                                    </a>

                                    <button type="button" class="btn btn-danger" title="Xóa khách hàng"
                                            id="btnDeleteCustomer">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                             class="bi bi-person-fill-dash" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                            <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                        </svg>
                                    </button>
                                </div>
                            </security:authorize>
                        </div>
                    </div>
                </div>

                <!-- bảng danh sách -->
                <div class="row" style="margin-top: 50px">
                    <div class="col-xs-12">
                        <display:table name="modelSearch.listResult" cellspacing="0" cellpadding="6"
                                       requestURI="${customerListURL}" partialList="true" sort="external"
                                       size="${modelSearch.totalItems}" defaultsort="2" defaultorder="ascending"
                                       id="tableList" pagesize="${modelSearch.maxPageItems}"
                                       export="false"
                                       class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer">
<%--                                       style="margin: 30em 0 1.5em;">--%>
                                <display:column title="<fieldset class='form-group' style='justify-content:center'>
                                                <input type='checkbox' id='checkAll' class='check-box-element'>
                                                </fieldset>" class="center select-cell" headerClass="center select-cell">
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${tableList.id}"
                                               id="checkbox_${tableList.id}" class="check-box-element"/>
                                    </fieldset>
                                </display:column>
                            <display:column headerClass="text-left" property="name" title="Tên khách hàng"/>
                            <display:column headerClass="text-left" property="customerPhone" title="Số điện thoại"/>
                            <display:column headerClass="text-left" property="email" title="Email"/>
                            <display:column headerClass="text-left" property="demand" title="Nhu cầu"/>
                            <display:column headerClass="text-left" property="createdBy" title="Người thêm"/>
                            <display:column headerClass="text-left" property="createdDate" title="Ngày thêm"/>
                            <display:column headerClass="text-left" property="status" title="Tình trạng"/>

                            <display:column headerClass="col-actions" title="Thao tác">
                                <security:authorize access="hasRole('MANAGER')">
                                    <a class="btn btn-xs btn-success" title="Giao khách hàng cho nhân viên" onclick="assignmentCustomer(${tableList.id})">
                                      <i class="ace-icon glyphicon glyphicon-list"></i>
                                    </a>
                                </security:authorize>

                                <a class="btn btn-xs btn-info" title="Sửa thông tin" href="/admin/customer-edit-${tableList.id}">
                                  <i class="ace-icon fa fa-pencil bigger-120"></i>
                                </a>

                                <security:authorize access="hasRole('MANAGER')">
                                    <a class="btn btn-xs btn-danger" title="Xóa khách hàng" onclick="deleteCustomer(${tableList.id})">
                                      <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                    </a>
                                </security:authorize>
                            </display:column>
                        </display:table>
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

        $('#btnDeleteCustomer').click(function (e){
            e.preventDefault();
            var customerIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function (){
                return $(this).val();
            }).get();
            deleteCustomer(customerIds);
        });

        function deleteCustomer(id){
            var customerId = [id];
            deleteCustomers(customerId);
        }

        function deleteCustomers(id){
            $.ajax({
              type: "DELETE",
              url: "${customerAPI}" + id,
              data: JSON.stringify(id),       // chuyển data về dạng json
              contentType: "application/json",   //Khai báo kiểu dữ liệu bạn gửi lên server là JSON
              success: function(){
                  window.location.href = "<c:url value="/admin/customer-list?message=success"></c:url>"
              },
              error: function(){
                  console.log("failed");
              }
          });
        }
        $('#btnAssignmentCustomer').click(function (e){
            e.preventDefault();
            var data = {}
            data['customerId'] = $('#customerId').val();
            var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function (){
                return $(this).val();
            }).get();
            data['staffs'] = staffs;
            if(data['staffs'] != ' '){
                assignmentOfCustomer(data);
            }
        })

        function assignmentOfCustomer(data){
            $.ajax({
              type: "POST",
              url: "${customerAPI}" + "assignment",
              data: JSON.stringify(data),       // chuyển data về dạng json
              contentType: "application/json",   //Khai báo kiểu dữ liệu bạn gửi lên server là JSON
              success: function(){
                  alert("Giao tòa nhà thành công");
                  window.location.href = "<c:url value="/admin/customer-list"></c:url>"
              },
              error: function(){
                  window.location.href = "<c:url value="/admin/customer-list?message=error"></c:url>"
              }
          });
        }

    </script>
</body>
</html>
