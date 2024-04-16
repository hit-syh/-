package com.syh.service.customer.mappers;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.syh.common.customer.pojos.CustomerRoles;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CustomerRolesMapper extends BaseMapper<CustomerRoles> {
    @Select("SELECT permission_name FROM permissions where permission_id in (SELECT permission_id from role_permissions WHERE role_id in(SELECT role_id from customer_roles WHERE customer_id=#{id}))")
    List<String> getPermissionNameListById(@Param("id") Long id);
    @Select("SELECT role_name FROM roles where role_id in (SELECT role_id from customer_roles WHERE customer_id=#{id})")
    List<String> getRoleNameListById(@Param("id") Long id);
}
