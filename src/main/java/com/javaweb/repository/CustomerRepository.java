package com.javaweb.repository;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepository extends JpaRepository<CustomerEntity, Long> {
    void deleteByIdIn(List<Long> ids);
//    int countTotalItem(CustomerSearchResponse customerSearchResponse);
}
