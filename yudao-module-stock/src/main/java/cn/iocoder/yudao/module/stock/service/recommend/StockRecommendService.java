package cn.iocoder.yudao.module.stock.service.recommend;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.stock.controller.admin.recommend.vo.StockRecommendPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.recommend.vo.StockRecommendRespVO;

public interface StockRecommendService {

    PageResult<StockRecommendRespVO> getRecommendPage(StockRecommendPageReqVO reqVO, Long userId);

    Integer refreshRecommendations(Long userId);
}
