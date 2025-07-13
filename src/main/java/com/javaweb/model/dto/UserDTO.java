package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class UserDTO extends AbstractDTO {
    @NotBlank(message = "userName is mandatory")
    private String userName;
    @NotBlank(message = "fullName is mandatory")
    private String fullName;
    @NotBlank(message = "password is mandatory")
    private String password;
    @NotBlank(message = "status is mandatory")
    private Integer status;
    private List<RoleDTO> roles = new ArrayList<>();
    private String roleName;
    private String roleCode;
    private Map<String,String> roleDTOs = new HashMap<>();

}
