package com.javaweb.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.javaweb.SpringBootWebApplication;
import com.javaweb.enums.buildingType;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@SpringBootTest(classes = SpringBootWebApplication.class)
@Slf4j
@AutoConfigureMockMvc
public class BuildingControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private BuildingService buildingService;

    private BuildingSearchResponse response;
    private BuildingSearchRequest request;

    private BuildingDTO buildingDTO;

    @BeforeEach          // chạy cái này trước rồi mới chạy xuống test
    void initData(){
        request = new BuildingSearchRequest();
        request.setName("ABC");
        request.setStreet("1");
        request.setWard("2");
        request.setDistrict("3");
        request.setTypeCode(Arrays.asList("TANG_TRET", "NGUYEN_CAN"));

        response = new BuildingSearchResponse();
        response.setId(100L);
        response.setName("ABC");
        response.setAddress("1,2,3");
        List<buildingType> typeCodes = Arrays.asList(buildingType.NGUYEN_CAN, buildingType.TANG_TRET);
        response.setTypeCode(typeCodes);

        buildingDTO = new BuildingDTO();
        buildingDTO.setStreet("A");
        buildingDTO.setWard("B");
        buildingDTO.setDistrict("D");
        buildingDTO.setRentArea("1,2,3");
        buildingDTO.setTypeCode(Arrays.asList("TANG_TRET", "NGUYEN_CAN"));
    }

    @Test
    void searchBuildings_validRequest_Success() throws Exception {
        // GIVEN
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());

        List<BuildingSearchResponse> responseList = Collections.singletonList(response);
        Page<BuildingSearchResponse> page = new PageImpl<>(responseList);
        Mockito.when(buildingService.findAll(ArgumentMatchers.any(BuildingSearchRequest.class), ArgumentMatchers.any(Pageable.class))).thenReturn(page);


        // WHEN & THEN
        mockMvc.perform(MockMvcRequestBuilders
                        .get("/api/building")
                        .contentType(MediaType.APPLICATION_JSON)
                        .param("page", "1")
                        .param("size", "10")
                        .param("name", request.getName())
                        .param("street", request.getStreet())
                        .param("ward", request.getWard())
                        .param("district", request.getDistrict())
                        .param("typeCode", request.getTypeCode().toArray(new String[0])))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$[0].id").value(100L))
                .andExpect(MockMvcResultMatchers.jsonPath("$[0].name").value("ABC"))
                .andExpect(MockMvcResultMatchers.jsonPath("$[0].typeCode[0]").value("NGUYEN_CAN"));
    }

    @Test
    void createBuilding_validRequest_Success() throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());

        Mockito.when(buildingService.addOrUpdateBuilding(ArgumentMatchers.any())).thenReturn(buildingDTO);

        String content = objectMapper.writeValueAsString(buildingDTO);

        // WHEN & THEN
        mockMvc.perform(MockMvcRequestBuilders
                        .post("/api/building")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.name").value("ABC"))
                .andExpect(MockMvcResultMatchers.jsonPath("$.typeCode[0]").value("TANG_TRET"));
    }

    @Test
    void createBuilding_inValidRequest_Failed() throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());

        Mockito.when(buildingService.addOrUpdateBuilding(ArgumentMatchers.any())).thenReturn(buildingDTO);

        String content = objectMapper.writeValueAsString(buildingDTO);

        // WHEN & THEN
        mockMvc.perform(MockMvcRequestBuilders
                        .post("/api/building")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(MockMvcResultMatchers.status().isBadRequest())
                .andExpect(MockMvcResultMatchers.jsonPath("message").value("Kiểm tra lại các trường bắt buộc"));
    }
}
