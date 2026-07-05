<template>
  <ContentWrap>
    <el-form :model="queryParams" inline label-width="88px" class="-mb-15px">
      <el-form-item :label="text.symbolCode">
        <el-input
          v-model="queryParams.symbol"
          :placeholder="placeholder"
          clearable
          class="!w-260px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="text.klineCount">
        <el-input-number v-model="queryParams.limit" :min="20" :max="240" :step="10" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="handleQuery" v-hasPermi="['stock:monitor:query']">
          <Icon icon="ep:search" class="mr-5px" />
          {{ text.queryMarket }}
        </el-button>
      </el-form-item>
    </el-form>
  </ContentWrap>

  <ContentWrap v-if="monitorData" v-loading="loading">
    <div class="summary-grid">
      <div class="summary-card">
        <div class="label">{{ text.stock }}</div>
        <div class="value">{{ monitorData.symbol }} {{ monitorData.stockName }}</div>
      </div>
      <div class="summary-card">
        <div class="label">{{ text.latestPrice }}</div>
        <div class="value">{{ monitorData.latestPrice ?? '-' }}</div>
      </div>
      <div class="summary-card">
        <div class="label">{{ text.marketSignal }}</div>
        <div class="value">{{ monitorData.marketSignalName || '-' }}</div>
      </div>
      <div class="summary-card">
        <div class="label">{{ text.volumePrice }}</div>
        <div class="value">{{ formatVolumePriceType(monitorData.volumePriceType) }}</div>
      </div>
      <div class="summary-card">
        <div class="label">{{ text.advice }}</div>
        <div class="value">{{ formatAdviceAction(monitorData.adviceAction) }}</div>
      </div>
      <div class="summary-card">
        <div class="label">{{ text.supportResistance }}</div>
        <div class="value">
          {{ monitorData.supportPrice ?? '-' }} / {{ monitorData.resistancePrice ?? '-' }}
        </div>
      </div>
      <div class="summary-card">
        <div class="label">{{ text.analyzeTime }}</div>
        <div class="value value--sm">{{ monitorData.analyzeTime || '-' }}</div>
      </div>
    </div>
  </ContentWrap>

  <ContentWrap v-if="monitorData">
    <div class="news-header">
      <div class="news-title">{{ text.relatedNews }}</div>
      <div class="news-subtitle">
        {{ text.recentNewsPrefix }}{{ monitorData.symbol }}{{ text.recentNewsSuffix }}
      </div>
    </div>
    <div v-if="monitorData.newsList?.length" class="news-list">
      <a
        v-for="item in monitorData.newsList"
        :key="`${item.newsUrl || item.title}-${item.publishTime || ''}`"
        class="news-item"
        :href="item.newsUrl || 'javascript:void(0)'"
        target="_blank"
        rel="noreferrer"
      >
        <div class="news-item-top">
          <div class="news-item-title">{{ item.title }}</div>
          <el-tooltip :content="getNewsSentimentDescription(item.sentimentCode)" placement="top">
            <span :class="['news-sentiment-badge', getNewsSentimentBadgeClass(item.sentimentCode)]">
              {{ getNewsSentimentLabel(item.sentimentCode) }}
            </span>
          </el-tooltip>
        </div>
        <div class="news-item-content">{{ item.content || text.noSummary }}</div>
        <div class="news-item-meta">
          <span>{{ item.sourceName || text.eastmoney }}</span>
          <span>{{ item.publishTime || '-' }}</span>
          <el-tooltip :content="getNewsChangeDescription(item.relatedChangePct)" placement="top">
            <span :class="['news-change-badge', getNewsChangeBadgeClass(item.relatedChangePct)]">
              {{ text.relatedChangePct }} {{ formatNewsChangePct(item.relatedChangePct) }}
            </span>
          </el-tooltip>
        </div>
      </a>
    </div>
    <el-empty v-else :description="text.noRelatedNews" />
  </ContentWrap>

  <ContentWrap v-if="monitorData">
    <Echart :options="chartOptions" height="560px" />
  </ContentWrap>

  <ContentWrap v-if="monitorData">
    <el-alert :closable="false" type="info" :title="text.chartTip" />
    <el-table :data="monitorData.klineList" class="mt-16px">
      <el-table-column :label="text.tradeDate" prop="tradeDate" width="120" />
      <el-table-column :label="text.openPrice" prop="openPrice" width="110" />
      <el-table-column :label="text.closePrice" prop="closePrice" width="110" />
      <el-table-column :label="text.highPrice" prop="highPrice" width="110" />
      <el-table-column :label="text.lowPrice" prop="lowPrice" width="110" />
      <el-table-column :label="text.volume" prop="volume" min-width="160" />
    </el-table>
  </ContentWrap>
