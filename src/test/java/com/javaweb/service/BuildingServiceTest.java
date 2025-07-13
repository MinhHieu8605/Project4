package com.javaweb.service;

import com.javaweb.SpringBootWebApplication;
import com.javaweb.api.builder.BuildingSearchBuilder;
import com.javaweb.constant.SystemConstant;
import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.buildingType;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@SpringBootTest(classes = SpringBootWebApplication.class)
public class BuildingServiceTest {
    @Autowired
    private BuildingService buildingService;

    @MockBean
    private BuildingRepository buildingRepository;

    @MockBean
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;

    @MockBean
    private BuildingDTOConverter buildingDTOConverter;

    @MockBean
    private UserRepository userRepository;

    private BuildingSearchResponse response;
    private BuildingSearchRequest request;
    private BuildingDTO buildingDTO;
    private BuildingEntity buildingEntity;

    private UserEntity staff1, staff2;


    @BeforeEach      // chạy cái này trước rồi mới chạy xuống test
    void initData(){
        request = new BuildingSearchRequest();
        request.setName("ABC");
        request.setStreet("1");
        request.setWard("2");
        request.setDistrict("3");
        request.setTypeCode(Arrays.asList("TANG_TRET", "NGUYEN_CAN"));

        response = new BuildingSearchResponse();
        response.setName("ABCD");
        response.setAddress("1,2,3");
        List<buildingType> typeCodes = Arrays.asList(buildingType.NGUYEN_CAN, buildingType.TANG_TRET);
        response.setTypeCode(typeCodes);

        buildingDTO = new BuildingDTO();
        buildingDTO.setStreet("A");
        buildingDTO.setWard("B");
        buildingDTO.setDistrict("D");
        buildingDTO.setRentArea("1,2,3");
        buildingDTO.setTypeCode(Arrays.asList("TANG_TRET", "NGUYEN_CAN"));

        buildingEntity = new BuildingEntity();
        buildingEntity.setName("Building");
        buildingEntity.setStreet("1");
        buildingEntity.setWard("2");
        buildingEntity.setDistrict("3");
        buildingEntity.setType("TANG_TRET, NGUYEN_CAN");

        staff1 = new UserEntity();
        staff1.setId(101L);
        staff1.setFullName("Nguyen Van A");

        staff2 = new UserEntity();
        staff2.setId(102L);
        staff2.setFullName("Tran Thi B");
    }

    @Test
    void listStaffs_WhenBuildingExits_ShouldReturnStaffsWithCheckedStatus(){
        buildingEntity.setUserEntities(Arrays.asList(staff1));      //gán staff1

        List<UserEntity> staffs = Arrays.asList(staff1, staff2);
        Mockito.when(buildingRepository.findById(1L)).thenReturn(Optional.of(buildingEntity));
        Mockito.when(userRepository.findByStatusAndRoles_Code(SystemConstant.ACTIVE, SystemConstant.STAFF)).thenReturn(staffs);

        ResponseDTO result = buildingService.listStaffs(1L);
        Assertions.assertNotNull(result);
        Assertions.assertEquals("Success", result.getMessage());

        List<StaffResponseDTO> staffResponseDTOS = (List<StaffResponseDTO>) result.getData();
        Assertions.assertEquals(2, staffResponseDTOS.size());

        StaffResponseDTO staffResponse1 = staffResponseDTOS.get(0);
        StaffResponseDTO staffResponse2 = staffResponseDTOS.get(1);

        if(staffResponse1.getStaffId().equals(101L)){
            Assertions.assertEquals("Checked", staffResponse1.getChecked());
            Assertions.assertEquals("", staffResponse2.getChecked());
        }else {
            Assertions.assertEquals("Checked", staffResponse2.getChecked());
            Assertions.assertEquals("", staffResponse1.getChecked());
        }
    }

    @Test
    void searchBuildings_validRequest_Success() {
        Pageable pageable = PageRequest.of(0, 2);    //mỗi trang 2 bản ghi
        BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder().build();
        List<BuildingEntity> buildingEntities = Collections.singletonList(buildingEntity);
        Page<BuildingEntity> buildingEntityPage = new PageImpl<>(buildingEntities, pageable, 1);

        Mockito.when(buildingSearchBuilderConverter.toBuildingSearchBuilder(request)).thenReturn(buildingSearchBuilder);
        Mockito.when(buildingRepository.findAll(buildingSearchBuilder, pageable)).thenReturn(buildingEntityPage);
        Mockito.when(buildingDTOConverter.toBuildingSearchResponse(buildingEntity)).thenReturn(response);
        Page<BuildingSearchResponse> resultPage = buildingService.findAll(request, pageable);

        // Assert
        Assertions.assertEquals(1, resultPage.getTotalElements());         // số tòa nhà tìm được
        Assertions.assertEquals(1, resultPage.getContent().size());         // số phần tử thực tế trong trang
        Assertions.assertEquals("ABCD", resultPage.getContent().get(0).getName());
    }

    @Test
    void createBuilding_validRequest_Success() {
        Mockito.when(buildingDTOConverter.toBuildingEntity(buildingDTO)).thenReturn(buildingEntity);
        Mockito.when(buildingRepository.save(buildingEntity)).thenReturn(buildingEntity);

        BuildingDTO result = buildingService.addOrUpdateBuilding(buildingDTO);
        Assertions.assertEquals(buildingDTO, result);
    }


}
