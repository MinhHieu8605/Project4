package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Component
public class RentAreaConverter {
    public RentAreaEntity toRentAreaEntity(BuildingEntity buildingEntity, Long val) {
        RentAreaEntity result = new RentAreaEntity();
        result.setBuilding(buildingEntity);
        result.setValue(val);
        return result;
    }

    public List<RentAreaEntity> toRentAreaEntityList(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String[] rentAreas = buildingDTO.getRentArea().split(",");
        List<RentAreaEntity> rentAreaEntityList = new ArrayList<>();
        try {
            for(String val : rentAreas) {
                rentAreaEntityList.add(toRentAreaEntity(buildingEntity, Long.valueOf(val)));
            }
        }catch (NumberFormatException e) {
            return Collections.emptyList();
        }
        return rentAreaEntityList;
    }

}
