package com.javaweb.service.impl;

//@Service
public class AssignmentBuildingServiceImpl{
//    @Autowired
//    private BuildingRepository buildingRepository;
//
//    @Autowired
//    private UserRepository userRepository;
//
//    @Autowired
//    private AssignmentBuildingRepository assignmentBuildingRepository;
//    @Override
//    public void deleteByBuildingsIn(List<Long> ids){
//        for(Long id : ids){
//            BuildingEntity buildingEntity = buildingRepository.findById(id).get();
//            assignmentBuildingRepository.deleteByBuildingEntity(buildingEntity);
//        }
////            assignmentBuildingRepository.deleteByBuildingEntityIdIn(ids);
//    }
//
//    @Override
//    @Transactional
//    public void addAssignmentBuildingEntity(AssignmentBuildingDTO assignmentBuildingDTO) {
//        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
////        assignmentBuildingRepository.deleteByBuildingEntity(buildingEntity);   // Xóa các bản ghi phân công nhân viên cũ của tòa nhà đó
//        try {
//            assignmentBuildingRepository.deleteByBuildingEntity(buildingEntity);
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("Lỗi khi xóa phân công nhân viên của tòa nhà!");
//            return;
//        }
//        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
//        for(Long id : staffIds){
//            AssignBuildingEntity assignBuildingEntity = new AssignBuildingEntity();
//            assignBuildingEntity.setBuildingEntity(buildingEntity);
//            UserEntity userEntity = userRepository.findById(id).get();
//            assignBuildingEntity.setUserEntity(userEntity);
//            assignmentBuildingRepository.save(assignBuildingEntity);
//        }
//    }
}
