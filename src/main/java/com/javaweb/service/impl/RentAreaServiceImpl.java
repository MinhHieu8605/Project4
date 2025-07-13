package com.javaweb.service.impl;

import com.javaweb.converter.RentAreaConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.exception.ResourceNotFoundException;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RentAreaServiceImpl implements RentAreaService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private RentAreaConverter rentAreaConverter;
    @Autowired
    private RentAreaRepository rentAreaRepository;


//    @Override
//    public void deleteByBuildings(List<Long> ids){
//        for (Long id : ids) {
//            BuildingEntity buildingEntity = buildingRepository.findById(id)
//                    .orElseThrow(() -> new ResourceNotFoundException("Building not found"));
//            rentAreaRepository.deleteByBuilding(buildingEntity);
//        }
//    }
}
