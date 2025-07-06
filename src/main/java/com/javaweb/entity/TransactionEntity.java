package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name="transaction")
public class TransactionEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name="code")
    private String code;
    @Column(name="note")
    private String note;
    @Column(name="staffid")
    private String staffid;

    @ManyToOne
    @JoinColumn(name="customerid")
    private CustomerEntity customerEntity;

    @PrePersist
    public void prePersist(){
        if(this.getId() == null){
            this.setModifiedDate(null);
            this.setModifiedBy(null);
        }
    }
}
