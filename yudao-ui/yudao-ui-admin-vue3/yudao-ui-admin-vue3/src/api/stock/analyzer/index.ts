import request from '@/config/axios'

export interface StockAnalyzeReqVO {
  symbol: string
}

export interface StockKlinePatternRespVO {
  patternCode: string
  patternName: string
  signalType: string
  signalLabel?: string
  description?: string
  tradeAdvice?: string
}

export interface StockAnalyzeRespVO {
  analysisRecordId: number
  symbol: string
  stockName: string
  latestPrice?: number
  marketSignalCode: string
  marketSignalName: string
  tradable: boolean
  riskLevel: string
  volumePriceType: string
  pricePosition: string
  volumePriceAdvice: string
  adviceAction: string
  reasonText: string
  tStrategySuitable: boolean
  supportPrice: number
  resistancePrice: number
  buyLowPrice: number
  buyHighPrice: number
  sellLowPrice: number
  sellHighPrice: number
  positionRatio: number
  invalidCondition: string
  analyzeTime: string
  klinePatterns?: StockKlinePatternRespVO[]
  reasoningSteps: string[]
}

export interface StockAnalysisRecordPageReqVO extends PageParam {
  symbol?: string
}

export const getAnalyzeResult = (params: StockAnalyzeReqVO) => {
  return request.get<StockAnalyzeRespVO>({ url: '/stock/analyzer/get', params })
}

export const getAnalysisRecordPage = (params: StockAnalysisRecordPageReqVO) => {
  return request.get<PageResult<StockAnalyzeRespVO[]>>({ url: '/stock/analyzer/record-page', params })
}