</template>

<script setup lang="ts">
import * as MonitorApi from '@/api/stock/monitor'
import type { EChartsOption } from 'echarts'

defineOptions({ name: 'StockMonitor' })

const cp = (...codes: number[]) => String.fromCodePoint(...codes)

const text = {
  symbolCode: cp(32929, 31080, 20195, 30721),
  example: cp(20363, 22914),
  or: cp(25110),
  klineCount: cp(75, 32447, 25968, 37327),
  queryMarket: cp(26597, 35810, 34892, 24773),
  stock: cp(32929, 31080),
  latestPrice: cp(26368, 26032, 20215),
  marketSignal: cp(24066, 22330, 33410, 28857),
  volumePrice: cp(37327, 20215, 20851, 31995),
  advice: cp(32508, 21512, 24314, 35758),
  analyzeTime: cp(20998, 26512, 26102, 38388),
  supportResistance: cp(25903, 25745, 32, 47, 32, 21387, 21147),
  relatedNews: cp(30456, 20851, 26032, 38395),
  recentNewsPrefix: cp(26368, 36817, 32, 49, 48, 32, 26465, 19982, 32),
  recentNewsSuffix: cp(32, 30456, 20851, 30340, 36164, 35759),
  noSummary: cp(26242, 26080, 25688, 35201),
  eastmoney: cp(19996, 26041, 36130, 23500),
  noRelatedNews: cp(26242, 26080, 30456, 20851, 26032, 38395),
  chartTip: cp(
    22270, 20013, 21516, 26102, 26631, 35760, 32, 75, 32, 32447, 12289, 25104, 20132, 37327,
    12289, 25903, 25745, 21387, 21147, 20301, 19982, 20080, 21334, 28857, 65292, 26041, 20415,
    24555, 36895, 22797, 26680, 20998, 26512, 32467, 26524, 12290
  ),
  tradeDate: cp(20132, 26131, 26085, 26399),
  openPrice: cp(24320, 30424, 20215),
  closePrice: cp(25910, 30424, 20215),
  highPrice: cp(26368, 39640, 20215),
  lowPrice: cp(26368, 20302, 20215),
  volume: cp(25104, 20132, 37327),
  buy: cp(20080, 20837),
  doT: cp(20570, 84),
  reduce: cp(20943, 20179),
  observe: cp(35266, 23519),
  wait: cp(31561, 24453),
  volumeUpPriceUp: cp(25918, 37327, 19978, 28072),
  priceUpVolumeDown: cp(20215, 28072, 37327, 32553),
  priceDownVolumeUp: cp(20215, 36300, 37327, 22686),
  balance: cp(22343, 34913),
  inputSymbol: cp(35831, 20808, 36755, 20837, 32929, 31080, 20195, 30721),
  kline: cp(75, 32447),
  positive: cp(21033, 22909),
  neutral: cp(20013, 24615),
  negative: cp(21033, 31354)
  ,
  strongPositive: cp(24378, 21033, 22909),
  strongNegative: cp(24378, 21033, 31354),
  relatedChangePct: cp(20851, 32852, 28072, 36300, 24133)
  ,
  strongPositiveDesc: cp(26126, 38395, 25972, 36793, 20986, 29616, 36739, 22823, 20559, 21521, 65292, 23545, 32929, 20215, 24433, 21709, 20559, 22823),
  positiveDesc: cp(26126, 38395, 20559, 21033, 22909, 65292, 23545, 32929, 20215, 20542, 21521, 25512, 21160, 20316, 29992),
  neutralDesc: cp(26126, 38395, 20559, 20013, 24615, 65292, 30446, 21069, 26410, 30475, 21040, 26126, 26174, 21033, 22909, 25110, 21033, 31354),
  negativeDesc: cp(26126, 38395, 20559, 21033, 31354, 65292, 23545, 32929, 20215, 20542, 21521, 21387, 21046, 20316, 29992),
  strongNegativeDesc: cp(26126, 38395, 25972, 36793, 20986, 29616, 36739, 22823, 39118, 38505, 25110, 26126, 26174, 36127, 38754, 20449, 24687, 65292, 23545, 32929, 20215, 21387, 21046, 26356, 24378),
  relatedChangePrefix: cp(26032, 38395, 21457, 24067, 26102, 38388, 23545, 24212, 20132, 26131, 26085, 65288),
  relatedChangeMiddle: cp(20241, 24066, 21017, 39034, 24310, 21040, 19979, 19968, 20132, 26131, 26085, 65289, 30340, 28072, 36300, 24133, 12290),
  relatedRiseDesc: cp(35828, 26126, 26032, 38395, 21457, 24067, 21518, 24066, 22330, 21453, 24212, 20559, 24378),
  relatedFallDesc: cp(35828, 26126, 26032, 38395, 21457, 24067, 21518, 24066, 22330, 21453, 24212, 20559, 24369),
  relatedFlatDesc: cp(35828, 26126, 26032, 38395, 21457, 24067, 21518, 24066, 22330, 21453, 24212, 36739, 24179)
}

