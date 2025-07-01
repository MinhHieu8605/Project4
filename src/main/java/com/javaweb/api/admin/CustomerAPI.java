package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "CustomerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private TransactionService transactionService;

//    @GetMapping
//    public List<CustomerSearchResponse> getAllCustomers(@ModelAttribute CustomerSearchRequest customerSearchRequest) {
//        List<CustomerSearchResponse> res = customerService.findAll(customerSearchRequest);
//        return res;
//    }

    @GetMapping
    public List<CustomerSearchResponse> getAllCustomers(@ModelAttribute CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        Page<CustomerSearchResponse> res = customerService.findAll(customerSearchRequest, pageable);
        return res.getContent();
    }

    @PostMapping
    public ResponseEntity addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO){
        return ResponseEntity.ok(customerService.addOrUpdateCustomer(customerDTO));
    }

    @DeleteMapping("/{ids}")
    public void deleteCustomer(@PathVariable List<Long> ids){
        customerService.deleteCustomers(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = customerService.listStaffsOfCustomer(id);
        return result;
    }

    @PostMapping("/assignment")
    public void updateAssignmentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        customerService.addAssignmentCustomer(assignmentCustomerDTO);
    }

    @PostMapping("/transaction")
    public ResponseEntity<TransactionDTO> addOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO) {
        return ResponseEntity.ok(transactionService.addOrUpdateTransaction(transactionDTO));
    }

    @GetMapping("{id}/transactionDetail")
    public ResponseDTO loadTransactionDetails(@PathVariable Long id) {
        ResponseDTO result = transactionService.loadTransactionDetails(id);
        return result;
    }
}


