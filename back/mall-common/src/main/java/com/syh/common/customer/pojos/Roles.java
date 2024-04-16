package com.syh.common.customer.pojos;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("roles")
public class Roles {
    @TableId
    Long roleId;
    String roleName;
}
