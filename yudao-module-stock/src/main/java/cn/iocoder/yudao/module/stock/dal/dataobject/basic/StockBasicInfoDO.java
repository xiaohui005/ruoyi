package cn.iocoder.yudao.module.stock.dal.dataobject.basic;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@TableName("stock_basic_info")
@KeySequence("stock_basic_info_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockBasicInfoDO extends BaseDO {

    private Long id;
    private String symbol;
    private String name;
    private String exchange;
    private String industry;
    private String concepts;
    private Integer status;
}
