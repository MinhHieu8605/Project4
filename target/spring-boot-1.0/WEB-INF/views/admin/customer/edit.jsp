<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerEditListURL" value="/admin/customer-edit"></c:url>
<c:url var="customerAPI" value="/api/customer/"></c:url>
<html>
<head>
    <title>Chỉnh sửa thông tin</title>
</head>
<body>
    <div class="main-content" id="main-content">
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
                    <li class="active">Thêm khách hàng</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Thông tin khách hàng
                    </h1>
                </div><!-- /.page-header -->

                <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form modelAttribute="customerEdit" id="listForm" method="POST">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label for="" class="col-xs-3">Tên khách hàng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-xs-3">Số điện thoại</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="customerPhone"></form:input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-xs-3">Email</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="email"></form:input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-xs-3">Tên công ty</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="companyName"></form:input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-xs-3">Nhu cầu</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="demand"></form:input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-xs-3">Ghi chú</label>
                                    <div class="col-xs-3">
                                        <form:select class="form-control" path="status">
                                            <form:option value="">--Tình trạng--</form:option>
                                            <form:options items="${statusCode}"></form:options>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-xs-3"></label>
                                    <div class="col-xs-6">
                                            <%--                                đây là khi muốn sửa toàn nhà(sửa thì phải có id của tòa nhà đó)--%>
                                        <c:if test="${not empty customerEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Cập nhật khách hàng</button>
                                            <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                        </c:if>
                                            <%--                                đây là khi muốn thêm tòa nhà(khi thêm thì thêm mới không có id)--%>
                                        <c:if test="${empty customerEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Thêm khách hàng</button>
                                            <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                        </c:if>
                                    </div>
                                </div>
                                <form:hidden path="id" id="customerId"></form:hidden>
                                <form:hidden path="modifiedDate" id="modifiedDate"></form:hidden>
                                <form:hidden path="modifiedBy" id="modifiedBy"></form:hidden>
                            </form>
                        </div>
                    </form:form>
                </div>
            </div><!-- /.page-content -->
        </div>


        <c:forEach var="item" items="${transactionType}">
            <div class="col-xs-12">
                <div class="col-sm-12">
                    <h3 class="header smaller lighter blue">${item.value}</h3>
                </div>

                <c:if test="${item.key == 'CSKH'}">
                    <div class="col-xs-12">
                        <table id="tableList" class="table table-striped table-bordered table-hover" style="font-family: 'Times New Roman', Times, serif; margin-bottom: 0">
                            <thead>
                            <tr>
                                <th>Ngày tạo</th>
                                <th>Người tạo</th>
                                <th>Ngày sửa</th>
                                <th>Người sửa</th>
                                <th>Chi tiết giao dịch</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="CSKH" items="${CSKHList}">
                                <tr>
                                    <td>${CSKH.createdDate}</td>
                                    <td>${CSKH.createdBy}</td>
                                    <td>${CSKH.modifiedDate}</td>
                                    <td>${CSKH.modifiedBy}</td>
                                    <td>${CSKH.note}</td>

                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-xs btn-info" title="Sửa thông tin" onclick="updateTransaction(${CSKH.id}, '${item.key}')">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                        <div class="pull-right">
                            <button class="btn btn-lg btn-primary" onclick="transactionType('${item.key}', ${customerEdit.id})">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                                  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </c:if>
                <c:if test="${item.key == 'DDX'}">
                    <div class="col-xs-12">
                        <table id="tableList" class="table table-striped table-bordered table-hover" style="font-family: 'Times New Roman', Times, serif; margin-bottom: 0">
                            <thead>
                            <tr>
                                <th>Ngày tạo</th>
                                <th>Người tạo</th>
                                <th>Ngày sửa</th>
                                <th>Người sửa</th>
                                <th>Chi tiết giao dịch</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="DDX" items="${DDXList}">
                                <tr>
                                    <td>${DDX.createdDate}</td>
                                    <td>${DDX.createdBy}</td>
                                    <td>${DDX.modifiedDate}</td>
                                    <td>${DDX.modifiedBy}</td>
                                    <td>${DDX.note}</td>

                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-xs btn-info" title="Sửa thông tin" onclick="updateTransaction(${DDX.id}, '${item.key}')">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                        <div class="pull-right">
                            <button class="btn btn-lg btn-primary" onclick="transactionType('${item.key}', ${customerEdit.id})">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                                  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </c:if>
            </div>
        </c:forEach>

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
    <div class="modal fade" id="transactionTypeModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" id="content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Nhập giao dịch</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group has-success">
                        <label for="transactionDetail" class="col-xs-12 col-sm-3 control-label no-padding-right">Chi tiết giao dịch</label>
                        <div class="col-xs-12 col-sm-9">
                            <span class="block input-icon input-icon-right" id="transactionDetailWrapper">
                                <input type="text" id="transactionDetail" class="width-100">
                            </span>
                        </div><!-- /.span -->
                    </div>
                    <input type="hidden" id="customerId" name="customerId" value="">
                    <input type="hidden" id="code" name="code" value="">
                    <input type="hidden" id="id" name="id" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>

        </div>
    </div>

    <script>
        $('#btnAddOrUpdateCustomer').click(function (){
            var data = {};
            var formData = $('#listForm').serializeArray();
            $.each(formData, function (i, item){
                data[item.name] = item.value;
            });
            data['modifiedDate'] = $('#modifiedDate').val();
            data['modifiedBy'] = $('#modifiedBy').val().toString();
            if((!data['customerPhone'] || data['customerPhone'].trim() === "")){
                alert("Vui lòng nhập số điện thoại");
            }else if(!data['name'] || data['name'].trim() === ""){
                alert("Vui lòng nhập tên khách hàng")
            }else{
                addOrUpdateCustomer(data);
            }
        });

        function addOrUpdateCustomer(data){
            $.ajax({
                type: "POST",
                url: "${customerAPI}",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "JSON",
                success: function(respond){
                    console.log("success");
                    window.location.href="<c:url value="/admin/customer-list?message=success"></c:url>"
                },
                error: function(respond){
                    console.log("failed");
                    window.location.href="<c:url value="/admin/customer-edit?message=error"></c:url>"
                }
            });
        }

        $('#btnCancel').click(function (){
            window.location.href = "/admin/customer-list";
        });

        function transactionType(code, customerId){
            resetTransactionModal()
            $('#transactionTypeModal').modal();
            $('#customerId').val(customerId);
            $('#code').val(code);
        }

        function updateTransaction(id, code){
            $('#transactionTypeModal').modal();
            $('#id').val(id);
            $('#code').val(code);
            loadTransactionDetail(id);
        }

        function loadTransactionDetail(id){
            $.ajax({
                type: "GET",
                url: "${customerAPI}" + id + "/transactionDetail",
                dataType: "JSON",
                success: function(respond){
                    console.log("success");
                    var row = '';
                    row = '<input type="text" id="transactionDetail" class="width-100" value="' + respond.data + '" />';
                    $('#transactionDetailWrapper').html(row);
                    $('#transactionTypeModal').modal();
                },
                error: function(respond){
                    window.alert("Fail")
                }
            });
        }

        $('#btnAddOrUpdateTransaction').click(function (e){
            e.preventDefault();
            var data = {};
            var customerId = $('#customerId').val();
            data['id'] = $('#id').val();
            data['customerId'] = customerId;
            data['note'] = $('#transactionDetail').val();
            data['code'] = $('#code').val();
            addOrUpdateTransaction(data, customerId);
        });

        function addOrUpdateTransaction(data, customerId){
            $.ajax({
                type: "POST",
                url: "${customerAPI}" + "transaction",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "JSON",
                success: function(respond){
                    alert("Add transaction successful");
                    window.location.href = "/admin/customer-edit-" + customerId + "?message=success";
                },
                error: function(respond){
                    window.location.href="<c:url value="/admin/customer-edit?message=error"></c:url>"
                }
            });
        }

        function resetTransactionModal() {
            $('#id').val('');
            $('#code').val('');
            $('#transactionDetailWrapper').html('<input type="text" id="transactionDetail" class="width-100" value="" />');
        }

    </script>
</body>
</html>
