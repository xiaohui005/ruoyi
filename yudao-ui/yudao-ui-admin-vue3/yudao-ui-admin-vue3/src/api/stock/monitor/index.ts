import request from '@/config/axios'

export interface StockMonitorKLineItem {
  tradeDate: string
  openPrice: number
  closePrice: number
  lowPrice: number
  highPrice: number
  volume: number
}

export interface StockMonitorMarkLine {
  name: string
  value: number
}

export interface StockMonitorMarkPoint {
  name: string
  tradeDate: string
  value: number
}

export interface StockMonitorNewsItem {
  title: string
  content?: string
  sourceName?: string
  publishTime?: string
  newsUrl?: string
  sentimentCode?:
    | 'STRONG_POSITIVE'
    | 'POSITIVE'
    | 'NEUTRAL'
    | 'NEGATIVE'
    | 'STRONG_NEGATIVE'
  relatedChangePct?: number
}

export interface StockMonitorRespVO {
  symbol: string
  stockName: string
  latestPrice?: number
  marketSignalName: string
  volumePriceType: string
  adviceAction: string
  tStrategySuitable: boolean
  supportPrice?: number
  resistancePrice?: number
  analyzeTime?: string
  klineList: StockMonitorKLineItem[]
  markLines: StockMonitorMarkLine[]
  markPoints: StockMonitorMarkPoint[]
  newsList: StockMonitorNewsItem[]
}

export const getStockMonitor = (params: { symbol: string; limit?: number }) => {
  return request.get<StockMonitorRespVO>({ url: '/stock/monitor/get', params })
}
