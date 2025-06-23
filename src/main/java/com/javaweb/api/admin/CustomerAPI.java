package com.javaweb.api.admin;

import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.CustomerService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "CustomerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;

    @GetMapping
    public List<CustomerSearchResponse> getAllCustomers(@ModelAttribute CustomerSearchRequest customerSearchRequest) {
        List<CustomerSearchResponse> res = customerService.findAll(customerSearchRequest);
        return res;
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = customerService.listStaffsOfCustomer(id);
        return result;
    }
}
