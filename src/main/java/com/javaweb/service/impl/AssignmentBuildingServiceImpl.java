package com.javaweb.service.impl;

import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Override
    public void deleteByBuildingsIn(List<Long> ids){
        for(Long id : ids){
            BuildingEntity buildingEntity = buildingRepository.findById(id).get();
            assignmentBuildingRepository.deleteByBuildingEntity(buildingEntity);
        }
//            assignmentBuildingRepository.deleteByBuildingEntityIdIn(ids);
    }

    @Override
    @Transactional
    public void addAssignmentBuildingEntity(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
//        assignmentBuildingRepository.deleteByBuildingEntity(buildingEntity);   // Xóa các bản ghi phân công nhân viên cũ của tòa nhà đó
        try {
            assignmentBuildingRepository.deleteByBuildingEntity(buildingEntity);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi khi xóa phân công nhân viên của tòa nhà!");
            return;
        }
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
        for(Long id : staffIds){
            AssignBuildingEntity assignBuildingEntity = new AssignBuildingEntity();
            assignBuildingEntity.setBuildingEntity(buildingEntity);
            UserEntity userEntity = userRepository.findById(id).get();
            assignBuildingEntity.setUserEntity(userEntity);
            assignmentBuildingRepository.save(assignBuildingEntity);
        }
    }
}