const placeholder = `${text.example} 603993 ${text.or} 600519.SH`

const message = useMessage()
const route = useRoute()
const router = useRouter()

const adviceActionMap: Record<string, string> = {
  BUY: text.buy,
  T_STRATEGY: text.doT,
  REDUCE: text.reduce,
  OBSERVE: text.observe,
  WAIT: text.wait
}
const volumePriceTypeMap: Record<string, string> = {
  VOLUME_UP_PRICE_UP: text.volumeUpPriceUp,
  PRICE_UP_VOLUME_DOWN: text.priceUpVolumeDown,
  PRICE_DOWN_VOLUME_UP: text.priceDownVolumeUp,
  BALANCE: text.balance
}
const newsSentimentLabelMap: Record<string, string> = {
  STRONG_POSITIVE: text.strongPositive,
  POSITIVE: text.positive,
  NEUTRAL: text.neutral,
  NEGATIVE: text.negative,
  STRONG_NEGATIVE: text.strongNegative
}
const newsSentimentDescriptionMap: Record<string, string> = {
  STRONG_POSITIVE: text.strongPositiveDesc,
  POSITIVE: text.positiveDesc,
  NEUTRAL: text.neutralDesc,
  NEGATIVE: text.negativeDesc,
  STRONG_NEGATIVE: text.strongNegativeDesc
}
const newsSentimentBadgeClassMap: Record<string, string> = {
  STRONG_POSITIVE: 'is-strong-positive',
  POSITIVE: 'is-positive',
  NEUTRAL: 'is-neutral',
  NEGATIVE: 'is-negative',
  STRONG_NEGATIVE: 'is-strong-negative'
}

const loading = ref(false)
const monitorData = ref<MonitorApi.StockMonitorRespVO>()
const queryParams = reactive({
  symbol: '603993',
  limit: 60
})

const formatAdviceAction = (value?: string) => adviceActionMap[value || ''] || value || '-'
const formatVolumePriceType = (value?: string) => volumePriceTypeMap[value || ''] || value || '-'
const getNewsSentimentLabel = (value?: string) =>
  newsSentimentLabelMap[value || ''] || newsSentimentLabelMap.NEUTRAL
const getNewsSentimentDescription = (value?: string) =>
  newsSentimentDescriptionMap[value || ''] || newsSentimentDescriptionMap.NEUTRAL
const getNewsSentimentBadgeClass = (value?: string) =>
  newsSentimentBadgeClassMap[value || ''] || newsSentimentBadgeClassMap.NEUTRAL
