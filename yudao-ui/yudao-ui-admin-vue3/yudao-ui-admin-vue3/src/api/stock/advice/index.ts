import request from '@/config/axios'

export interface StockAdviceTrackingPageReqVO extends PageParam {
  symbol?: string
  adviceType?: string
  status?: string
}

export interface StockAdviceTrackingRespVO {
  id: number
  watchlistId?: number
  analysisRecordId?: number
  symbol: string
  stockName: string
  adviceType: string
  status: string
  adviceTime?: string
  latestPriceAtAdvice?: number
  supportPrice?: number
  resistancePrice?: number
  buyLowPrice?: number
  buyHighPrice?: number
  sellLowPrice?: number
  sellHighPrice?: number
  positionRatio?: number
  invalidCondition?: string
  riskLevel?: string
  expectedDays?: number
  buyTriggerTime?: string
  sellTriggerTime?: string
  invalidateTime?: string
  expireTime?: string
  closeReason?: string
  estimatedProfitRate?: number
  actualProfitRate?: number
  resultSummary?: string
  createTime?: string
}

export interface StockAdviceTrackingSummaryRespVO {
  totalCount: number
  activeCount: number
  completedCount: number
  invalidatedCount: number
  expiredCount: number
  successRate: number
  invalidRate: number
}

export const getAdviceTrackingPage = (params: StockAdviceTrackingPageReqVO) => {
  return request.get<PageResult<StockAdviceTrackingRespVO[]>>({
    url: '/stock/advice-tracking/page',
    params
  })
}

export const getAdviceTrackingSummary = () => {
  return request.get<StockAdviceTrackingSummaryRespVO>({
    url: '/stock/advice-tracking/summary'
  })
}
