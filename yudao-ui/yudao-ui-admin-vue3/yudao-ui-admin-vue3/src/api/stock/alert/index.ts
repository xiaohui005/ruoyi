import request from '@/config/axios'

export interface StockAlertChannelSaveReqVO {
  id?: number
  channelCode: string
  channelName: string
  enabled: boolean
  configJson?: string
}

export interface StockAlertChannelRespVO extends StockAlertChannelSaveReqVO {
  id: number
}

export interface StockAlertChannelTestReqVO {
  channelCode: string
  content?: string
}

export interface StockAlertRuleSaveReqVO {
  id?: number
  watchlistId?: number
  ruleName: string
  ruleType: string
  enabled: boolean
  cooldownMinutes: number
  ruleJson?: string
}

export interface StockAlertRulePageReqVO extends PageParam {
  watchlistId?: number
  enabled?: boolean
}

export interface StockAlertRuleRespVO extends StockAlertRuleSaveReqVO {
  id: number
  updateTime?: string
}

export interface StockAlertRecordPageReqVO extends PageParam {
  symbol?: string
  channelCode?: string
}

export interface StockAlertRecordRespVO {
  id: number
  watchlistId?: number
  ruleId?: number
  channelCode: string
  symbol: string
  alertType: string
  triggerValue: string
  content: string
  sendStatus: string
  sendTime?: string
  responseText?: string
  createTime?: string
}

export interface StockAnalysisConfigRespVO {
  id: number
  configKey: string
  configName: string
  configValue: string
  remark?: string
}

export interface StockAnalysisConfigUpdateReqVO {
  items: Array<{
    configKey: string
    configValue: string
  }>
}

export const getAlertChannelList = () => {
  return request.get<StockAlertChannelRespVO[]>({ url: '/stock/alert/channel-list' })
}

export const saveAlertChannel = (data: StockAlertChannelSaveReqVO) => {
  return request.post<number>({ url: '/stock/alert/channel/save', data })
}

export const testAlertChannel = (data: StockAlertChannelTestReqVO) => {
  return request.post({ url: '/stock/alert/channel/test-send', data })
}

export const getAlertRulePage = (params: StockAlertRulePageReqVO) => {
  return request.get<PageResult<StockAlertRuleRespVO[]>>({ url: '/stock/alert/rule-page', params })
}

export const createAlertRule = (data: StockAlertRuleSaveReqVO) => {
  return request.post<number>({ url: '/stock/alert/rule/create', data })
}

export const updateAlertRule = (data: StockAlertRuleSaveReqVO) => {
  return request.put({ url: '/stock/alert/rule/update', data })
}

export const deleteAlertRule = (id: number) => {
  return request.delete({ url: '/stock/alert/rule/delete?id=' + id })
}

export const getAlertRecordPage = (params: StockAlertRecordPageReqVO) => {
  return request.get<PageResult<StockAlertRecordRespVO[]>>({ url: '/stock/alert/record-page', params })
}

export const getAnalysisConfigList = () => {
  return request.get<StockAnalysisConfigRespVO[]>({ url: '/stock/alert/config-list' })
}

export const updateAnalysisConfig = (data: StockAnalysisConfigUpdateReqVO) => {
  return request.put({ url: '/stock/alert/config/update', data })
}
