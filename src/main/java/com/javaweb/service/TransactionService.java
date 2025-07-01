package com.javaweb.service;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface TransactionService{
    List<TransactionEntity> findByCodeAndCustomerId(String code, Long customerId);
    TransactionDTO addOrUpdateTransaction(TransactionDTO transactionDTO);
    ResponseDTO loadTransactionDetails(Long id);
}
