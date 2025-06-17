<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"></c:url>
<c:url var="buildingAPI" value="/api/building"></c:url>
<html>
<head>
    <title>Danh sách tòa nhà</title>
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
            Danh sách tòa nhà
            <small>
              <i class="ace-icon fa fa-angle-double-right"></i>
              overview &amp; stats
            </small>
          </h1>
        </div><!-- /.page-header -->

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
                  <form:form id="listForm" modelAttribute="modelSearch" action="${buildingListURL}" method="GET">
<%--                  buildingListURL đã khai báo link ở dòng 3--%>
                    <div class="row">
                      <div class="form-group">
                      <div class="col-xs-12" style="margin-bottom: 10px;">
                        <div class="col-xs-6">
                          <label for="" class="name">Tên tòa nhà</label>
<%--                          <input type="text" name="name" id="name" value="${modelSearch.name}" class="form-control" placeholder="Nhập tên tòa nhà">--%>
                              <form:input class="form-control" path="name"></form:input>
                        </div>
                        <div class="col-xs-6">
                          <label for="" class="name">Diện tích sàn</label>
<%--                          <input type="number" name="floorArea" id="floorArea" value="${modelSearch.floorArea}" class="form-control" placeholder="Nhập diện tích sàn">--%>
                              <form:input class="form-control" path="floorArea"></form:input>
                        </div>
                      </div>
                    </div>

                      <div class="form-group">
                        <div class="col-xs-12" style="margin-bottom: 10px;">
                          <div class="col-xs-2">
                            <label for="" class="name">Quận</label>
                            <form:select class="form-control" path="district">
                              <form:option value="">--Chọn Quận--</form:option>
                              <form:options items="${districts}"></form:options>
                            </form:select>
                          </div>
                          <div class="col-xs-5">
                            <label for="" class="name">Phường</label>
<%--                            <input type="text" name="ward" value="${modelSearch.ward}" class="form-control" placeholder="Nhập phường">--%>
                                <form:input class="form-control" path="ward"></form:input>
                          </div>
                          <div class="col-xs-5">
                            <label for="" class="name">Đường</label>
<%--                            <input type="text" name="street" value="${modelSearch.street}" class="form-control" placeholder="Nhập đường">--%>
                                <form:input class="form-control" path="street"></form:input>
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-xs-12" style="margin-bottom: 10px;">
                          <div class="col-xs-4">
                            <label for="" class="name">Số tầng hầm</label>
<%--                            <input type="text" name="numberOfBasement" value="" class="form-control" placeholder="Nhập số tầng hầm">--%>
                                <form:input class="form-control" path="numberOfBasement"></form:input>
                          </div>
                          <div class="col-xs-4">
                            <label for="" class="name">Hướng</label>
<%--                            <input type="number" name="direction" value="" class="form-control" placeholder="Nhập hướng">--%>
                            <form:input class="form-control" path="direction"></form:input>
                          </div>
                          <div class="col-xs-4">
                            <label for="" class="name">Hạng</label>
<%--                            <input type="number" name="level" value="" class="form-control" placeholder="Nhập hạng">--%>
                            <form:input class="form-control" path="level"></form:input>
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-xs-12" style="margin-bottom: 10px;">
                          <div class="col-xs-3">

                            <label for="" class="name">Diện tích từ</label>
<%--                            <input type="number" name="areaFrom" value="" class="form-control" placeholder="Nhập diện tích từ">--%>
                            <form:input class="form-control" path="areaFrom"></form:input>
                          </div>
                          <div class="col-xs-3">
                            <label for="" class="name">Diện tích đến</label>
<%--                            <input type="number" name="areaTo" value="" class="form-control" placeholder="Nhập diện tích đến">--%>
                            <form:input class="form-control" path="areaTo"></form:input>
                          </div>
                          <div class="col-xs-3">
                            <label for="" class="name">Giá thuê từ</label>
<%--                            <input type="number" name="rentPriceFrom" value="" class="form-control" placeholder="Nhập giá thuê từ">--%>
                            <form:input class="form-control" path="rentPriceFrom"></form:input>
                          </div>
                          <div class="col-xs-3">
                            <label for="" class="name">Giá thuê đến</label>
<%--                            <input type="number" name="rentPriceTo" value="" class="form-control" placeholder="Nhập giá thuê đến">--%>
                            <form:input class="form-control" path="rentPriceTo"></form:input>
                          </div>

                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-xs-12" style="margin-bottom: 10px;">
                          <div class="col-xs-5">
                            <label for="" class="name">Tên quản lí</label>
<%--                            <input type="text" name="managerName" value="" class="form-control" placeholder="Nhập phường">--%>
                            <form:input class="form-control" path="managerName"></form:input>
                          </div>
                          <div class="col-xs-5">
                            <label for="" class="name">SDT quản lí</label>
                            <input type="text" name="managerPhoneNumber" value="" class="form-control" placeholder="Nhập đường">
