package com.javaweb.repository;

import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AssignmentBuildingRepository{
    void deleteByBuildingEntity(BuildingEntity buildingEntity);
//    void deleteByBuildingEntityIdIn(List<Long> ids);
//    List<AssignBuildingEntity> findByBuildingEntity(BuildingEntity buildingEntity);

}
