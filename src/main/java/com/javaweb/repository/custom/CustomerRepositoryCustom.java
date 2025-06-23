package com.javaweb.repository.custom;

import com.javaweb.api.builder.CustomerSearchBuilder;
import com.javaweb.entity.CustomerEntity;

import java.util.List;

public interface CustomerRepositoryCustom {
    List<CustomerEntity> findAll(CustomerSearchBuilder customerSearchBuilder);
}