<%--                            <form:input class="form-control" path="managerPhone"></form:input>--%>
                          </div>
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
                        <div class="col-xs-12" style="margin-bottom: 10px;">
                          <div class="col-xs-6">
                            <form:checkboxes items="${typeCodes}" path="typeCode"></form:checkboxes>
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-xs-12">
                          <div class="col-xs-6">
                            <button class="btn btn-danger" id="btnSearchBuilding">
                              <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                              </svg>
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
                <a href="/admin/building-edit">
                  <button class="btn btn-info" title="Thêm tòa nhà">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                      <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"></path>
                      <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"></path>
                      <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"></path>
                    </svg>
                  </button>
                </a>

                <button type="button" class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                  <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"></path>
                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"></path>
                    <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"></path>
                  </svg>
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- bảng danh sách -->
        <div class="row" style="margin-top: 50px">
          <div class="col-xs-12">
            <table id="tableList" class="table table-striped table-bordered table-hover" style="font-family: 'Times New Roman', Times, serif;">
              <thead>
                <tr>
                  <th class="center">
                    <label class="pos-rel">
                      <input type="checkbox" class="ace" name="checkList" value="">
                      <span class="lbl"></span>
                    </label>
                  </th>
                  <th>Tên tòa nhà</th>
                  <th>Địa chỉ</th>
                  <th>Số tầng hầm</th>
                  <th>Tên quản lí</th>
                  <th>Số điện thoại</th>
                  <th>DT sàn</th>
                  <th>DT trống</th>
                  <th>DT thuê</th>
                  <th>Giá thuê</th>
                  <th>Phí dịch vụ</th>
                  <th>Phí môi giới</th>
                  <th>Thao tác</th>
                </tr>
              </thead>

              <tbody>
              <c:forEach var="item" items="${buildingList}">
<%--              duyệt vòng lặp lấy dữ liệu đổ lên client--%>
                <tr>
                  <td class="center">
                    <label class="pos-rel">
                      <input type="checkbox" class="ace" name="checkList" value="${item.id}">
<%--                  item này như là buildingSearchRespone--%>
                      <span class="lbl"></span>
                    </label>
                  </td>

                  <td>${item.name}</td>
                  <td>${item.address}</td>
                  <td>${item.numberOfBasement}</td>
                  <td>${item.managerName}</td>
                  <td>${item.managerPhone}</td>
                  <td>${item.floorArea}</td>
                  <td></td>
                  <td>${item.rentArea}</td>
                  <td></td>
                  <td></td>
                  <td></td>

                  <td>
                    <div class="hidden-sm hidden-xs btn-group">
                      <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">
                        <i class="ace-icon glyphicon glyphicon-list"></i>
                      </button>

                      <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${item.id}">
                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                      </a>

                      <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">
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
<%--              <form:form modelAttribute="buildingList">--%>
<%--                <display:table name="buildingList.listResult" cellspacing="0" cellpadding="6"--%>
<%--                               requestURI="${buildingListURL}" partialList="true" sort="external"--%>
<%--                               size="${buildingList.totalItems}" defaultsort="2" defaultorder="ascending"--%>
<%--                               id="tableList" pagesize="${buildingList.maxPageItems}"--%>
<%--                               export="false"--%>
<%--                               class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"--%>
<%--                               style="margin: 30m 0 1.5em;">--%>
<%--                  <display:column title="<fieldset class='form-group'>--%>
<%--                                 <input type='checkbox' id='checkAll' class='check-box-element'>--%>
<%--                                 </fieldset>" class="center select-cell"--%>
<%--                                 headerClass="center select-cell">--%>

<%--                      <fieldset>--%>
<%--                        <input type="checkbox" name="checkList" value="${tableList.id}"--%>
<%--                        id="checkbox_${tableList.id}" class="check-box-element"/>--%>
<%--                      </fieldset>--%>
<%--                  </display:column>--%>
<%--                  <display:column headerClass="text-left" property="name" title="Tên tòa nhà"/>--%>
<%--                  <display:column headerClass="text-left" property="address" title="Địa chỉ"/>--%>
<%--                  <display:column headerClass="text-left" property="numberOfBasement" title="Số tầng hầm"/>--%>
<%--                  <display:column headerClass="text-left" property="managerName" title="Tên quản li"/>--%>
<%--                  <display:column headerClass="text-left" property="managerPhone" title="SĐT quản lí"/>--%>
<%--                  <display:column headerClass="text-left" property="floorArea" title="D.tích sàn"/>--%>
<%--                  <display:column headerClass="text-left" property="floorArea" title="D.tích trống"/>--%>
<%--                  <display:column headerClass="text-left" property="floorArea" title="Phí môi giới"/>--%>

