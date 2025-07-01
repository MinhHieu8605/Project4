package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.BuildingServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "BuildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {

    @Autowired
    private BuildingService buildingService;
    @Autowired
    private BuildingServiceImpl buildingServiceImpl;

    @GetMapping
    public List<BuildingSearchResponse> getBuildings(@ModelAttribute BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        Page<BuildingSearchResponse> res = buildingService.findAll(buildingSearchRequest, pageable);
        return res.getContent();
    }

    @PostMapping
    public ResponseEntity<BuildingDTO> addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        // xuống db để update or thêm
        return ResponseEntity.ok(buildingService.addOrUpdateBuilding(buildingDTO));
    }

    @DeleteMapping("/{ids}")
    public ResponseEntity<BuildingDTO> deleteBuilding(@PathVariable List<Long> ids) {
        return ResponseEntity.ok(buildingService.deleteBuildings(ids));
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }

    @PostMapping("/assignment")
    public ResponseEntity<ResponseDTO> updateAsssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        buildingService.addAssignmentBuildingEntity(assignmentBuildingDTO);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Successfully added assignment building");
        return ResponseEntity.ok(responseDTO);
    }

}
