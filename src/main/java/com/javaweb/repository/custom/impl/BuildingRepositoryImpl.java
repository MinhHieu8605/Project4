package com.javaweb.repository.custom.impl;

import com.javaweb.api.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql) {
        Long staffId = buildingSearchBuilder.getStaffId();
        if (staffId != null) {
            sql.append(" INNER JOIN assignmentbuilding ON b.id = assignmentbuilding.buildingid ");
        }
    }

    public static void queryNormal(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {
        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);   //Cho phép truy cập vào thuộc tính private của BuildingSearchBuilder
                String fieldName = item.getName();        // getName của fieldName

                if (!fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.startsWith("area") && !fieldName.startsWith("rentPrice")) {
                    Object value = item.get(buildingSearchBuilder);
                    if (value != null && !value.toString().trim().isEmpty()) {
                        if (item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer")
                                || item.getType().getName().equals("java.lang.Float")) {
                            where.append(" AND b." + fieldName + " = " + value + " ");
                        } else if (item.getType().getName().equals("java.lang.String")) {
                            where.append(" AND b." + fieldName + " Like '%" + value + "%' ");
                        }
                    }
                }
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }

    public static void querySpecial(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {
        Long staffId = buildingSearchBuilder.getStaffId();
        if (staffId != null) {
            where.append(" AND assignmentbuilding.staffid = " + staffId);
        }
        Long rentAreaFrom = buildingSearchBuilder.getAreaFrom();
        Long rentAreaTo = buildingSearchBuilder.getAreaTo();
        if (rentAreaFrom != null || rentAreaTo != null) {
            where.append(" AND EXISTS (SELECT * FROM rentarea WHERE b.id = rentarea.buildingid");   // thay thế cho join
            if (rentAreaFrom != null) {
                where.append(" AND rentarea.value >= " + rentAreaFrom);
            }
            if (rentAreaTo != null) {
                where.append(" AND rentarea.value <= " + rentAreaTo);
            }
            where.append(" ) ");
        }
        Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();
        Long rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
        if (rentPriceFrom != null || rentPriceTo != null) {
            if (rentPriceFrom != null) {
                where.append(" AND b.rentprice >= " + rentPriceFrom);
            }
            if (rentPriceTo != null) {
                where.append(" AND b.rentprice <= " + rentPriceTo);
            }
        }

        //java8
        List<String> typeCode = buildingSearchBuilder.getTypeCode();
        if (typeCode != null && typeCode.size() != 0) {
            where.append(" AND (");
            String sql = typeCode.stream().map(it -> "b.type LIKE " + "'%" + it + "%' ").collect(Collectors.joining(" OR "));
            where.append(sql + " ) ");
        }

    }

    @Override
    public int countTotalItem(BuildingSearchResponse buildingSearchResponse){
        String sql = buildQueryFilter(buildingSearchResponse.getId());
        Query query = entityManager.createNativeQuery(sql);
        return query.getResultList().size();
    }

    private String buildQueryFilter(Long id){
        String sql = "SELECT * FROM building b WHERE b.id = " + id;
        return sql;
    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder) {             // thao tác với csdl
        StringBuilder sql = new StringBuilder(
                "select * from building b "
//                "SELECT b.id, b.name, b.street, b.ward, b.district, " +
//                        "b.numberofbasement, b.floorarea, b.rentprice, b.rentpricedescription, " +
//                        "b.type, b.managername, b.managerphone, b.createdby, b.createddate," +
//                        " b.modifiedby, b.modifieddate FROM building b "
        );

        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");

        joinTable(buildingSearchBuilder, sql);
        queryNormal(buildingSearchBuilder, where);
        querySpecial(buildingSearchBuilder, where);
        where.append(" GROUP BY b.id;");           // tránh bị trùng lặp
        sql.append(where);

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

}
