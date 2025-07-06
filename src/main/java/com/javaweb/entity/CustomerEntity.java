package com.javaweb.entity;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="customer")
@Getter
@Setter
public class CustomerEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "fullname")
    private String name;
    @Column(name= "phone")
    private String customerPhone;
    @Column(name = "email")
    private String email;
    @Column(name = "companyname")
    private String companyName;
    @Column(name = "demand")
    private String demand;
    @Column(name = "status")
    private String status;

    @Column(name = "is_active")
    private Long active;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "assignmentcustomer", joinColumns = @JoinColumn(name = "customerid", nullable = false),
    inverseJoinColumns = @JoinColumn(name = "staffid", nullable = false))
    private List<UserEntity> userEntities = new ArrayList<>();

    @OneToMany(mappedBy = "customerEntity", fetch = FetchType.LAZY)
    private List<TransactionEntity> transactionEntities = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDemand() {
        return demand;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getActive() {
        return active;
    }

    public void setActive(Long active) {
        this.active = active;
    }

    public List<UserEntity> getUserEntities() {
        return userEntities;
    }

    public void setUserEntities(List<UserEntity> userEntities) {
        this.userEntities = userEntities;
    }

    public List<TransactionEntity> getTransactionEntities() {
        return transactionEntities;
    }

    public void setTransactionEntities(List<TransactionEntity> transactionEntities) {
        this.transactionEntities = transactionEntities;
    }
}
