import request from '@/config/axios'

export interface MarketSignalCurrentRespVO {
  tradeDate: string
  signalCode: string
  signalName: string
  tradable: boolean
  riskLevel: string
  reasonText: string
  hotTheme: string
  limitUpCount: number
  limitDownCount: number
  risingCount: number
  fallingCount: number
  indexClose: number
  indexChangePct: number
  turnoverAmount: number
  turnoverRatio: number
  snapshotTime: string
}

export interface MarketSignalPageReqVO extends PageParam {
  signalCode?: string
}

export interface MarketSignalRespVO {
  id: number
  tradeDate: string
  signalCode: string
  signalName: string
  tradable: boolean
  riskLevel: string
  reasonText: string
  createTime: string
}

export const getCurrentSignal = () => {
  return request.get<MarketSignalCurrentRespVO>({ url: '/stock/market-signal/current' })
}

export const refreshCurrentSignal = () => {
  return request.post<MarketSignalCurrentRespVO>({ url: '/stock/market-signal/refresh' })
}

export const getMarketSignalPage = (params: MarketSignalPageReqVO) => {
  return request.get<PageResult<MarketSignalRespVO[]>>({ url: '/stock/market-signal/page', params })
}
