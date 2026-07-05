<template>
  <ContentWrap>
    <el-form :model="queryParams" inline label-width="88px" class="-mb-15px">
      <el-form-item label="节点编码">
        <el-input
          v-model="queryParams.signalCode"
          placeholder="例如 INCREMENTAL_RESONANCE"
          clearable
          class="!w-280px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button @click="handleQuery">
          <Icon icon="ep:search" class="mr-5px" />
          查询
        </el-button>
        <el-button @click="refreshCurrent" v-hasPermi="['stock:market-signal:query']">
          <Icon icon="ep:refresh" class="mr-5px" />
          刷新节点
        </el-button>
      </el-form-item>
    </el-form>
  </ContentWrap>

  <ContentWrap v-loading="currentLoading">
    <div class="signal-grid">
      <div class="signal-card hero">
        <div class="label">当前市场节点</div>
        <div class="value">{{ currentSignal?.signalName || '-' }}</div>
        <div class="desc">{{ currentSignal?.reasonText || '暂无最新节点判断结果' }}</div>
        <div class="meta-row">
          <el-tag :type="currentSignal?.tradable ? 'success' : 'warning'" round>
            {{ currentSignal?.tradable ? '允许交易' : '继续观望' }}
          </el-tag>
          <span>快照时间：{{ currentSignal?.snapshotTime || '-' }}</span>
        </div>
      </div>
      <div class="signal-card">
        <div class="label">风险等级</div>
        <div class="value">{{ formatRiskLevel(currentSignal?.riskLevel) }}</div>
      </div>
      <div class="signal-card">
        <div class="label">热点题材</div>
        <div class="value small">{{ currentSignal?.hotTheme || '-' }}</div>
      </div>
      <div class="signal-card">
        <div class="label">涨停 / 跌停</div>
        <div class="value">{{ currentSignal?.limitUpCount ?? 0 }} / {{ currentSignal?.limitDownCount ?? 0 }}</div>
      </div>
      <div class="signal-card">
        <div class="label">上涨 / 下跌家数</div>
        <div class="value">{{ currentSignal?.risingCount ?? 0 }} / {{ currentSignal?.fallingCount ?? 0 }}</div>
      </div>
      <div class="signal-card">
        <div class="label">指数收盘 / 涨跌幅</div>
        <div class="value small">{{ currentSignal?.indexClose ?? '-' }} / {{ currentSignal?.indexChangePct ?? '-' }}</div>
      </div>
      <div class="signal-card">
        <div class="label">成交额 / 换手比</div>
        <div class="value small">{{ currentSignal?.turnoverAmount ?? '-' }} / {{ currentSignal?.turnoverRatio ?? '-' }}</div>
      </div>
    </div>
  </ContentWrap>

  <ContentWrap>
    <el-table :data="list" v-loading="loading">
      <el-table-column label="交易日期" prop="tradeDate" width="120" />
      <el-table-column label="节点编码" prop="signalCode" min-width="200" />
      <el-table-column label="节点名称" prop="signalName" min-width="180" />
      <el-table-column label="可交易" width="100">
        <template #default="{ row }">
          <el-tag :type="row.tradable ? 'success' : 'warning'" size="small">
            {{ row.tradable ? '是' : '否' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="风险等级" width="120">
        <template #default="{ row }">{{ formatRiskLevel(row.riskLevel) }}</template>
      </el-table-column>
      <el-table-column label="触发原因" prop="reasonText" min-width="420" show-overflow-tooltip />
      <el-table-column label="记录时间" prop="createTime" width="180" />
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
import * as MarketSignalApi from '@/api/stock/marketSignal'

defineOptions({ name: 'StockMarketSignal' })

const message = useMessage()

const riskLevelMap: Record<string, string> = {
  LOW: '低',
  MEDIUM: '中',
  HIGH: '高'
}

const currentLoading = ref(false)
const loading = ref(false)
const total = ref(0)
const currentSignal = ref<MarketSignalApi.MarketSignalCurrentRespVO>()
const list = ref<MarketSignalApi.MarketSignalRespVO[]>([])
const queryParams = reactive<MarketSignalApi.MarketSignalPageReqVO>({
  pageNo: 1,
  pageSize: 10,
  signalCode: undefined
})

const formatRiskLevel = (value?: string) => riskLevelMap[value || ''] || value || '-'

const getCurrent = async () => {
  currentLoading.value = true
  try {
    currentSignal.value = await MarketSignalApi.getCurrentSignal()
  } finally {
    currentLoading.value = false
  }
}

const refreshCurrent = async () => {
  currentLoading.value = true
  try {
    currentSignal.value = await MarketSignalApi.refreshCurrentSignal()
    message.success('市场节点已刷新')
    await getList()
  } finally {
    currentLoading.value = false
  }
}

const getList = async () => {
  loading.value = true
  try {
    const data = await MarketSignalApi.getMarketSignalPage(queryParams)
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

onMounted(async () => {
  await Promise.all([getCurrent(), getList()])
})
</script>

<style scoped lang="scss">
.signal-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 16px;
}

.signal-card {
  padding: 18px;
  border: 1px solid var(--el-border-color-light);
  border-radius: 14px;
  background: linear-gradient(180deg, #fff, #f8fafc);

  .label {
    color: var(--el-text-color-secondary);
    font-size: 13px;
  }

  .value {
    margin-top: 8px;
    color: var(--el-text-color-primary);
    font-size: 24px;
    font-weight: 700;

    &.small {
      font-size: 18px;
      line-height: 1.5;
    }
  }

  .desc {
    margin-top: 10px;
    color: var(--el-text-color-regular);
    line-height: 1.6;
  }
}

.meta-row {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  align-items: center;
  margin-top: 14px;
  color: var(--el-text-color-secondary);
  font-size: 13px;
}

.hero {
  grid-column: span 2;
  background: linear-gradient(135deg, #fef7e0, #eef8ff);
}
</style>
