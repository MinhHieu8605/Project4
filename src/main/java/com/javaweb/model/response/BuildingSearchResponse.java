package com.javaweb.model.response;


import com.javaweb.enums.buildingType;
import com.javaweb.model.dto.AbstractDTO;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class BuildingSearchResponse extends AbstractDTO {                    // trả dữ liệu ra cho client
	private Long id;
	private String name;
	private String address;
	private Long numberOfBasement;
	private String managerName;
	private String managerPhone;
	private Long floorArea;
	private String rentArea;
    private String emptyArea;
    private Long rentPrice;
    private String serviceFee;
    private Double brokerageFee;
	private List<buildingType> typeCode;

	public List<buildingType> getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(List<buildingType> typeCode) {
		this.typeCode = typeCode;
	}
}
