package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;

@Getter
@Setter
public class CustomerDTO extends AbstractDTO{
    @NotBlank(message = "name customer is mandatory")
    private String name;
    private String managementStaff;
    @NotBlank(message = "customerPhone is mandatory")
    private String customerPhone;
    private String email;
    private String demand;
    private String status;
    private String companyName;
    @Positive
    private Long isActive;

}