const getNewsChangeBadgeClass = (value?: number) => {
  if (value === undefined || value === null) {
    return 'is-flat'
  }
  if (value >= 5) {
    return 'is-strong-positive'
  }
  if (value > 0) {
    return 'is-positive'
  }
  if (value <= -5) {
    return 'is-strong-negative'
  }
  if (value < 0) {
    return 'is-negative'
  }
  return 'is-flat'
}
const formatNewsChangePct = (value?: number) => {
  if (value === undefined || value === null || Number.isNaN(value)) {
    return '-'
  }
  return `${value > 0 ? '+' : ''}${value.toFixed(2)}%`
}
const getNewsChangeDescription = (value?: number) => {
  const base = `${text.relatedChangePrefix}${text.relatedChangeMiddle}`
  if (value === undefined || value === null || Number.isNaN(value)) {
    return `${base} -`
  }
  if (value > 0) {
    return `${base} ${text.relatedRiseDesc}，${formatNewsChangePct(value)}`
  }
  if (value < 0) {
    return `${base} ${text.relatedFallDesc}，${formatNewsChangePct(value)}`
  }
  return `${base} ${text.relatedFlatDesc}，${formatNewsChangePct(value)}`
}

const normalizeSymbol = (value: unknown) => {
  if (typeof value !== 'string') {
    return ''
  }
  return value.trim()
}

const normalizeLimit = (value: unknown) => {
  const parsed = Number(value)
  if (!Number.isFinite(parsed)) {
    return 60
  }
  return Math.max(20, Math.min(240, Math.trunc(parsed)))
}

const syncQueryParamsFromRoute = () => {
  const symbol = normalizeSymbol(route.query.symbol)
  if (symbol) {
    queryParams.symbol = symbol
  }
  if (route.query.limit !== undefined) {
    queryParams.limit = normalizeLimit(route.query.limit)
  }
}

const buildRouteQuery = () => ({
  symbol: queryParams.symbol.trim(),
  limit: String(queryParams.limit)
})

const hasSameRouteQuery = () => {
  const nextQuery = buildRouteQuery()
  return route.query.symbol === nextQuery.symbol && String(route.query.limit ?? '') === nextQuery.limit
}

const chartOptions = computed<EChartsOption>(() => {
  if (!monitorData.value) {
    return {}
  }
  const klineList = monitorData.value.klineList || []
  const dates = klineList.map((item) => item.tradeDate)
  const klineValues = klineList.map((item) => [
    item.openPrice,
    item.closePrice,
    item.lowPrice,
    item.highPrice
  ])
  const volumes = klineList.map((item) => item.volume)
  const markLineData = (monitorData.value.markLines || []).map((item) => ({
    name: item.name,
    yAxis: item.value,
    label: {
      formatter: `${item.name}: ${item.value}`
    }
  }))
  const markPointData = (monitorData.value.markPoints || []).map((item) => ({
    name: item.name,
    coord: [item.tradeDate, item.value],
    value: item.value
  }))
  return {
    animation: false,
    tooltip: {
      trigger: 'axis'
    },
    legend: {
      data: [text.kline, text.volume]
    },
    axisPointer: {
      link: [{ xAxisIndex: 'all' }]
    },
    grid: [
      { left: 50, right: 30, top: 40, height: '58%' },
      { left: 50, right: 30, top: '74%', height: '16%' }
    ],
    xAxis: [
      {
        type: 'category',
        data: dates,
        boundaryGap: true,
        axisLine: { onZero: false },
        splitLine: { show: false }
      },
      {
        type: 'category',
        gridIndex: 1,
        data: dates,
        boundaryGap: true,
        axisLine: { onZero: false },
        axisTick: { show: false },
        splitLine: { show: false }
      }
    ],
    yAxis: [
      {
        scale: true,
        splitArea: { show: false }
      },
      {
        scale: true,
        gridIndex: 1,
        splitNumber: 2
      }
    ],
    series: [
      {
        name: text.kline,
        type: 'candlestick',
        data: klineValues,
        markLine: {
          symbol: 'none',
          data: markLineData
        },
        markPoint: {
          data: markPointData
        }
      },
      {
        name: text.volume,
        type: 'bar',
        xAxisIndex: 1,
        yAxisIndex: 1,
        data: volumes,
        itemStyle: {
          color: '#7aa2f7'
        }
      }
    ]
  }
})

