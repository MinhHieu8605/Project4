package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;

public interface AssignmentBuildingRepository{
    void deleteByBuildingEntity(BuildingEntity buildingEntity);
//    void deleteByBuildingEntityIdIn(List<Long> ids);
//    List<AssignBuildingEntity> findByBuildingEntity(BuildingEntity buildingEntity);

}
