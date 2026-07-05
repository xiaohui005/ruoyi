<template>
  <ContentWrap>
    <el-form :model="formData" inline label-width="88px">
      <el-form-item label="股票代码">
        <el-input
          v-model="formData.symbol"
          placeholder="例如 603993 或 600519.SH"
          clearable
          class="!w-260px"
          @keyup.enter="handleAnalyze"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="handleAnalyze" v-hasPermi="['stock:analyzer:query']">
          <Icon icon="ep:data-analysis" class="mr-5px" />
          立即分析
        </el-button>
        <el-button
          plain
          @click="openWatchlistDialog"
          :disabled="!analyzeResult"
          v-hasPermi="['stock:watchlist:create']"
        >
          <Icon icon="ep:star" class="mr-5px" />
          加入自选股
        </el-button>
      </el-form-item>
    </el-form>
  </ContentWrap>

  <ContentWrap v-if="analyzeResult" v-loading="loading">
    <div class="summary-grid">
      <div class="summary-card">
        <div class="label">股票</div>
        <div class="value">{{ analyzeResult.symbol }} {{ analyzeResult.stockName }}</div>
      </div>
      <div class="summary-card">
        <div class="label">最新价</div>
        <div class="value">{{ analyzeResult.latestPrice ?? '-' }}</div>
      </div>
      <div class="summary-card">
        <div class="label">市场节点</div>
        <div class="value">{{ analyzeResult.marketSignalName || '-' }}</div>
      </div>
      <div class="summary-card">
        <div class="label">综合建议</div>
        <div class="value">{{ formatAdviceAction(analyzeResult.adviceAction) }}</div>
      </div>
    </div>

    <el-alert
      class="mt-16px"
      :closable="false"
      type="info"
      title="分析顺序：先看市场节点，再看量价关系，最后确认是否适合做T。"
    />

    <el-descriptions :column="2" border class="mt-16px">
      <el-descriptions-item label="风险等级">
        {{ formatRiskLevel(analyzeResult.riskLevel) }}
      </el-descriptions-item>
      <el-descriptions-item label="是否可交易">
        {{ analyzeResult.tradable ? '是' : '否' }}
      </el-descriptions-item>
      <el-descriptions-item label="量价类型">
        {{ formatVolumePriceType(analyzeResult.volumePriceType) }}
      </el-descriptions-item>
      <el-descriptions-item label="价格位置">
        {{ formatPosition(analyzeResult.pricePosition) }}
      </el-descriptions-item>
      <el-descriptions-item label="量价建议">
        {{ analyzeResult.volumePriceAdvice || '-' }}
      </el-descriptions-item>
      <el-descriptions-item label="适合做T">
        {{ analyzeResult.tStrategySuitable ? '是' : '否' }}
      </el-descriptions-item>
      <el-descriptions-item label="支撑位">{{ analyzeResult.supportPrice ?? '-' }}</el-descriptions-item>
      <el-descriptions-item label="压力位">{{ analyzeResult.resistancePrice ?? '-' }}</el-descriptions-item>
      <el-descriptions-item label="买入区间">
        {{ analyzeResult.buyLowPrice ?? '-' }} ~ {{ analyzeResult.buyHighPrice ?? '-' }}
      </el-descriptions-item>
      <el-descriptions-item label="卖出区间">
        {{ analyzeResult.sellLowPrice ?? '-' }} ~ {{ analyzeResult.sellHighPrice ?? '-' }}
      </el-descriptions-item>
      <el-descriptions-item label="建议仓位">{{ analyzeResult.positionRatio ?? '-' }}</el-descriptions-item>
      <el-descriptions-item label="失效条件">{{ analyzeResult.invalidCondition || '-' }}</el-descriptions-item>
      <el-descriptions-item label="分析时间" :span="2">
        {{ analyzeResult.analyzeTime || '-' }}
      </el-descriptions-item>
      <el-descriptions-item :label="patternText.summary" :span="2">
        <div class="pattern-wrap">
          <el-space wrap>
            <el-tag
              v-for="item in analyzeResult.klinePatterns || []"
              :key="item.patternCode"
              :type="item.signalType === 'BEARISH' ? 'danger' : 'success'"
              effect="dark"
            >
              {{ item.patternName }} / {{ item.signalLabel || item.signalType }}
            </el-tag>
            <span v-if="!analyzeResult.klinePatterns?.length">-</span>
          </el-space>
          <div v-if="analyzeResult.klinePatterns?.length" class="pattern-list">
            <div
              v-for="item in analyzeResult.klinePatterns || []"
              :key="`${item.patternCode}-detail`"
              class="pattern-item"
            >
              <div class="pattern-name">{{ item.patternName }}</div>
              <div class="pattern-row">
                <span class="pattern-key">{{ patternText.signal }}</span>
                <span
                  class="pattern-value"
                  :class="item.signalType === 'BEARISH' ? 'is-bearish' : 'is-bullish'"
                >
                  {{ item.signalLabel || item.signalType }}
                </span>
              </div>
              <div class="pattern-row">
                <span class="pattern-key">{{ patternText.description }}</span>
                <span class="pattern-value">{{ item.description || '-' }}</span>
              </div>
              <div class="pattern-row">
                <span class="pattern-key">{{ patternText.advice }}</span>
                <span class="pattern-value">{{ item.tradeAdvice || '-' }}</span>
              </div>
            </div>
          </div>
        </div>
      </el-descriptions-item>
      <el-descriptions-item label="触发原因" :span="2">
        {{ analyzeResult.reasonText || '-' }}
      </el-descriptions-item>
    </el-descriptions>

    <el-card class="mt-16px" shadow="never">
      <template #header>推理链路</template>
      <el-timeline>
        <el-timeline-item
          v-for="(item, index) in analyzeResult.reasoningSteps || []"
          :key="`${item}-${index}`"
          :timestamp="`步骤 ${index + 1}`"
        >
          {{ item }}
        </el-timeline-item>
      </el-timeline>
    </el-card>
  </ContentWrap>

  <ContentWrap>
    <div class="section-title">分析记录</div>
    <el-table :data="historyList" v-loading="historyLoading">
      <el-table-column label="股票" min-width="180">
        <template #default="{ row }">{{ row.symbol }} {{ row.stockName }}</template>
      </el-table-column>
      <el-table-column label="市场节点" prop="marketSignalName" min-width="160" />
      <el-table-column label="综合建议" width="120">
        <template #default="{ row }">{{ formatAdviceAction(row.adviceAction) }}</template>
      </el-table-column>
      <el-table-column label="风险等级" width="120">
        <template #default="{ row }">{{ formatRiskLevel(row.riskLevel) }}</template>
      </el-table-column>
      <el-table-column label="量价建议" prop="volumePriceAdvice" min-width="260" show-overflow-tooltip />
      <el-table-column label="分析时间" prop="analyzeTime" width="180" />
    </el-table>
    <Pagination
      :total="historyTotal"
      v-model:page="historyQuery.pageNo"
      v-model:limit="historyQuery.pageSize"
      @pagination="getHistory"
    />
  </ContentWrap>

  <el-dialog v-model="watchlistDialogVisible" title="加入自选股" width="520px">
    <el-form :model="watchlistForm" label-width="120px">
      <el-form-item label="股票代码">
        <el-input v-model="watchlistForm.symbol" disabled />
      </el-form-item>
      <el-form-item label="股票名称">
        <el-input v-model="watchlistForm.name" disabled />
      </el-form-item>
      <el-form-item label="采集级别">
        <el-select v-model="watchlistForm.collectLevel" class="!w-full">
          <el-option label="普通" value="NORMAL" />
          <el-option label="重点" value="KEY" />
          <el-option label="核心" value="CORE" />
        </el-select>
      </el-form-item>
      <el-form-item label="采集周期(分钟)">
        <el-input-number v-model="watchlistForm.collectIntervalMinutes" :min="1" :max="60" />
      </el-form-item>
      <el-form-item label="提醒配置">
        <el-space wrap>
          <el-checkbox v-model="watchlistForm.enableSignalAlert">信号提醒</el-checkbox>
          <el-checkbox v-model="watchlistForm.enablePriceAlert">价格提醒</el-checkbox>
          <el-checkbox v-model="watchlistForm.enableTStrategy">做T分析</el-checkbox>
        </el-space>
      </el-form-item>
      <el-form-item label="备注">
        <el-input v-model="watchlistForm.remark" type="textarea" :rows="3" />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="watchlistDialogVisible = false">取消</el-button>
      <el-button type="primary" @click="handleCreateWatchlist">确认加入</el-button>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import * as AnalyzerApi from '@/api/stock/analyzer'
