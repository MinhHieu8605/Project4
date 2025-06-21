package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RentAreaConverter {
    public RentAreaEntity toRentAreaEntity(BuildingEntity buildingEntity, Long val) {
        RentAreaEntity res = new RentAreaEntity();
        res.setBuilding(buildingEntity);
        res.setValue(val);
        return res;
    }

    public List<RentAreaEntity> toRentAreaEntityList(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String[] rentAreas = buildingDTO.getRentArea().split(",");
        List<RentAreaEntity> rentAreaEntityList = new ArrayList<>();
        for(String val : rentAreas) {
            rentAreaEntityList.add(toRentAreaEntity(buildingEntity, Long.valueOf(val)));
        }
        return rentAreaEntityList;
    }

}
