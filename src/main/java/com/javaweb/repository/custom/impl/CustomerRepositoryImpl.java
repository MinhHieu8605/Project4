package com.javaweb.repository.custom.impl;

import com.javaweb.api.builder.CustomerSearchBuilder;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(CustomerSearchBuilder customerSearchBuilder, StringBuilder sql){
        Long staffId = customerSearchBuilder.getStaffId();
        if(staffId != null ){
            sql.append(" INNER JOIN assignmentcustomer ON assignmentcustomer.customerid = customer.id ");
        }
        sql.append(" LEFT JOIN transaction ON transaction.customerid = customer.id ");

    }

    public static void queryNormal(CustomerSearchBuilder customerSearchBuilder, StringBuilder where){
        try{
            Field[] fields = CustomerSearchBuilder.class.getDeclaredFields();
            for(Field item : fields){
                item.setAccessible(true);
                String fieldName = item.getName();
                if(!fieldName.equals("staffId")){
                    Object value = item.get(customerSearchBuilder);
                    if(value != null && !value.toString().trim().isEmpty()){
                        if(item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer")
                        || item.getType().getName().equals("java.lang.Double") || item.getType().getName().equals("java.lang.Float")){
                            where.append(" AND " + fieldName + " = " + value);
                        }else if (item.getType().getName().equals("java.lang.String")){
                            where.append(" AND " + fieldName + " LIKE '%" + value + "%' ");
                        }
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void querySpecial(CustomerSearchBuilder customerSearchBuilder, StringBuilder where){
        Long staffId = customerSearchBuilder.getStaffId();
        if(staffId != null ){
            where.append(" AND assignmentcustomer.staffid = " + staffId);
        }

//        where.append(" AND EXISTS (SELECT * FROM transaction WHERE customer.id = transaction.customerid)");
    }

    @Override
    public List<CustomerEntity> findAll(CustomerSearchBuilder customerSearchBuilder) {
        StringBuilder sql = new StringBuilder("SELECT customer.* FROM customer");

        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
        joinTable(customerSearchBuilder, sql);
        queryNormal(customerSearchBuilder, where);
        querySpecial(customerSearchBuilder, where);
        where.append(" GROUP BY customer.id");
        sql.append(where);

        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

}
