package com.javaweb.repository.custom;

import com.javaweb.api.builder.CustomerSearchBuilder;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerRepositoryCustom {
    List<CustomerEntity> findAll(CustomerSearchBuilder customerSearchBuilder);

    Page<CustomerEntity> findAll(CustomerSearchBuilder customerSearchBuilder, Pageable pageable);

    int countTotalItems();
}