import * as WatchlistApi from '@/api/stock/watchlist'

defineOptions({ name: 'StockAnalyzer' })

const message = useMessage()

const adviceActionMap: Record<string, string> = {
  BUY: '买入',
  T_STRATEGY: '做T',
  REDUCE: '减仓',
  OBSERVE: '观察',
  WAIT: '等待'
}
const riskLevelMap: Record<string, string> = {
  LOW: '低',
  MEDIUM: '中',
  HIGH: '高'
}
const positionMap: Record<string, string> = {
  LOW: '低位',
  MID: '中位',
  HIGH: '高位'
}
const volumePriceTypeMap: Record<string, string> = {
  VOLUME_UP_PRICE_UP: '放量上涨',
  PRICE_UP_VOLUME_DOWN: '价涨量缩',
  PRICE_DOWN_VOLUME_UP: '价跌量增',
  BALANCE: '均衡'
}

const patternText = {
  summary: '\u5f62\u6001\u63d0\u9192',
  signal: '\u4fe1\u53f7',
  description: '\u8bf4\u660e',
  advice: '\u5efa\u8bae'
}

const loading = ref(false)
const historyLoading = ref(false)
const analyzeResult = ref<AnalyzerApi.StockAnalyzeRespVO>()
const formData = reactive<AnalyzerApi.StockAnalyzeReqVO>({
  symbol: ''
})
const historyList = ref<AnalyzerApi.StockAnalyzeRespVO[]>([])
const historyTotal = ref(0)
const historyQuery = reactive<AnalyzerApi.StockAnalysisRecordPageReqVO>({
  pageNo: 1,
  pageSize: 10,
  symbol: undefined
})

