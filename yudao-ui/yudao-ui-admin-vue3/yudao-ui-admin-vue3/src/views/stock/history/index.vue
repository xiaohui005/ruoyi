<template>
  <ContentWrap>
    <el-tabs v-model="activeTab">
      <el-tab-pane :label="ui.trackingTab" name="tracking">
        <div class="summary-grid">
          <div v-for="item in summaryCards" :key="item.label" class="summary-card">
            <div class="summary-label">{{ item.label }}</div>
            <div class="summary-value">{{ item.value }}</div>
          </div>
        </div>

        <el-form :model="trackingQueryParams" inline label-width="88px" class="-mb-15px">
          <el-form-item :label="ui.symbol">
            <el-input
              v-model="trackingQueryParams.symbol"
              :placeholder="ui.symbolFullPlaceholder"
              clearable
              class="!w-220px"
              @keyup.enter="handleTrackingQuery"
            />
          </el-form-item>
          <el-form-item :label="ui.adviceType">
            <el-select
              v-model="trackingQueryParams.adviceType"
              clearable
              :placeholder="ui.all"
              class="!w-160px"
            >
              <el-option
                v-for="item in adviceTypeOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              />
            </el-select>
          </el-form-item>
          <el-form-item :label="ui.status">
            <el-select
              v-model="trackingQueryParams.status"
              clearable
              :placeholder="ui.all"
              class="!w-180px"
            >
              <el-option
                v-for="item in statusOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              />
            </el-select>
          </el-form-item>
          <el-form-item>
            <el-button @click="handleTrackingQuery">
              <Icon icon="ep:search" class="mr-5px" />
              {{ ui.query }}
            </el-button>
          </el-form-item>
        </el-form>

        <el-table :data="trackingList" v-loading="trackingLoading">
          <el-table-column :label="ui.symbol" prop="symbol" width="120" />
          <el-table-column :label="ui.stockName" prop="stockName" min-width="140" />
          <el-table-column :label="ui.adviceType" width="110">
            <template #default="{ row }">
              <el-tag size="small" :type="row.adviceType === 'BUY' ? 'success' : 'warning'">
                {{ formatAdviceType(row.adviceType) }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column :label="ui.status" width="120">
            <template #default="{ row }">
              <el-tag size="small" :type="statusTagType(row.status)">
                {{ formatStatus(row.status) }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column :label="ui.adviceTime" prop="adviceTime" width="170" />
          <el-table-column :label="ui.buyRange" min-width="140">
            <template #default="{ row }">
              {{ formatRange(row.buyLowPrice, row.buyHighPrice) }}
            </template>
          </el-table-column>
          <el-table-column :label="ui.sellRange" min-width="140">
            <template #default="{ row }">
              {{ formatRange(row.sellLowPrice, row.sellHighPrice) }}
            </template>
          </el-table-column>
          <el-table-column :label="ui.expectedDays" prop="expectedDays" width="100" />
          <el-table-column :label="ui.estimatedProfitRate" width="110">
            <template #default="{ row }">
              {{ formatRate(row.estimatedProfitRate) }}
            </template>
          </el-table-column>
          <el-table-column :label="ui.resultSummary" prop="resultSummary" min-width="240" show-overflow-tooltip />
        </el-table>
        <Pagination
          :total="trackingTotal"
          v-model:page="trackingQueryParams.pageNo"
          v-model:limit="trackingQueryParams.pageSize"
          @pagination="getTrackingList"
        />
      </el-tab-pane>

      <el-tab-pane :label="ui.journalTab" name="journal">
        <el-form :model="journalQueryParams" inline label-width="88px" class="-mb-15px">
          <el-form-item :label="ui.symbol">
            <el-input
              v-model="journalQueryParams.symbol"
              :placeholder="ui.symbolShortPlaceholder"
              clearable
              class="!w-240px"
              @keyup.enter="handleJournalQuery"
            />
          </el-form-item>
          <el-form-item>
            <el-button @click="handleJournalQuery">
              <Icon icon="ep:search" class="mr-5px" />
              {{ ui.query }}
            </el-button>
            <el-button type="primary" @click="openDialog()" v-hasPermi="['stock:trade-journal:create']">
              <Icon icon="ep:plus" class="mr-5px" />
              {{ ui.createJournal }}
            </el-button>
          </el-form-item>
        </el-form>

        <el-table :data="journalList" v-loading="journalLoading">
          <el-table-column :label="ui.symbol" prop="symbol" width="120" />
          <el-table-column :label="ui.stockName" prop="stockName" min-width="140" />
          <el-table-column :label="ui.buyPrice" prop="buyPrice" width="100" />
          <el-table-column :label="ui.sellPrice" prop="sellPrice" width="100" />
          <el-table-column :label="ui.positionRatio" prop="positionRatio" width="110" />
          <el-table-column :label="ui.profitRate" prop="profitRate" width="100" />
          <el-table-column :label="ui.systemAdvice" prop="systemAdvice" min-width="180" show-overflow-tooltip />
          <el-table-column :label="ui.tradeTime" prop="tradeTime" width="180" />
          <el-table-column :label="ui.remark" prop="remark" min-width="220" show-overflow-tooltip />
          <el-table-column :label="ui.action" width="180" fixed="right">
            <template #default="{ row }">
              <el-button
                link
                type="primary"
                @click="openDialog(row)"
                v-hasPermi="['stock:trade-journal:create']"
              >
                {{ ui.edit }}
              </el-button>
              <el-button
                link
                type="danger"
                @click="handleDelete(row.id)"
                v-hasPermi="['stock:trade-journal:delete']"
              >
                {{ ui.delete }}
              </el-button>
            </template>
          </el-table-column>
        </el-table>
        <Pagination
          :total="journalTotal"
          v-model:page="journalQueryParams.pageNo"
          v-model:limit="journalQueryParams.pageSize"
          @pagination="getJournalList"
        />
      </el-tab-pane>
    </el-tabs>
  </ContentWrap>

  <el-dialog v-model="dialogVisible" :title="dialogTitle" width="620px">
    <el-form :model="formData" label-width="110px">
      <el-form-item :label="ui.symbol">
        <el-input v-model="formData.symbol" />
      </el-form-item>
      <el-form-item :label="ui.stockName">
        <el-input v-model="formData.stockName" />
      </el-form-item>
      <el-form-item :label="ui.buyPrice">
        <el-input-number v-model="formData.buyPrice" :precision="2" :min="0" />
      </el-form-item>
      <el-form-item :label="ui.sellPrice">
        <el-input-number v-model="formData.sellPrice" :precision="2" :min="0" />
      </el-form-item>
      <el-form-item :label="ui.positionRatio">
        <el-input-number v-model="formData.positionRatio" :precision="2" :min="0" :max="100" />
      </el-form-item>
      <el-form-item :label="ui.profitRate">
        <el-input-number v-model="formData.profitRate" :precision="2" />
      </el-form-item>
      <el-form-item :label="ui.systemAdvice">
        <el-input v-model="formData.systemAdvice" />
      </el-form-item>
      <el-form-item :label="ui.tradeTime">
        <el-date-picker
          v-model="formData.tradeTime"
          type="datetime"
          value-format="YYYY-MM-DD HH:mm:ss"
          class="!w-full"
        />
      </el-form-item>
      <el-form-item :label="ui.remark">
        <el-input v-model="formData.remark" type="textarea" :rows="4" />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="dialogVisible = false">{{ ui.cancel }}</el-button>
      <el-button type="primary" @click="handleSubmit">{{ ui.save }}</el-button>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import * as AdviceApi from '@/api/stock/advice'
import * as JournalApi from '@/api/stock/journal'

defineOptions({ name: 'StockHistory' })

const ui = {
  trackingTab: '\u5efa\u8bae\u95ed\u73af',
  journalTab: '\u4ea4\u6613\u590d\u76d8',
  symbol: '\u80a1\u7968\u4ee3\u7801',
  stockName: '\u80a1\u7968\u540d\u79f0',
  adviceType: '\u5efa\u8bae\u7c7b\u578b',
  status: '\u72b6\u6001',
  adviceTime: '\u5efa\u8bae\u65f6\u95f4',
  buyRange: '\u4e70\u5165\u533a\u95f4',
  sellRange: '\u5356\u51fa\u533a\u95f4',
  expectedDays: '\u89c2\u5bdf\u5929\u6570',
  estimatedProfitRate: '\u7406\u8bba\u6536\u76ca\u7387',
  resultSummary: '\u7ed3\u679c\u8bf4\u660e',
  buyPrice: '\u4e70\u5165\u4ef7',
  sellPrice: '\u5356\u51fa\u4ef7',
  positionRatio: '\u4ed3\u4f4d\u6bd4\u4f8b',
  profitRate: '\u6536\u76ca\u7387',
  systemAdvice: '\u7cfb\u7edf\u5efa\u8bae',
  tradeTime: '\u4ea4\u6613\u65f6\u95f4',
  remark: '\u5907\u6ce8',
  action: '\u64cd\u4f5c',
  query: '\u67e5\u8be2',
  createJournal: '\u65b0\u589e\u590d\u76d8',
  edit: '\u7f16\u8f91',
  delete: '\u5220\u9664',
  cancel: '\u53d6\u6d88',
  save: '\u4fdd\u5b58',
  all: '\u5168\u90e8',
  symbolFullPlaceholder: '\u4f8b\u5982 600519.SH',
  symbolShortPlaceholder: '\u4f8b\u5982 603993',
  totalAdvice: '\u603b\u5efa\u8bae\u6570',
  activeAdvice: '\u8ddf\u8e2a\u4e2d',
  completedAdvice: '\u5df2\u5b8c\u6210',
  invalidAdvice: '\u5df2\u5931\u6548',
  expiredAdvice: '\u5df2\u8d85\u65f6',
  successRate: '\u6210\u529f\u7387',
  invalidRate: '\u5931\u6548\u7387',
  saveJournalSuccess: '\u4ea4\u6613\u590d\u76d8\u5df2\u4fdd\u5b58',
  deleteJournalSuccess: '\u4ea4\u6613\u590d\u76d8\u5df2\u5220\u9664',
  editJournalTitle: '\u7f16\u8f91\u4ea4\u6613\u590d\u76d8',
  createJournalTitle: '\u65b0\u589e\u4ea4\u6613\u590d\u76d8'
} as const

const message = useMessage()

const activeTab = ref('tracking')

const adviceTypeOptions = [
  { label: '\u4e70\u5165\u5efa\u8bae', value: 'BUY' },
  { label: '\u505aT\u5efa\u8bae', value: 'T_STRATEGY' }
]

const statusOptions = [
  { label: '\u5f85\u89c2\u5bdf', value: 'PENDING' },
  { label: '\u5df2\u89e6\u53d1\u4e70\u70b9', value: 'BUY_TRIGGERED' },
  { label: '\u5df2\u5b8c\u6210', value: 'COMPLETED' },
  { label: '\u5df2\u5931\u6548', value: 'INVALIDATED' },
  { label: '\u5df2\u8d85\u65f6', value: 'EXPIRED' },
  { label: '\u624b\u5de5\u5173\u95ed', value: 'MANUAL_CLOSED' }
]

const trackingLoading = ref(false)
const trackingTotal = ref(0)
const trackingList = ref<AdviceApi.StockAdviceTrackingRespVO[]>([])
const trackingSummary = ref<AdviceApi.StockAdviceTrackingSummaryRespVO>({
  totalCount: 0,
  activeCount: 0,
  completedCount: 0,
  invalidatedCount: 0,
  expiredCount: 0,
  successRate: 0,
  invalidRate: 0
})
const trackingQueryParams = reactive<AdviceApi.StockAdviceTrackingPageReqVO>({
  pageNo: 1,
  pageSize: 10,
  symbol: undefined,
  adviceType: undefined,
  status: undefined
})

const journalLoading = ref(false)
const journalTotal = ref(0)
const journalList = ref<JournalApi.StockTradeJournalRespVO[]>([])
const journalQueryParams = reactive<JournalApi.StockTradeJournalPageReqVO>({
  pageNo: 1,
  pageSize: 10,
  symbol: undefined
})

const dialogVisible = ref(false)
const formData = reactive<JournalApi.StockTradeJournalSaveReqVO>({
  symbol: '',
  stockName: '',
  buyPrice: undefined,
  sellPrice: undefined,
  positionRatio: undefined,
  profitRate: undefined,
  systemAdvice: '',
  remark: '',
  tradeTime: ''
})

const dialogTitle = computed(() => {
  return formData.id ? ui.editJournalTitle : ui.createJournalTitle
})

const summaryCards = computed(() => [
  { label: ui.totalAdvice, value: trackingSummary.value.totalCount ?? 0 },
  { label: ui.activeAdvice, value: trackingSummary.value.activeCount ?? 0 },
  { label: ui.completedAdvice, value: trackingSummary.value.completedCount ?? 0 },
  { label: ui.invalidAdvice, value: trackingSummary.value.invalidatedCount ?? 0 },
  { label: ui.expiredAdvice, value: trackingSummary.value.expiredCount ?? 0 },
  { label: ui.successRate, value: `${formatNumber(trackingSummary.value.successRate)}%` },
  { label: ui.invalidRate, value: `${formatNumber(trackingSummary.value.invalidRate)}%` }
])

const getTrackingList = async () => {
  trackingLoading.value = true
  try {
    const data = await AdviceApi.getAdviceTrackingPage(trackingQueryParams)
    trackingList.value = data.list
    trackingTotal.value = data.total
  } finally {
    trackingLoading.value = false
  }
}

const getTrackingSummary = async () => {
  trackingSummary.value = await AdviceApi.getAdviceTrackingSummary()
}

const handleTrackingQuery = async () => {
  trackingQueryParams.pageNo = 1
  await Promise.all([getTrackingList(), getTrackingSummary()])
}

const resetForm = () => {
  formData.id = undefined
  formData.symbol = ''
  formData.stockName = ''
  formData.buyPrice = undefined
  formData.sellPrice = undefined
  formData.positionRatio = undefined
  formData.profitRate = undefined
  formData.systemAdvice = ''
  formData.remark = ''
  formData.tradeTime = ''
}

const getJournalList = async () => {
  journalLoading.value = true
  try {
    const data = await JournalApi.getTradeJournalPage(journalQueryParams)
    journalList.value = data.list
    journalTotal.value = data.total
  } finally {
    journalLoading.value = false
  }
}

const handleJournalQuery = async () => {
  journalQueryParams.pageNo = 1
  await getJournalList()
}

const openDialog = (row?: JournalApi.StockTradeJournalRespVO) => {
  resetForm()
  if (row) {
    Object.assign(formData, row)
  }
  dialogVisible.value = true
}

const handleSubmit = async () => {
  await JournalApi.saveTradeJournal(formData)
  message.success(ui.saveJournalSuccess)
  dialogVisible.value = false
  await getJournalList()
}

const handleDelete = async (id: number) => {
  await message.delConfirm()
  await JournalApi.deleteTradeJournal(id)
  message.success(ui.deleteJournalSuccess)
  await getJournalList()
}

const formatAdviceType = (value?: string) => {
  return adviceTypeOptions.find((item) => item.value === value)?.label || value || '-'
}

const formatStatus = (value?: string) => {
  return statusOptions.find((item) => item.value === value)?.label || value || '-'
}

const statusTagType = (value?: string) => {
  switch (value) {
    case 'COMPLETED':
      return 'success'
    case 'INVALIDATED':
      return 'danger'
    case 'EXPIRED':
      return 'info'
    case 'BUY_TRIGGERED':
      return 'warning'
    default:
      return undefined
  }
}

const formatNumber = (value?: number) => {
  return value == null ? '0.00' : Number(value).toFixed(2)
}

const formatRate = (value?: number) => {
  return value == null ? '-' : `${Number(value).toFixed(2)}%`
}

const formatPrice = (value?: number) => {
  return value == null ? '-' : Number(value).toFixed(2)
}

const formatRange = (low?: number, high?: number) => {
  if (low == null || high == null) {
    return '-'
  }
  return `${formatPrice(low)} - ${formatPrice(high)}`
}

onMounted(() => {
  Promise.all([getTrackingList(), getTrackingSummary(), getJournalList()])
})
</script>

<style scoped lang="scss">
.summary-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
  gap: 12px;
  margin-bottom: 16px;
}

.summary-card {
  padding: 16px;
  border: 1px solid var(--el-border-color-lighter);
  border-radius: 12px;
  background: linear-gradient(180deg, #ffffff 0%, #f7fafc 100%);
}

.summary-label {
  color: var(--el-text-color-secondary);
  font-size: 13px;
  line-height: 1.2;
}

.summary-value {
  margin-top: 8px;
  color: var(--el-text-color-primary);
  font-size: 24px;
  font-weight: 600;
  line-height: 1;
}

:deep(.el-input-number) {
  width: 100%;
}
</style>
