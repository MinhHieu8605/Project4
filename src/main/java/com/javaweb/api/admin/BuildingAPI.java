package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.ApiResponse;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController(value = "BuildingAPIOfAdmin")
@RequestMapping("/api/building")
@Tag(name = "Building Api")
public class BuildingAPI {

    @Autowired
    private BuildingService buildingService;

    @Operation(summary = "Get all buildings")
    @GetMapping
    public List<BuildingSearchResponse> getBuildings(@ModelAttribute BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        Page<BuildingSearchResponse> result = buildingService.findAll(buildingSearchRequest, pageable);
        return result.getContent();
    }

    @Operation(summary = "Add and update building")
    @PostMapping
    public ResponseEntity<BuildingDTO> addOrUpdateBuilding(@Valid @RequestBody BuildingDTO buildingDTO) {
        return ResponseEntity.ok(buildingService.addOrUpdateBuilding(buildingDTO));
    }


    @Operation(summary = "Delete building")
    @DeleteMapping("/{ids}")
    public ResponseEntity<BuildingDTO> deleteBuilding(@PathVariable List<Long> ids) {
        return ResponseEntity.ok(buildingService.deleteBuildings(ids));
    }

    @Operation(summary = "Load staffs")
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }

    @Operation(summary = "Assignment building to management staff")
    @PostMapping("/assignment")
    public ResponseEntity<ResponseDTO> updateAsssignmentBuilding(@Valid @RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        buildingService.addAssignmentBuildingEntity(assignmentBuildingDTO);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Successfully added assignment building");
        return ResponseEntity.ok(responseDTO);
    }

}
