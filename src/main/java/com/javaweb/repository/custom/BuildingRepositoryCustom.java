package com.javaweb.repository.custom;

import com.javaweb.api.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.response.BuildingSearchResponse;

import java.util.List;

public interface BuildingRepositoryCustom {
    int countTotalItem(BuildingSearchResponse buildingSearchResponse);

    List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder);
}
