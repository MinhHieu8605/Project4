package com.javaweb.controller.admin;



import com.javaweb.api.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService;
    @Autowired
    private BuildingService buildingService;

    @RequestMapping(value="/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch",buildingSearchRequest);          // tự đặt tên là modelSearch
        //Xuong DB lấy dữ liệu
        List<BuildingSearchResponse> res = buildingService.findAll(buildingSearchRequest);
//        BuildingSearchResponse buildingSearchResponse = new BuildingSearchResponse();
//        buildingSearchResponse.setListResult(res);
//        buildingSearchResponse.setTotalItems(buildingService.countTotalItem(res));
        mav.addObject("buildingList", res);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());

        return mav;
    }

    @RequestMapping(value="/admin/building-edit", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute BuildingDTO buildingDTO, HttpServletRequest request) {          // ở controller nếu dùng modelAndView thì http method bắt buộc là get
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }

    @RequestMapping(value="/admin/building-edit-{id}", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request) {          // ở controller nếu dùng modelAndView thì http method bắt buộc là get
        ModelAndView mav = new ModelAndView("admin/building/edit");
        //xuống db tìm building theo id
        BuildingDTO buildingDTO = buildingService.findById(id);
        System.out.println(buildingService.findById(id));
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }
}
