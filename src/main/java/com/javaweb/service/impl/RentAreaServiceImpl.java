package com.javaweb.service.impl;

import com.javaweb.converter.RentAreaConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RentAreaServiceImpl implements RentAreaService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private RentAreaConverter rentAreaConverter;
    @Autowired
    private RentAreaRepository rentAreaRepository;

//    @Override
//    public void addRentArea(BuildingDTO buildingDTO){
//        BuildingEntity buildingEntity = buildingRepository.findById(buildingDTO.getId()).get();
//        rentAreaRepository.deleteByBuilding(buildingEntity);    //Xóa hết các RentAreaEntity có building.id đó
//        String[] rentAreas = buildingDTO.getRentArea().trim().split(",");
//        for (String val : rentAreas) {
//            RentAreaEntity rentAreaEntity = rentAreaConverter.toRentAreaEntity(buildingDTO, Long.parseLong(val));
//            rentAreaRepository.save(rentAreaEntity);
//        }
//    }

    @Override
    public void deleteByBuildings(List<Long> ids){
        for (Long id : ids) {
            BuildingEntity buildingEntity = buildingRepository.findById(id).get();
            rentAreaRepository.deleteByBuilding(buildingEntity);
        }
//        rentAreaRepository.deleteBybuildingIdIn(ids);
    }
}
