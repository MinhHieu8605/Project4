package com.javaweb.service.impl;

import com.javaweb.api.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
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

//    @Autowired
//    private AssignmentBuildingService assignmentBuildingService;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "staff");
        List<UserEntity> staffAssignment = building.getUserEntities();
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
        BuildingEntity buildingEntity = buildingDTOConverter.toBuildingEntity(buildingDTO);
        buildingRepository.save(buildingEntity);
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
    public BuildingDTO deleteBuildings(List<Long> ids){
        BuildingEntity buildingEntity = buildingRepository.findById(ids.get(0)).get();
//        for(Long id : ids){            // cách 1
//            buildingRepository.deleteById(id);
//        }
        buildingRepository.deleteByIdIn(ids);        // cách 2
        return buildingDTOConverter.toBuildingDTO(buildingEntity);
    }

    @Override
    public AssignmentBuildingDTO addAssignmentBuildingEntity(AssignmentBuildingDTO assignmentBuildingDTO){
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
//        List<UserEntity> userEntities = new ArrayList<>();           // cách 1
//        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
//        for(Long id : staffIds){
//            UserEntity userEntity = userRepository.findById(id).get();
//            userEntities.add(userEntity);
//        }
        List<UserEntity> userEntities = userRepository.findByIdIn(assignmentBuildingDTO.getStaffs());    // cách 2
        buildingEntity.setUserEntities(userEntities);
        buildingRepository.save(buildingEntity);
        return assignmentBuildingDTO;
    }

//    @Override
//    public int countTotalItem(List<BuildingSearchResponse> list) {
//        return 0;
//    }
}
