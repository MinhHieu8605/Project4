package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.statusCode;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;

    public CustomerSearchResponse toCustomerSearchResponse(CustomerEntity customerEntity) {
        CustomerSearchResponse customerSearchResponse = modelMapper.map(customerEntity, CustomerSearchResponse.class);
        Map<String, String> status = statusCode.type();
        String statusName = "";
        if(customerEntity.getStatus() != null && customerEntity.getStatus() != "") {
            statusName = status.get(customerEntity.getStatus());
        }
        customerSearchResponse.setStatus(statusName);
        return customerSearchResponse;
    }

    public CustomerEntity toCustomerEntity(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
        return customerEntity;
    }
}
