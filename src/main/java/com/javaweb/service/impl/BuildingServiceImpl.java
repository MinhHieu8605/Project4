package com.javaweb.service.impl;

import com.javaweb.api.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import com.javaweb.service.RentAreaService;
import com.javaweb.utils.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;
    @Autowired
    private BuildingDTOConverter buildingDTOConverter;
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private RentAreaService rentAreaService;

    @Autowired
    private AssignmentBuildingService assignmentBuildingService;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "staff");
//        List<UserEntity> staffAssignment = building.getUserEntities();
        List<UserEntity> staffAssignment = building.getAssignBuildingEntities()
                .stream()
                .map(AssignBuildingEntity::getUserEntity)
                .collect(Collectors.toList());
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity it : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("Checked");
            }else staffResponseDTO.setChecked("");
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("Success");
        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) {
//        List<String> typeCode = buildingSearchRequest.getTypeCode();
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest);
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchBuilder);
        List<BuildingSearchResponse> res = new ArrayList<>();
        for(BuildingEntity item : buildingEntities){
            BuildingSearchResponse building = buildingDTOConverter.toBuildingSearchResponse(item);
            res.add(building);
        }
        return res;
    }

    @Override
    public BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO){
//        Long buildingId = buildingDTO.getId();
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        buildingEntity.setType(String.join(",", buildingDTO.getTypeCode()));
        buildingRepository.save(buildingEntity);             // save: có id là update, không có là thêm mới
        if(StringUtils.check(buildingDTO.getRentArea())) rentAreaService.addRentArea(buildingDTO);
        return buildingDTO;
    }

    @Override
    public BuildingDTO findById(Long id){
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingDTO res = modelMapper.map(buildingEntity, BuildingDTO.class);
        List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentArea();
        String rentAreaResult = rentAreaEntities.stream().map(it->it.getValue().toString()).collect(Collectors.joining(","));
        res.setRentArea(rentAreaResult);
        if (buildingEntity.getType() != null && !buildingEntity.getType().isEmpty()) {
            List<String> typeCodes = Arrays.asList(buildingEntity.getType().split(","));
            res.setTypeCode(typeCodes);
        }
        return res;
    }

    @Override
    public void deleteBuildings(List<Long> ids){
        rentAreaService.deleteByBuildings(ids);
        assignmentBuildingService.deleteByBuildingsIn(ids);
        for(Long id : ids){
            buildingRepository.deleteById(id);
        }
    }

//    @Override
//    public int countTotalItem(List<BuildingSearchResponse> list) {
//        return 0;
//    }
}
