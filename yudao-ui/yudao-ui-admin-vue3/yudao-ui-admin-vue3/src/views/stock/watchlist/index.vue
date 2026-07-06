<template>
  <ContentWrap>
    <el-form :model="queryParams" inline class="-mb-15px" label-width="90px">
      <el-form-item label="关键词">
        <el-input
          v-model="queryParams.keyword"
          placeholder="代码 / 名称"
          clearable
          class="!w-240px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="监控状态">
        <el-select v-model="queryParams.enableMonitor" clearable class="!w-180px">
          <el-option label="启用" :value="true" />
          <el-option label="停用" :value="false" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button @click="handleQuery">
          <Icon icon="ep:search" class="mr-5px" />
          查询
        </el-button>
        <el-button
          type="warning"
          :loading="manualCollectAllLoading"
          @click="handleManualCollectAll"
          v-hasPermi="['stock:watchlist:update']"
        >
          <Icon icon="ep:refresh" class="mr-5px" />
          一键采集价格
        </el-button>
        <el-button type="primary" @click="openDialog()" v-hasPermi="['stock:watchlist:create']">
          <Icon icon="ep:plus" class="mr-5px" />
          新增自选股
        </el-button>
      </el-form-item>
    </el-form>
  </ContentWrap>

  <ContentWrap>
    <el-table :data="list" v-loading="loading">
      <el-table-column label="代码" width="120">
        <template #default="{ row }">
          <el-button link type="primary" @click="openMonitor(row)">
            {{ row.symbol }}
          </el-button>
        </template>
      </el-table-column>
      <el-table-column label="名称" prop="name" min-width="140" />
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
      <el-table-column label="采集级别" width="120">
        <template #default="{ row }">{{ formatCollectLevel(row.collectLevel) }}</template>
      </el-table-column>
      <el-table-column label="采集周期(分钟)" prop="collectIntervalMinutes" width="140" />
      <el-table-column label="监控状态" width="100">
        <template #default="{ row }">
          <el-tag :type="row.enableMonitor ? 'success' : 'info'" size="small">
            {{ row.enableMonitor ? '启用' : '停用' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="最近采集" prop="latestCollectTime" width="180" />
      <el-table-column label="最近分析" prop="latestAnalyzeTime" width="180" />
      <el-table-column label="最近提醒" prop="latestAlertTime" width="180" />
      <el-table-column label="最新建议" min-width="160">
        <template #default="{ row }">{{ formatAdviceAction(row.latestAdvice) }}</template>
      </el-table-column>
      <el-table-column label="备注" prop="remark" min-width="180" show-overflow-tooltip />
      <el-table-column label="操作" width="300" fixed="right">
        <template #default="{ row }">
          <el-button
            link
            type="primary"
            @click="openDialog(row)"
            v-hasPermi="['stock:watchlist:update']"
          >
            编辑
          </el-button>
          <el-button
            link
            type="primary"
            :disabled="isManualCollecting(row.id)"
            @click="handleManualCollect(row)"
            v-hasPermi="['stock:watchlist:update']"
          >
            {{ isManualCollecting(row.id) ? '采集中' : '手动采集' }}
          </el-button>
          <el-button link @click="showRuntimeState(row.id)" v-hasPermi="['stock:watchlist:query']">
            状态
          </el-button>
          <el-button
            link
            type="danger"
            @click="handleDelete(row.id)"
            v-hasPermi="['stock:watchlist:delete']"
          >
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <Pagination
      :total="total"
      v-model:page="queryParams.pageNo"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />
  </ContentWrap>

  <el-dialog v-model="dialogVisible" :title="formData.id ? '编辑自选股' : '新增自选股'" width="560px">
    <el-form :model="formData" label-width="120px">
      <el-form-item label="股票代码">
        <el-input v-model="formData.symbol" />
      </el-form-item>
      <el-form-item label="股票名称">
        <el-input v-model="formData.name" />
      </el-form-item>
      <el-form-item label="采集级别">
        <el-select v-model="formData.collectLevel" class="!w-full">
          <el-option label="普通" value="NORMAL" />
          <el-option label="重点" value="KEY" />
          <el-option label="核心" value="CORE" />
        </el-select>
      </el-form-item>
      <el-form-item label="采集周期(分钟)">
        <el-input-number v-model="formData.collectIntervalMinutes" :min="1" :max="60" />
      </el-form-item>
      <el-form-item label="监控能力">
        <el-space wrap>
          <el-checkbox v-model="formData.enableMonitor">监控</el-checkbox>
          <el-checkbox v-model="formData.enableIntraday">分时</el-checkbox>
          <el-checkbox v-model="formData.enableTStrategy">做T</el-checkbox>
          <el-checkbox v-model="formData.enablePriceAlert">价格提醒</el-checkbox>
          <el-checkbox v-model="formData.enableSignalAlert">信号提醒</el-checkbox>
        </el-space>
      </el-form-item>
      <el-form-item label="备注">
        <el-input v-model="formData.remark" type="textarea" :rows="3" />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="dialogVisible = false">取消</el-button>
      <el-button type="primary" @click="handleSubmit">保存</el-button>
    </template>
  </el-dialog>

  <el-dialog v-model="runtimeVisible" title="运行状态" width="520px">
    <el-descriptions :column="1" border v-if="runtimeState">
      <el-descriptions-item label="股票">
        {{ runtimeState.symbol }} {{ runtimeState.name }}
      </el-descriptions-item>
      <el-descriptions-item label="监控状态">
        {{ runtimeState.enableMonitor ? '启用' : '停用' }}
      </el-descriptions-item>
      <el-descriptions-item label="最近采集">
        {{ runtimeState.latestCollectTime || '-' }}
      </el-descriptions-item>
      <el-descriptions-item label="最近分析">
        {{ runtimeState.latestAnalyzeTime || '-' }}
      </el-descriptions-item>
      <el-descriptions-item label="最近提醒">
        {{ runtimeState.latestAlertTime || '-' }}
      </el-descriptions-item>
      <el-descriptions-item label="最新建议">
        {{ formatAdviceAction(runtimeState.latestAdvice) }}
      </el-descriptions-item>
    </el-descriptions>
  </el-dialog>
</template>

<script setup lang="ts">
import * as WatchlistApi from '@/api/stock/watchlist'

defineOptions({ name: 'StockWatchlist' })

const message = useMessage()
const router = useRouter()

const collectLevelMap: Record<string, string> = {
  NORMAL: '普通',
  KEY: '重点',
  CORE: '核心'
}
const adviceActionMap: Record<string, string> = {
  BUY: '买入',
  T_STRATEGY: '做T',
  REDUCE: '减仓',
  OBSERVE: '观察',
  WAIT: '等待'
}

const loading = ref(false)
const total = ref(0)
const list = ref<WatchlistApi.StockWatchlistRespVO[]>([])
const manualCollectAllLoading = ref(false)
const manualCollectingIds = ref<number[]>([])
const queryParams = reactive<WatchlistApi.StockWatchlistPageReqVO>({
  pageNo: 1,
  pageSize: 10,
  keyword: undefined,
  enableMonitor: undefined
})

const dialogVisible = ref(false)
const runtimeVisible = ref(false)
const runtimeState = ref<WatchlistApi.StockWatchlistRuntimeStateRespVO>()
const formData = reactive<WatchlistApi.StockWatchlistSaveReqVO>({
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

const formatCollectLevel = (value?: string) => collectLevelMap[value || ''] || value || '-'
const formatAdviceAction = (value?: string) => adviceActionMap[value || ''] || value || '-'
const formatPrice = (value?: number) => (value === undefined || value === null ? '-' : value.toFixed(2))
const formatChangePercent = (value?: number) =>
  value === undefined || value === null ? '-' : `${value.toFixed(2)}%`
const getChangeClass = (value?: number) => {
  if (value === undefined || value === null || value === 0) {
    return 'text-neutral'
  }
  return value > 0 ? 'text-rise' : 'text-fall'
}
const isManualCollecting = (id: number) => manualCollectingIds.value.includes(id)

const resetForm = () => {
  formData.id = undefined
  formData.symbol = ''
  formData.name = ''
  formData.collectLevel = 'KEY'
  formData.collectIntervalMinutes = 5
  formData.enableMonitor = true
  formData.enableIntraday = false
  formData.enableTStrategy = true
  formData.enablePriceAlert = true
  formData.enableSignalAlert = true
  formData.remark = ''
}

const getList = async () => {
  loading.value = true
  try {
    const data = await WatchlistApi.getWatchlistPage(queryParams)
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

const openDialog = (row?: WatchlistApi.StockWatchlistRespVO) => {
  resetForm()
  if (row) {
    formData.id = row.id
    formData.symbol = row.symbol
    formData.name = row.name || ''
    formData.collectLevel = row.collectLevel
    formData.collectIntervalMinutes = row.collectIntervalMinutes
    formData.enableMonitor = row.enableMonitor
    formData.enableIntraday = row.enableIntraday
    formData.enableTStrategy = row.enableTStrategy
    formData.enablePriceAlert = row.enablePriceAlert
    formData.enableSignalAlert = row.enableSignalAlert
    formData.remark = row.remark || ''
  }
  dialogVisible.value = true
}

const handleSubmit = async () => {
  if (formData.id) {
    await WatchlistApi.updateWatchlist(formData)
  } else {
    await WatchlistApi.createWatchlist(formData)
  }
  message.success('保存成功')
  dialogVisible.value = false
  await getList()
}

const handleDelete = async (id: number) => {
  await message.delConfirm()
  await WatchlistApi.deleteWatchlist(id)
  message.success('删除成功')
  await getList()
}

const handleManualCollectAll = async () => {
  if (manualCollectAllLoading.value) {
    return
  }
  manualCollectAllLoading.value = true
  try {
    const count = await WatchlistApi.manualCollectAllWatchlist()
    message.success(`已采集 ${count} 只自选股`)
    await getList()
  } finally {
    manualCollectAllLoading.value = false
  }
}

const handleManualCollect = async (row: WatchlistApi.StockWatchlistRespVO) => {
  if (isManualCollecting(row.id)) {
    return
  }
  manualCollectingIds.value.push(row.id)
  try {
    const refreshed = await WatchlistApi.manualCollectWatchlist(row.id)
    Object.assign(row, refreshed)
    if (runtimeVisible.value && runtimeState.value?.watchlistId === row.id) {
      runtimeState.value = {
        ...runtimeState.value,
        latestCollectTime: refreshed.latestCollectTime,
        latestAnalyzeTime: refreshed.latestAnalyzeTime,
        latestAlertTime: refreshed.latestAlertTime,
        latestAdvice: refreshed.latestAdvice,
        enableMonitor: refreshed.enableMonitor
      }
    }
    message.success('采集成功')
  } finally {
    manualCollectingIds.value = manualCollectingIds.value.filter((item) => item !== row.id)
  }
}

const showRuntimeState = async (id: number) => {
  runtimeState.value = await WatchlistApi.getWatchlistRuntimeState(id)
  runtimeVisible.value = true
}

const openMonitor = (row: WatchlistApi.StockWatchlistRespVO) => {
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
