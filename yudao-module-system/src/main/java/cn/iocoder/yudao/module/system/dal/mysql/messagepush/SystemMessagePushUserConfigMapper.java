package cn.iocoder.yudao.module.system.dal.mysql.messagepush;

import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.system.dal.dataobject.messagepush.SystemMessagePushUserConfigDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemMessagePushUserConfigMapper extends BaseMapperX<SystemMessagePushUserConfigDO> {

    default SystemMessagePushUserConfigDO selectByUserIdAndChannelCode(Long userId, String channelCode) {
        return selectOne(new LambdaQueryWrapperX<SystemMessagePushUserConfigDO>()
                .eq(SystemMessagePushUserConfigDO::getUserId, userId)
                .eq(SystemMessagePushUserConfigDO::getChannelCode, channelCode));
    }
}
