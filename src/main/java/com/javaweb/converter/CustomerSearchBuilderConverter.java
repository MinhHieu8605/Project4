package com.javaweb.converter;

import com.javaweb.api.builder.CustomerSearchBuilder;
import com.javaweb.model.request.CustomerSearchRequest;
import org.springframework.stereotype.Component;

@Component
public class CustomerSearchBuilderConverter {
    public CustomerSearchBuilder toCustomerSearchBuilder(CustomerSearchRequest customerSearchRequest) {
        CustomerSearchBuilder customerSearchBuilder = new CustomerSearchBuilder.Builder()
                .setFullName(customerSearchRequest.getFullName())
                .setEmail(customerSearchRequest.getEmail())
                .setPhone(customerSearchRequest.getPhone())
                .setStaffId(customerSearchRequest.getStaffId())
                .build();
        return customerSearchBuilder;
    }
}