<%--                  <display:column headerClass="col-actions" title="Thao tác">--%>
<%--                    <a class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">&ndash;%&gt;--%>
<%--                      <i class="ace-icon glyphicon glyphicon-list"></i>--%>
<%--                    </a>--%>

<%--                    <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${item.id}">--%>
<%--                      <i class="ace-icon fa fa-pencil bigger-120"></i>--%>
<%--                    </a>--%>

<%--                    <a class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">--%>
<%--                      <i class="ace-icon fa fa-trash-o bigger-120"></i>--%>
<%--                    </a>--%>
<%--                  </display:column>--%>
<%--                </display:table>--%>
<%--              </form:form>--%>
              </tbody>
            </table>
          </div><!-- /.span -->
        </div>
        <!-- End bảng danh sách -->
      </div><!-- /.page-content -->
    </div>


  <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
  </a>
</div><!-- /.main-container -->

<!-- Modal -->
  <div class="modal fade" id="assignmentBuildingModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
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
          <input type="hidden" id="buildingId" name="Building" value="">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="btnassignmentBuilding">Giao tòa nhà</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>

    </div>
  </div>
  <script>
      function assignmentBuilding(buildingId){
        $('#assignmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId);
      }

      function loadStaff(buildingId){
          $.ajax({
              type: "GET",
              // url: "http://localhost:8081/admin/building",
              url: "${buildingAPI}/" + buildingId + "/staffs",
              // data: JSON.stringify(id),       // chuyển data về dạng json
              // contentType: "application/json",   //Khai báo kiểu dữ liệu bạn gửi lên server là JSON
              dataType: "JSON",     // định dạng dữ liệu từ server gửi lên
              success: function(response){
                  var row = '';
                  $.each(response.data, function (i, item){
                    row += '<tr>';
                    row += '<td class="text-center"><input type="checkbox" value="' + item.staffId + '" id="checkbox_' + item.staffId + '"' + item.checked + '></td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>'
                  });
                  $('#staffList tbody').html(row);
                  console.info("success");
              },
              error: function(response){
                  console.log("failed");
                  window.location.href = "<c:url value="/admin/building-list?message=error"></c:url>"
                  console.log(response);
              }
          });
      }


      $('#btnassignmentBuilding').click(function(e){
          e.preventDefault();
          var data = {};
          data['buildingId'] = $('#buildingId').val();
          var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
            //map:Duyệt qua từng checkbox đã chọn và trả về giá trị (value) của từng checkbox đó.
            return $(this).val();
          }).get();    // Chuyển đối tượng jQuery (jQuery object) thành mảng thông thường (Array) chứa danh sách các giá trị.
          data['staffs'] = staffs;
          if(data['staffs'] != ''){
              assignment(data);
          }
          console.log("ok");
      });

      function assignment(data){
          $.ajax({
              type: "POST",
              // url: "http://localhost:8081/admin/building",
              url: "${buildingAPI}/" + "assignment",
              data: JSON.stringify(data),       // chuyển data về dạng json
              contentType: "application/json",   //Khai báo kiểu dữ liệu bạn gửi lên server là JSON
              dataType: "JSON",     // định dạng dữ liệu từ server gửi lên
              success: function(response){
                  console.info("success");
                  alert("Giao tòa nhà thành công");
                  window.location.href = "<c:url value="/admin/building-list"></c:url>"
              },
              error: function(response){
                  console.info("failed");
                  window.location.href = "<c:url value="/admin/building-list?message=error"></c:url>"
                  console.log(response);
              }
          });
      }

      $('#btnSearchBuilding').click(function(e){
          e.preventDefault();
          $('#listForm').submit();
      });

      function deleteBuilding(id){
        var buildingId = [id];
        deleteBuildings(buildingId);
      }
      $('#btnDeleteBuilding').click(function(e){
          e.preventDefault();
          var buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
            //map:Duyệt qua từng checkbox đã chọn và trả về giá trị (value) của từng checkbox đó.
            return $(this).val();
          }).get();    // Chuyển đối tượng jQuery (jQuery object) thành mảng thông thường (Array) chứa danh sách các giá trị.
          deleteBuilding(buildingIds);
      });
      function deleteBuildings(id){
          $.ajax({
              type: "DELETE",
              // url: "http://localhost:8081/admin/building",
              url: "${buildingAPI}/" + id,
              data: JSON.stringify(id),       // chuyển data về dạng json
              contentType: "application/json",   //Khai báo kiểu dữ liệu bạn gửi lên server là JSON
              dataType: "JSON",     // định dạng dữ liệu từ server gửi lên
              success: function(respond){
                  console.log("success");
                  window.location.href = "<c:url value="/admin/building-list?message=success"></c:url>"
              },
              error: function(respond){
                  console.log("failed");
                  console.log(respond);
              }
          });
      }

  </script>
  </body>
  </html>
