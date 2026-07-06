import request from '@/config/axios'

export interface StockWatchlistSaveReqVO {
  id?: number
  symbol: string
  name?: string
  collectLevel: string
  collectIntervalMinutes: number
  enableMonitor: boolean
  enableIntraday: boolean
  enableTStrategy: boolean
  enablePriceAlert: boolean
  enableSignalAlert: boolean
  remark?: string
}

export interface StockWatchlistPageReqVO extends PageParam {
  keyword?: string
  enableMonitor?: boolean
}

export interface StockWatchlistRespVO extends StockWatchlistSaveReqVO {
  id: number
  latestCollectTime?: string
  latestAnalyzeTime?: string
  latestAlertTime?: string
  latestAdvice?: string
  currentPrice?: number
  changePercent?: number
}

export interface StockWatchlistRuntimeStateRespVO {
  watchlistId: number
  symbol: string
  name: string
  latestCollectTime?: string
  latestAnalyzeTime?: string
  latestAlertTime?: string
  latestAdvice?: string
  enableMonitor: boolean
}

export const getWatchlistPage = (params: StockWatchlistPageReqVO) => {
  return request.get<PageResult<StockWatchlistRespVO[]>>({ url: '/stock/watchlist/page', params })
}

export const createWatchlist = (data: StockWatchlistSaveReqVO) => {
  return request.post<number>({ url: '/stock/watchlist/create', data })
}

export const updateWatchlist = (data: StockWatchlistSaveReqVO) => {
  return request.put({ url: '/stock/watchlist/update', data })
}

export const deleteWatchlist = (id: number) => {
  return request.delete({ url: '/stock/watchlist/delete?id=' + id })
}

export const manualCollectWatchlist = (id: number) => {
  return request.post<StockWatchlistRespVO>({
    url: '/stock/watchlist/manual-collect',
    params: { id }
  })
}

export const manualCollectAllWatchlist = () => {
  return request.post<number>({
    url: '/stock/watchlist/manual-collect-all'
  })
}

export const getWatchlistRuntimeState = (id: number) => {
  return request.get<StockWatchlistRuntimeStateRespVO>({
    url: '/stock/watchlist/runtime-state',
    params: { id }
  })
}