const watchlistDialogVisible = ref(false)
const watchlistForm = reactive<WatchlistApi.StockWatchlistSaveReqVO>({
  symbol: '',
  name: '',
  collectLevel: 'KEY',
  collectIntervalMinutes: 5,
  enableMonitor: true,
  enableIntraday: false,
  enableTStrategy: true,
  enablePriceAlert: true,
  enableSignalAlert: true,
  remark: ''
})

const formatAdviceAction = (value?: string) => adviceActionMap[value || ''] || value || '-'
const formatRiskLevel = (value?: string) => riskLevelMap[value || ''] || value || '-'
const formatPosition = (value?: string) => positionMap[value || ''] || value || '-'
const formatVolumePriceType = (value?: string) => volumePriceTypeMap[value || ''] || value || '-'

const getHistory = async () => {
  historyLoading.value = true
  try {
    const data = await AnalyzerApi.getAnalysisRecordPage(historyQuery)
    historyList.value = data.list
    historyTotal.value = data.total
  } finally {
    historyLoading.value = false
  }
}

const handleAnalyze = async () => {
  if (!formData.symbol) {
    message.warning('请先输入股票代码')
    return
  }
  loading.value = true
  try {
    analyzeResult.value = await AnalyzerApi.getAnalyzeResult(formData)
    historyQuery.symbol = analyzeResult.value.symbol
    historyQuery.pageNo = 1
    await getHistory()
  } finally {
    loading.value = false
  }
}

const openWatchlistDialog = () => {
  if (!analyzeResult.value) {
    return
  }
  watchlistForm.symbol = analyzeResult.value.symbol
  watchlistForm.name = analyzeResult.value.stockName
  watchlistForm.remark = `来自分析页，最近建议：${formatAdviceAction(analyzeResult.value.adviceAction)}`
  watchlistDialogVisible.value = true
}

const handleCreateWatchlist = async () => {
  await WatchlistApi.createWatchlist(watchlistForm)
  message.success('已加入自选股')
  watchlistDialogVisible.value = false
}

onMounted(() => {
  getHistory()
})
</script>

<style scoped lang="scss">
.summary-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 14px;
}

.summary-card {
  padding: 16px;
  border-radius: 12px;
  border: 1px solid var(--el-border-color-light);
  background: linear-gradient(180deg, #fff, #f7fafc);

  .label {
    color: var(--el-text-color-secondary);
    font-size: 13px;
  }

  .value {
    margin-top: 8px;
    font-size: 22px;
    font-weight: 700;
    color: var(--el-text-color-primary);
    line-height: 1.4;
  }
}

.pattern-wrap {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.pattern-list {
  display: grid;
  gap: 12px;
}

.pattern-item {
  padding: 12px 14px;
  border: 1px solid var(--el-border-color-lighter);
  border-radius: 10px;
  background: #fafcff;
}

.pattern-name {
  margin-bottom: 8px;
  font-size: 15px;
  font-weight: 700;
  color: var(--el-text-color-primary);
}

.pattern-row {
  display: grid;
  grid-template-columns: 72px 1fr;
  gap: 8px;
  align-items: start;
  font-size: 13px;

  & + .pattern-row {
    margin-top: 6px;
  }
}

.pattern-key {
  color: var(--el-text-color-secondary);
}

.pattern-value {
  color: var(--el-text-color-primary);
  line-height: 1.6;
}

.is-bullish {
  color: var(--el-color-success-dark-2);
  font-weight: 700;
}

.is-bearish {
  color: var(--el-color-danger-dark-2);
  font-weight: 700;
}

.section-title {
  margin-bottom: 14px;
  color: var(--el-text-color-primary);
  font-size: 16px;
  font-weight: 600;
}
</style>
