package com.javaweb.repository.custom;

import com.javaweb.api.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepositoryCustom {
    List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder);
    Page<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable);
    int countTotalItems();
}
