package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.ResponseDetailDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService {
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private TransactionConverter transactionConverter;
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public List<TransactionEntity> findByCodeAndCustomerId(String code, Long customerId) {
        return transactionRepository.findByCodeAndCustomerEntity_Id(code, customerId);
    }
    @Override
    public TransactionDTO addOrUpdateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = transactionConverter.toTransactionEntity(transactionDTO);
        CustomerEntity customerEntity = customerRepository.findById(transactionDTO.getCustomerId()).get();
        transactionEntity.setCustomerEntity(customerEntity);
        if(transactionDTO.getId() != null) {
            TransactionEntity olTransaction = transactionRepository.findById(transactionDTO.getId()).get();
            transactionEntity.setCreatedDate(olTransaction.getCreatedDate());
            transactionEntity.setCreatedBy(olTransaction.getCreatedBy());
        }
        transactionRepository.save(transactionEntity);
        return transactionDTO;
    }

    @Override
    public ResponseDTO loadTransactionDetails(Long id){
        TransactionEntity transactionEntity = transactionRepository.findById(id).get();
        ResponseDetailDTO responseDetailDTO = new ResponseDetailDTO();
        responseDetailDTO.setNote(transactionEntity.getNote());
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(transactionEntity.getNote());
        return responseDTO;
    }
}
