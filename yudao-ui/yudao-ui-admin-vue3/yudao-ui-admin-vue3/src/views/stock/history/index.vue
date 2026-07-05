<template>
  <ContentWrap>
    <el-form :model="queryParams" inline label-width="88px" class="-mb-15px">
      <el-form-item label="股票代码">
        <el-input
          v-model="queryParams.symbol"
          placeholder="例如 603993"
          clearable
          class="!w-240px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button @click="handleQuery">
          <Icon icon="ep:search" class="mr-5px" />
          查询
        </el-button>
        <el-button type="primary" @click="openDialog()" v-hasPermi="['stock:trade-journal:create']">
          <Icon icon="ep:plus" class="mr-5px" />
          新增复盘
        </el-button>
      </el-form-item>
    </el-form>
  </ContentWrap>

  <ContentWrap>
    <el-table :data="list" v-loading="loading">
      <el-table-column label="股票代码" prop="symbol" width="120" />
      <el-table-column label="股票名称" prop="stockName" min-width="140" />
      <el-table-column label="买入价" prop="buyPrice" width="100" />
      <el-table-column label="卖出价" prop="sellPrice" width="100" />
      <el-table-column label="仓位比例" prop="positionRatio" width="110" />
      <el-table-column label="收益率" prop="profitRate" width="100" />
      <el-table-column label="系统建议" prop="systemAdvice" min-width="180" show-overflow-tooltip />
      <el-table-column label="交易时间" prop="tradeTime" width="180" />
      <el-table-column label="备注" prop="remark" min-width="220" show-overflow-tooltip />
      <el-table-column label="操作" width="180" fixed="right">
        <template #default="{ row }">
          <el-button
            link
            type="primary"
            @click="openDialog(row)"
            v-hasPermi="['stock:trade-journal:create']"
          >
            编辑
          </el-button>
          <el-button
            link
            type="danger"
            @click="handleDelete(row.id)"
            v-hasPermi="['stock:trade-journal:delete']"
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

  <el-dialog v-model="dialogVisible" :title="formData.id ? '编辑交易复盘' : '新增交易复盘'" width="620px">
    <el-form :model="formData" label-width="110px">
      <el-form-item label="股票代码">
        <el-input v-model="formData.symbol" />
      </el-form-item>
      <el-form-item label="股票名称">
        <el-input v-model="formData.stockName" />
      </el-form-item>
      <el-form-item label="买入价">
        <el-input-number v-model="formData.buyPrice" :precision="2" :min="0" />
      </el-form-item>
      <el-form-item label="卖出价">
        <el-input-number v-model="formData.sellPrice" :precision="2" :min="0" />
      </el-form-item>
      <el-form-item label="仓位比例">
        <el-input-number v-model="formData.positionRatio" :precision="2" :min="0" :max="100" />
      </el-form-item>
      <el-form-item label="收益率">
        <el-input-number v-model="formData.profitRate" :precision="2" />
      </el-form-item>
      <el-form-item label="系统建议">
        <el-input v-model="formData.systemAdvice" />
      </el-form-item>
      <el-form-item label="交易时间">
        <el-date-picker
          v-model="formData.tradeTime"
          type="datetime"
          value-format="YYYY-MM-DD HH:mm:ss"
          class="!w-full"
        />
      </el-form-item>
      <el-form-item label="备注">
        <el-input v-model="formData.remark" type="textarea" :rows="4" />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="dialogVisible = false">取消</el-button>
      <el-button type="primary" @click="handleSubmit">保存</el-button>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import * as JournalApi from '@/api/stock/journal'

defineOptions({ name: 'StockHistory' })

const message = useMessage()

const loading = ref(false)
const total = ref(0)
const list = ref<JournalApi.StockTradeJournalRespVO[]>([])
const queryParams = reactive<JournalApi.StockTradeJournalPageReqVO>({
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

const getList = async () => {
  loading.value = true
  try {
    const data = await JournalApi.getTradeJournalPage(queryParams)
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

const openDialog = (row?: JournalApi.StockTradeJournalRespVO) => {
  resetForm()
  if (row) {
    Object.assign(formData, row)
  }
  dialogVisible.value = true
}

const handleSubmit = async () => {
  await JournalApi.saveTradeJournal(formData)
  message.success('交易复盘已保存')
  dialogVisible.value = false
  await getList()
}

const handleDelete = async (id: number) => {
  await message.delConfirm()
  await JournalApi.deleteTradeJournal(id)
  message.success('交易复盘已删除')
  await getList()
}

onMounted(() => {
  getList()
})
</script>

<style scoped lang="scss">
:deep(.el-input-number) {
  width: 100%;
}
</style>
