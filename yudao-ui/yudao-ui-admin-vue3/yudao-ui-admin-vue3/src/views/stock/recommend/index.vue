<template>
  <ContentWrap>
    <el-form :model="queryParams" inline label-width="88px" class="-mb-15px">
      <el-form-item label="股票代码">
        <el-input
          v-model="queryParams.symbol"
          placeholder="例如 603993"
          clearable
          class="!w-220px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="建议动作">
        <el-select v-model="queryParams.adviceAction" clearable class="!w-180px">
          <el-option label="买入" value="BUY" />
          <el-option label="做T" value="T_STRATEGY" />
          <el-option label="观察" value="OBSERVE" />
        </el-select>
      </el-form-item>
      <el-form-item label="风险等级">
        <el-select v-model="queryParams.riskLevel" clearable class="!w-180px">
          <el-option label="低" value="LOW" />
          <el-option label="中" value="MEDIUM" />
          <el-option label="高" value="HIGH" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button @click="handleQuery">
          <Icon icon="ep:search" class="mr-5px" />
          查询
        </el-button>
        <el-button type="primary" @click="handleRefresh" v-hasPermi="['stock:recommend:query']">
          <Icon icon="ep:refresh" class="mr-5px" />
          刷新推荐
        </el-button>
      </el-form-item>
    </el-form>
  </ContentWrap>

  <ContentWrap>
    <el-alert
      class="mb-16px"
      :closable="false"
      type="info"
      title="推荐列表来自已启用的自选股，点击“刷新推荐”会重新分析当前自选股。"
    />
    <el-table :data="list" v-loading="loading">
      <el-table-column label="股票" min-width="180">
        <template #default="{ row }">
          <el-button link type="primary" @click="openMonitor(row)">
            {{ row.symbol }} {{ row.stockName }}
          </el-button>
        </template>
      </el-table-column>
      <el-table-column label="自选分组" prop="watchlistName" min-width="140" />
      <el-table-column label="当前价格" width="110">
        <template #default="{ row }">{{ formatPrice(row.currentPrice) }}</template>
      </el-table-column>
      <el-table-column label="涨幅" width="110">
        <template #default="{ row }">
          <span :class="getChangeClass(row.changePercent)">
            {{ formatChangePercent(row.changePercent) }}
          </span>
        </template>
      </el-table-column>
      <el-table-column label="建议动作" width="120">
        <template #default="{ row }">
          <el-tag :type="adviceTagType(row.adviceAction)" round>
            {{ formatAdviceAction(row.adviceAction) }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="风险等级" width="100">
        <template #default="{ row }">{{ formatRiskLevel(row.riskLevel) }}</template>
      </el-table-column>
      <el-table-column label="市场节点" prop="marketSignalName" min-width="160" />
      <el-table-column label="支撑/压力" min-width="180">
        <template #default="{ row }">
          {{ formatPrice(row.supportPrice) }} / {{ formatPrice(row.resistancePrice) }}
        </template>
      </el-table-column>
      <el-table-column label="买入区间" min-width="180">
        <template #default="{ row }">
          {{ formatPriceRange(row.buyLowPrice, row.buyHighPrice) }}
        </template>
      </el-table-column>
      <el-table-column label="卖出区间" min-width="180">
        <template #default="{ row }">
          {{ formatPriceRange(row.sellLowPrice, row.sellHighPrice) }}
        </template>
      </el-table-column>
      <el-table-column label="失效条件" prop="invalidCondition" min-width="180" show-overflow-tooltip />
      <el-table-column label="量价建议" prop="volumePriceAdvice" min-width="220" show-overflow-tooltip />
      <el-table-column label="推荐原因" prop="reasonText" min-width="280" show-overflow-tooltip />
      <el-table-column label="分析时间" prop="analyzeTime" width="180" />
    </el-table>
    <Pagination
      :total="total"
      v-model:page="queryParams.pageNo"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />
  </ContentWrap>
</template>

<script setup lang="ts">
import * as RecommendApi from '@/api/stock/recommend'

defineOptions({ name: 'StockRecommend' })

const message = useMessage()
const router = useRouter()

const adviceActionMap: Record<string, string> = {
  BUY: '买入',
  T_STRATEGY: '做T',
  OBSERVE: '观察'
}
const riskLevelMap: Record<string, string> = {
  LOW: '低',
  MEDIUM: '中',
  HIGH: '高'
}

const loading = ref(false)
const total = ref(0)
const list = ref<RecommendApi.StockRecommendRespVO[]>([])
const queryParams = reactive<RecommendApi.StockRecommendPageReqVO>({
  pageNo: 1,
  pageSize: 10,
  symbol: undefined,
  adviceAction: undefined,
  riskLevel: undefined
})

const formatAdviceAction = (value?: string) => adviceActionMap[value || ''] || value || '-'
const formatRiskLevel = (value?: string) => riskLevelMap[value || ''] || value || '-'
const formatPrice = (value?: number) => (value === undefined || value === null ? '-' : value.toFixed(4))
const formatChangePercent = (value?: number) =>
  value === undefined || value === null ? '-' : `${value.toFixed(2)}%`
const formatPriceRange = (low?: number, high?: number) => {
  if (low === undefined || low === null || high === undefined || high === null) {
    return '-'
  }
  return `${low.toFixed(4)} ~ ${high.toFixed(4)}`
}
const getChangeClass = (value?: number) => {
  if (value === undefined || value === null || value === 0) {
    return 'text-neutral'
  }
  return value > 0 ? 'text-rise' : 'text-fall'
}
const adviceTagType = (value?: string) => {
  if (value === 'BUY') {
    return 'danger'
  }
  if (value === 'T_STRATEGY') {
    return 'success'
  }
  return 'info'
}

const getList = async () => {
  loading.value = true
  try {
    const data = await RecommendApi.getRecommendPage(queryParams)
    list.value = data.list
    total.value = data.total
  } finally {
    loading.value = false
  }
}

const handleQuery = async () => {
  queryParams.pageNo = 1
  await getList()
}

const handleRefresh = async () => {
  const count = await RecommendApi.refreshRecommendPage()
  message.success(`已刷新 ${count} 只自选股`)
  await getList()
}

const openMonitor = (row: RecommendApi.StockRecommendRespVO) => {
  router.push({
    path: '/stock/monitor',
    query: {
      symbol: row.symbol
    }
  })
}

onMounted(() => {
  getList()
})
</script>

<style scoped lang="scss">
.text-rise {
  color: #d03050;
  font-weight: 600;
}

.text-fall {
  color: #00a870;
  font-weight: 600;
}

.text-neutral {
  color: var(--el-text-color-secondary);
}
</style>
