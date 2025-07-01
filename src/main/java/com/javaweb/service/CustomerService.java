package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {
    ResponseDTO listStaffsOfCustomer(Long buildingId);
    List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest);
    Page<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable);
    CustomerDTO findById(Long id);
    CustomerDTO addOrUpdateCustomer(CustomerDTO customerDTO);
    void deleteCustomers(List<Long> ids);
    AssignmentCustomerDTO addAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
}