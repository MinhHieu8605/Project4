package com.javaweb.model.dto;

import javax.validation.constraints.NotBlank;
import java.util.List;

public class AssignmentBuildingDTO {
    @NotBlank(message = "buildingId not mandatory")
    private Long buildingId;
    private List<Long> staffs;

    public Long getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(Long buildingId) {
        this.buildingId = buildingId;
    }

    public List<Long> getStaffs() {
        return staffs;
    }

    public void setStaffs(List<Long> staffs) {
        this.staffs = staffs;
    }
}
