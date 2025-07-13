package com.javaweb.model.dto;


import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;
import java.util.List;

@Getter
@Setter
public class BuildingDTO extends AbstractDTO{
    @NotBlank(message = "name is mandatory")
//    @NotEmpty(message = "Not null")
    private String name;

    @Positive
    private Long floorArea;

    private String district;
    private String ward;
    private String street;

    @Positive
    private Long numberOfBasement;

    private String direction;

    @Positive
    private Long level;

    private String rentArea;
    private String rentPrice;
    private String managerName;
    private String managerPhone;

    @Positive
    private Long staffId;

    private List<String> typeCode;

    private String structure;
    private String rentPriceDescription;
    private String serviceFee;
    private String carFee;
    private String motoFee;

    @Positive
    private Double brokerageFee;

    private String overtimeFee;
    private String electricityFee;
    private String deposit;
    private String payment;
    private String rentTime;
    private String decorationTime;
}