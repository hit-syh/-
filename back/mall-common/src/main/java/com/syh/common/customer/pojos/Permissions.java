package com.syh.common.customer.pojos;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("permissions")
public class Permissions {
    @TableId
    Long permissionId;
    String permissionName;
}
