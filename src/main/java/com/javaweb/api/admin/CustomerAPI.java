package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ApiResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController(value = "CustomerAPIOfAdmin")
@RequestMapping("/api/customer")
@Tag(name="Customer Api")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private TransactionService transactionService;

    @Operation(summary = "Get all customers")
    @GetMapping
    public List<CustomerSearchResponse> getAllCustomers(@ModelAttribute CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        Page<CustomerSearchResponse> res = customerService.findAll(customerSearchRequest, pageable);
        return res.getContent();
    }

    @Operation(summary = "Add and Update customer")
    @PostMapping
    public ResponseEntity<CustomerDTO> addOrUpdateCustomer(@Valid @RequestBody CustomerDTO customerDTO){
        return ResponseEntity.ok(customerService.addOrUpdateCustomer(customerDTO));
    }

    @Operation(summary = "Delete customer")
    @DeleteMapping("/{ids}")
    public void deleteCustomer(@PathVariable List<Long> ids){
        customerService.deleteCustomers(ids);
    }

    @Operation(summary = "load staffs")
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = customerService.listStaffsOfCustomer(id);
        return result;
    }
    @Operation(summary = "Assignment customer to management staff")
    @PostMapping("/assignment")
    public void updateAssignmentCustomer(@Valid @RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        customerService.addAssignmentCustomer(assignmentCustomerDTO);
    }
    @Operation(summary = "Add and update transaction between staff and customer")
    @PostMapping("/transaction")
    public ResponseEntity<TransactionDTO> addOrUpdateTransaction(@Valid @RequestBody TransactionDTO transactionDTO) {
        return ResponseEntity.ok(transactionService.addOrUpdateTransaction(transactionDTO));
    }

    @Operation(summary = "Lboad Transaction Details between staff and customer")
    @GetMapping("{id}/transactionDetail")
    public ResponseDTO loadTransactionDetails(@PathVariable Long id) {
        ResponseDTO result = transactionService.loadTransactionDetails(id);
        return result;
    }
}


