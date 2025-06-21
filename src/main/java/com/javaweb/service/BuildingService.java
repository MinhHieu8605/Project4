package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;


public interface BuildingService{

    ResponseDTO listStaffs(Long buildingId);
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest);
    public BuildingDTO findById(Long id);
    public BuildingDTO deleteBuildings(List<Long> ids);
    public BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO);
    public AssignmentBuildingDTO addAssignmentBuildingEntity(AssignmentBuildingDTO assignmentBuildingDTO);
//    public int countTotalItem(List<BuildingSearchResponse> list);
}
