import request from '@/config/axios'

export interface StockTradeJournalSaveReqVO {
  id?: number
  symbol: string
  stockName: string
  buyPrice?: number
  sellPrice?: number
  positionRatio?: number
  profitRate?: number
  systemAdvice?: string
  remark?: string
  tradeTime: string
}

export interface StockTradeJournalPageReqVO extends PageParam {
  symbol?: string
}

export interface StockTradeJournalRespVO extends StockTradeJournalSaveReqVO {
  id: number
}

export const saveTradeJournal = (data: StockTradeJournalSaveReqVO) => {
  return request.post<number>({ url: '/stock/journal/save', data })
}

export const getTradeJournalPage = (params: StockTradeJournalPageReqVO) => {
  return request.get<PageResult<StockTradeJournalRespVO[]>>({ url: '/stock/journal/page', params })
}

export const deleteTradeJournal = (id: number) => {
  return request.delete({ url: '/stock/journal/delete?id=' + id })
}
