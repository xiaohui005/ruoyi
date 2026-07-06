import request from '@/config/axios'

export interface StockRecommendPageReqVO extends PageParam {
  symbol?: string
  adviceAction?: string
  riskLevel?: string
}

export interface StockRecommendRespVO {
  analysisRecordId: number
  watchlistId?: number
  symbol: string
  stockName: string
  watchlistName?: string
  adviceAction: string
  riskLevel: string
  marketSignalName?: string
  volumePriceAdvice?: string
  reasonText?: string
  currentPrice?: number
  changePercent?: number
  supportPrice?: number
  resistancePrice?: number
  buyLowPrice?: number
  buyHighPrice?: number
  sellLowPrice?: number
  sellHighPrice?: number
  invalidCondition?: string
  analyzeTime?: string
}

export const getRecommendPage = (params: StockRecommendPageReqVO) => {
  return request.get<PageResult<StockRecommendRespVO[]>>({ url: '/stock/recommend/page', params })
}

export const refreshRecommendPage = () => {
  return request.post<number>({ url: '/stock/recommend/refresh' })
}
