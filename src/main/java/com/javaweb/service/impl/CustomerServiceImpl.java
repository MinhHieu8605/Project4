package com.javaweb.service.impl;

import com.javaweb.api.builder.CustomerSearchBuilder;
import com.javaweb.converter.CustomerConverter;
import com.javaweb.converter.CustomerSearchBuilderConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import com.javaweb.service.CustomerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CustomerSearchBuilderConverter customerSearchBuilderConverter;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private CustomerConverter customerConverter;
    @Autowired
    private CustomerRepositoryCustom customerRepositoryCustom;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest){
        CustomerSearchBuilder customerSearchBuilder = customerSearchBuilderConverter.toCustomerSearchBuilder(customerSearchRequest);
        List<CustomerEntity> customerEntities = customerRepositoryCustom.findAll(customerSearchBuilder);
        List<CustomerSearchResponse> res = new ArrayList<>();
        for(CustomerEntity item : customerEntities){
            CustomerSearchResponse customer = customerConverter.toCustomerSearchResponse(item);
            res.add(customer);
        }
        return res;
    }

    @Override
    public Page<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable){
        CustomerSearchBuilder customerSearchBuilder = customerSearchBuilderConverter.toCustomerSearchBuilder(customerSearchRequest);
        Page<CustomerEntity> customerEntities = customerRepositoryCustom.findAll(customerSearchBuilder, pageable);
        List<CustomerSearchResponse> res = new ArrayList<>();
        for(CustomerEntity item : customerEntities){
            CustomerSearchResponse customer = customerConverter.toCustomerSearchResponse(item);
            res.add(customer);
        }
        return new PageImpl<>(res, pageable, customerEntities.getTotalElements());
    }

    @Override
    public ResponseDTO listStaffsOfCustomer(Long customerId) {
        CustomerEntity customer = customerRepository.findById(customerId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");  //Roles_Code: trong danh sách roles, tìm những người dùng có ít nhất một vai trò (role) có code bằng với giá trị truyền vào.
        List<UserEntity> staffAssignment = customer.getUserEntities();      // danh sách nhân viên đã được giao
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity it : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("Checked");
            }else staffResponseDTO.setChecked("");
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("Success");
        return responseDTO;
    }

    @Override
    public CustomerDTO findById(Long customerId) {
        CustomerEntity customerEntity = customerRepository.findById(customerId).get();
        CustomerDTO res = modelMapper.map(customerEntity, CustomerDTO.class);
        return res;
    }

    @Override
    public CustomerDTO addOrUpdateCustomer(CustomerDTO customerDTO){
        CustomerEntity customerEntity = customerConverter.toCustomerEntity(customerDTO);
        customerEntity.setActive(1L);
        customerRepository.save(customerEntity);
        return customerDTO;
    }
    @Override
    @Transactional
    public void deleteCustomers(List<Long> ids) {          // xóa mềm
//        customerRepository.deleteByIdIn(ids);
        for(Long id : ids){
            CustomerEntity customerEntity = customerRepository.findById(id).get();
            customerEntity.setActive(0L);
            customerRepository.save(customerEntity);
        }
    }

    @Override
    public AssignmentCustomerDTO addAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();
        List<UserEntity> userEntities = userRepository.findByIdIn(assignmentCustomerDTO.getStaffs());
        customerEntity.setUserEntities(userEntities);
        customerRepository.save(customerEntity);
        return assignmentCustomerDTO;
    }

}
