package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "building")
@Setter
@Getter
public class BuildingEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="name")
    private String name;

    @Column(name="street")
    private String street;

    @Column(name="ward")
    private String ward;

    @Column(name="district")
    private String district;

    @Column(name="numberofbasement")
    private String numberOfBasement;

    @Column(name="floorarea")
    private Long floorArea;

    @Column(name="rentprice")
    private Long rentPrice;

    @Column(name="rentpricedescription")
    private String rentPriceDescription;

    @Column(name="type")
    private String type;

    @Column(name="managername")
    private String managername;

    @Column(name="managerphone")
    private String managerphone;

    @OneToMany(mappedBy = "building", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE}, orphanRemoval = true)
    private List<RentAreaEntity> rentArea = new ArrayList<>();

    public List<RentAreaEntity> getRentArea() {
        return rentArea;
    }

    public void setRentArea(List<RentAreaEntity> rentArea) {
        this.rentArea = rentArea;
    }
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name="assignmentbuilding",
            joinColumns = @JoinColumn(name="buildingid", nullable = false),
            inverseJoinColumns = @JoinColumn(name="staffid", nullable = false))
    private List<UserEntity> userEntities = new ArrayList<>();

    public List<UserEntity> getUserEntities() {
        return userEntities;
    }

    public void setUserEntities(List<UserEntity> userEntities) {
        this.userEntities = userEntities;
    }

}