const getMonitor = async () => {
  const symbol = queryParams.symbol.trim()
  if (!symbol) {
    monitorData.value = undefined
    message.warning(text.inputSymbol)
    return
  }
  loading.value = true
  try {
    monitorData.value = await MonitorApi.getStockMonitor({
      symbol,
      limit: queryParams.limit
    })
  } finally {
    loading.value = false
  }
}

const handleQuery = async () => {
  if (!queryParams.symbol.trim()) {
    message.warning(text.inputSymbol)
    return
  }
  if (hasSameRouteQuery()) {
    await getMonitor()
    return
  }
  await router.push({
    path: '/stock/monitor',
    query: buildRouteQuery()
  })
}

watch(
  () => [route.query.symbol, route.query.limit],
  async () => {
    syncQueryParamsFromRoute()
    await getMonitor()
  },
  { immediate: true }
)
</script>

<style scoped lang="scss">
.summary-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 14px;
}

.news-header {
  display: flex;
  align-items: baseline;
  justify-content: space-between;
  gap: 12px;
  margin-bottom: 16px;
}

.news-title {
  color: var(--el-text-color-primary);
  font-size: 18px;
  font-weight: 700;
}

.news-subtitle {
  color: var(--el-text-color-secondary);
  font-size: 13px;
}

.news-list {
  display: grid;
  gap: 12px;
}

.news-item {
  display: block;
  padding: 16px 18px;
  border-radius: 12px;
  border: 1px solid var(--el-border-color-light);
  background: linear-gradient(180deg, #fff, #f8fafc);
  text-decoration: none;
  transition:
    border-color 0.2s ease,
    transform 0.2s ease,
    box-shadow 0.2s ease;
}

.news-item:hover {
  border-color: var(--el-color-primary-light-5);
  transform: translateY(-1px);
  box-shadow: 0 10px 22px rgb(15 23 42 / 0.07);
}

.news-item-top {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: 12px;
}

.news-sentiment-badge,
.news-change-badge {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 6px 10px;
  border: 1px solid transparent;
  border-radius: 999px;
  font-size: 12px;
  font-weight: 800;
  line-height: 1;
  white-space: nowrap;
}

.news-item-title {
  color: var(--el-text-color-primary);
  font-size: 15px;
  font-weight: 700;
  line-height: 1.6;
}

.news-item-content {
  margin-top: 8px;
  color: var(--el-text-color-regular);
  font-size: 13px;
  line-height: 1.7;
}

.news-item-meta {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 12px;
  margin-top: 12px;
  color: var(--el-text-color-secondary);
  font-size: 12px;
}

.is-strong-positive {
  color: #fff;
  background: #b91c1c;
  border-color: #7f1d1d;
  box-shadow: 0 6px 16px rgb(185 28 28 / 0.22);
}

.is-positive {
  color: #fff;
  background: #dc2626;
  border-color: #991b1b;
}

.is-neutral {
  color: #fff;
  background: #475569;
  border-color: #334155;
}

.is-negative {
  color: #fff;
  background: #15803d;
  border-color: #166534;
}

.is-strong-negative {
  color: #fff;
  background: #14532d;
  border-color: #052e16;
  box-shadow: 0 6px 16px rgb(20 83 45 / 0.22);
}

.is-flat {
  color: #fff;
  background: #64748b;
  border-color: #475569;
}

.summary-card {
  padding: 16px;
  border-radius: 12px;
  border: 1px solid var(--el-border-color-light);
  background: linear-gradient(180deg, #fff, #f8fafc);

  .label {
    color: var(--el-text-color-secondary);
    font-size: 13px;
  }

  .value {
    margin-top: 8px;
    color: var(--el-text-color-primary);
    font-size: 20px;
    font-weight: 700;
    line-height: 1.4;
  }

  .value--sm {
    font-size: 14px;
    font-weight: 600;
    word-break: break-all;
  }
}
</style>
