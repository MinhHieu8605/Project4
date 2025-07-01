package com.javaweb.controller.admin;

import com.javaweb.enums.statusCode;
import com.javaweb.enums.transactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.TransactionService;
import com.javaweb.service.impl.CustomerServiceImpl;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "customerControllerOfAdmin")
public class CustomerController {
    @Autowired
    private UserService userService;
    @Autowired
    private CustomerServiceImpl customerService;
    @Autowired
    private TransactionService transactionService;
    @RequestMapping(value="/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerList(@ModelAttribute CustomerSearchRequest customerSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
//        List<CustomerSearchResponse> res = customerService.findAll(customerSearchRequest);
        mav.addObject("modelSearch",customerSearchRequest);
        mav.addObject("listStaffs", userService.getStaffs());

        DisplayTagUtils.of(request, customerSearchRequest);
        customerSearchRequest.setMaxPageItems(2);

        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffId(staffId);
        }

        //phân trang
        Page<CustomerSearchResponse> res = customerService.findAll(customerSearchRequest, PageRequest.of(customerSearchRequest.getPage() - 1, customerSearchRequest.getMaxPageItems()));
        customerSearchRequest.setListResult(res.getContent());
        customerSearchRequest.setTotalItems(customerService.findAll(customerSearchRequest).size());

        return mav;
    }
    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerEdit(@ModelAttribute CustomerDTO customerDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("customerEdit", customerDTO);
        mav.addObject("statusCode", statusCode.type());
        return mav;
    }

    @RequestMapping(value = "/admin/customer-edit-{id}", method = RequestMethod.GET)
    public ModelAndView customerEdit(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = customerService.findById(id);
        mav.addObject("customerEdit", customerDTO);
        mav.addObject("transactionType", transactionType.type());
        mav.addObject("statusCode", statusCode.type());
        mav.addObject("CSKHList", transactionService.findByCodeAndCustomerId("CSKH", id));
        mav.addObject("DDXList", transactionService.findByCodeAndCustomerId("DDX", id));
        return mav;
    }
}
