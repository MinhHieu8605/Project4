<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingEdittURL" value="/admin/building-edit"></c:url>
<c:url var="buildingAPI" value="/api/building"></c:url>
<html>
<head>
    <title>Thêm tòa nhà</title>
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
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Dashboard
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form modelAttribute="buildingEdit" id="listForm" method="POST">
                        <div class="col-xs-12">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="" class="col-xs-3">Tên tòa nhà</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="name"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Quận</label>
                                <div class="col-xs-3">
                                    <form:select class="form-control" path="district">
                                        <form:option value="">--Chọn Quận--</form:option>
                                        <form:options items="${districts}"></form:options>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Phường</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="ward" name="ward" placeholder="Nhập tên phường" value="">--%>
                                    <form:input class="form-control" path="ward"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Đường</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="street" name="street" placeholder="Nhập tên đường" value="">--%>
                                    <form:input class="form-control" path="street"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Kết cấu</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="structure" name="structure" placeholder="Nhập kết cấu" value="">--%>
                                    <form:input class="form-control" path="structure"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Số tầng hầm</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="numberOfBasement" name="numberOfBasement" value="" placeholder="Nhập số tầng hầm">--%>
                                    <form:input class="form-control" path="numberOfBasement"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Diện tích sàn</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="floorArea" name="floorArea" value="" placeholder="Nhập diện tích sàn">--%>
                                    <form:input class="form-control" path="floorArea"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Hướng</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="direction" name="direction" value="" placeholder="Nhập hướng">--%>
                                    <form:input class="form-control" path="direction"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Hạng</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="level" name="level" value="" placeholder="Nhập hạng">--%>
                                    <form:input class="form-control" path="level"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Diện tích thuê</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="rentArea" name="rentArea" value="" placeholder="Nhập diện tích thuê">--%>
                                    <form:input class="form-control" path="rentArea"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Giá thuê</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="rentPrice" value="" name="rentPrice" placeholder="Nhập giá thuê">--%>
                                    <form:input class="form-control" path="rentPrice"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Mô tả giá</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="rentPriceDescription" value="" name="rentPriceDescription" placeholder="Nhập mô tả giá">--%>
                                    <form:input class="form-control" path="rentPriceDescription"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Phí dịch vụ</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="serviceFee" value="" name="serviceFee" placeholder="Nhập phi dịch vụ">--%>
                                    <form:input class="form-control" path="serviceFee"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Phí ô tô</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="carFee" value="" name="carFee" placeholder="Nhập phí ô tô">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Phí mô tô</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="motorbikeFee" value="" name="motorbikeFee" placeholder="Nhập phí mô tô">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Phí ngoài giờ</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="overtimeFee" value="" name="overtimeFee" placeholder="Nhập phí ngoài giờ">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Tiền điện</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="electricityFee" value="" name="electricityFee" placeholder="Nhập tiền điện">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Đặt cọc</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="deposit" value="" name="deposit" placeholder="Nhập đặt cọc">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Thanh toán</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="payment" name="payment" value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Thời gian thuê</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="rentTime" name="rentTime" value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Thời gian trang trí</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="decorationTime" name="decorationTime" value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Tên quản lí</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="managerName" name="managerName" value="">--%>
                                    <form:input class="form-control" path="managerName"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">SĐT quản lí</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="managerPhoneNumber" name="managerPhoneNumber" value="">--%>
                                    <form:input class="form-control" path="managerPhone"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Phí môi giới</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="brokerageFee" name="brokerageFee" value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Loại tòa nhà</label>
                                <div class="col-xs-9">
                                    <form:checkboxes items="${typeCodes}" path="typeCode"></form:checkboxes>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3">Ghi chú</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3"></label>
                                <div class="col-xs-6">
<%--                                đây là khi muốn sửa toàn nhà(sửa thì phải có id của tòa nhà đó)--%>
                                <c:if test="${not empty buildingEdit.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                                    <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                </c:if>
<%--                                đây là khi muốn thêm tòa nhà(khi thêm thì thêm mới không có id)--%>
                                <c:if test="${empty buildingEdit.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm tòa nhà</button>
                                    <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                </c:if>
                                </div>
                            </div>
                            <form:hidden path="id" id="buildingId"></form:hidden>
                        </form>
                    </div>
                    </form:form>
                </div>
            </div><!-- /.page-content -->
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-content -->

    <script>
			$('#btnAddOrUpdateBuilding').click(function(){
				var data = {};       // trả về theo dạng json
				var typeCode = [];
				var formData = $('#listForm').serializeArray();
				$.each(formData, function(i, item){
					if(item.name != "typeCode"){
						data[item.name] = item.value;
					}else typeCode.push(item.value);
				});
				data["typeCode"] = typeCode;
				if(typeCode != ""){              //typeCode bắt buộc phải có, nếu có thì mới gọi api
                    addOrUpdateBuilding(data);
				}else if(typeCode.length === 0){
                    alert("Vui lòng chọn ít nhất một loại tòa nhà");
                    return;
                }

				//call api
				function addOrUpdateBuilding(data){
                    $.ajax({
					type: "POST",
					// url: "http://localhost:8081/admin/building",       // cach1
					url: "${buildingAPI}",      // cach2
					data: JSON.stringify(data),       // chuyển data về dạng json
					contentType: "application/json",   //Khai báo kiểu dữ liệu bạn gửi lên server là JSON
					dataType: "JSON",     // định dạng dữ liệu từ server gửi lên
					success: function(respond){
						console.log("success");
                        window.location.href="<c:url value="/admin/building-list?message=success"></c:url>"
					},
					error: function(respond){
						console.log("failed");
						window.location.href="<c:url value="/admin/building-edit?message=error"></c:url>"
					}
				});
				}
			});

            $('#btnCancel').click(function (){
                window.location.href = "/admin/building-list";
            });
		</script>


</body>
</html>
