package com.javaweb.service;

import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface ICustomerService {
    ResponseDTO listStaffsOfCustomer(Long buildingId);
    List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest);
}
