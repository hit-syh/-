package com.syh.common.customer.pojos;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("role_permissions")
public class RolePermissions {
    Long roleId;
    Long permissionId;
}
