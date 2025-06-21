package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.utils.DistrictCode;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class BuildingDTOConverter {

    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private RentAreaConverter rentAreaConverter;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse res = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentArea();
        String rentAreaResult = rentAreaEntities.stream().map(it->it.getValue().toString()).collect(Collectors.joining(","));
        res.setRentArea(rentAreaResult);

        Map<String, String> districts = DistrictCode.type();
        String districtName = "";
        if(buildingEntity.getDistrict() != null && buildingEntity.getDistrict() != "") {
            districtName = districts.get(buildingEntity.getDistrict());
        }
        if(districtName != null && !districtName.equals("")) {
            res.setAddress(buildingEntity.getStreet() + "," + buildingEntity.getWard() + "," + districtName );
        }
        return res;
    }


    public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity) {
        return modelMapper.map(buildingEntity, BuildingDTO.class);
    }

    public BuildingEntity toBuildingEntity(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        buildingEntity.setType(String.join(",", buildingDTO.getTypeCode()));
        buildingEntity.setRentArea(rentAreaConverter.toRentAreaEntityList(buildingDTO, buildingEntity));
        return buildingEntity;
    }
}
