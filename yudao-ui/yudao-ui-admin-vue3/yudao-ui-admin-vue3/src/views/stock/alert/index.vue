<template>
  <ContentWrap>
    <el-tabs v-model="activeTab">
      <el-tab-pane label="提醒渠道" name="channel">
        <div class="toolbar">
          <el-button type="primary" @click="openChannelDialog()" v-hasPermi="['stock:alert-channel:update']">
            <Icon icon="ep:plus" class="mr-5px" />
            新增渠道
          </el-button>
        </div>
        <el-table :data="channelList" v-loading="channelLoading">
          <el-table-column label="渠道编码" prop="channelCode" min-width="140" />
          <el-table-column label="渠道名称" prop="channelName" min-width="140" />
          <el-table-column label="启用状态" width="100">
            <template #default="{ row }">
              <el-tag :type="row.enabled ? 'success' : 'info'" size="small">
                {{ row.enabled ? '启用' : '停用' }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column label="配置 JSON" prop="configJson" min-width="320" show-overflow-tooltip />
          <el-table-column label="操作" width="180" fixed="right">
            <template #default="{ row }">
              <el-button
                link
                type="primary"
                @click="openChannelDialog(row)"
                v-hasPermi="['stock:alert-channel:update']"
              >
                编辑
              </el-button>
              <el-button link @click="handleTestChannel(row)" v-hasPermi="['stock:alert-channel:test']">
                测试发送
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>

      <el-tab-pane label="提醒规则" name="rule">
        <el-form :model="ruleQuery" inline class="-mb-15px" label-width="88px">
          <el-form-item label="自选股 ID">
            <el-input-number v-model="ruleQuery.watchlistId" :min="1" controls-position="right" />
          </el-form-item>
          <el-form-item label="启用状态">
            <el-select v-model="ruleQuery.enabled" clearable class="!w-180px">
              <el-option label="启用" :value="true" />
              <el-option label="停用" :value="false" />
            </el-select>
          </el-form-item>
          <el-form-item>
            <el-button @click="handleRuleQuery">
              <Icon icon="ep:search" class="mr-5px" />
              查询
            </el-button>
            <el-button type="primary" @click="openRuleDialog()" v-hasPermi="['stock:alert-rule:create']">
              <Icon icon="ep:plus" class="mr-5px" />
              新增规则
            </el-button>
          </el-form-item>
        </el-form>
        <el-table :data="ruleList" v-loading="ruleLoading" class="mt-16px">
          <el-table-column label="规则名称" prop="ruleName" min-width="180" />
          <el-table-column label="规则类型" width="150">
            <template #default="{ row }">{{ formatRuleType(row.ruleType) }}</template>
          </el-table-column>
          <el-table-column label="自选股 ID" prop="watchlistId" width="120" />
          <el-table-column label="冷却分钟" prop="cooldownMinutes" width="120" />
          <el-table-column label="启用状态" width="100">
            <template #default="{ row }">
              <el-tag :type="row.enabled ? 'success' : 'info'" size="small">
                {{ row.enabled ? '启用' : '停用' }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column label="规则 JSON" prop="ruleJson" min-width="260" show-overflow-tooltip />
          <el-table-column label="更新时间" prop="updateTime" width="180" />
          <el-table-column label="操作" width="180" fixed="right">
            <template #default="{ row }">
              <el-button
                link
                type="primary"
                @click="openRuleDialog(row)"
                v-hasPermi="['stock:alert-rule:update']"
              >
                编辑
              </el-button>
              <el-button
                link
                type="danger"
                @click="handleDeleteRule(row.id)"
                v-hasPermi="['stock:alert-rule:delete']"
              >
                删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
        <Pagination
          :total="ruleTotal"
          v-model:page="ruleQuery.pageNo"
          v-model:limit="ruleQuery.pageSize"
          @pagination="getRulePage"
        />
      </el-tab-pane>

      <el-tab-pane label="提醒记录" name="record">
        <el-form :model="recordQuery" inline class="-mb-15px" label-width="88px">
          <el-form-item label="股票代码">
            <el-input v-model="recordQuery.symbol" placeholder="例如 603993" clearable class="!w-220px" />
          </el-form-item>
          <el-form-item label="渠道编码">
            <el-input
              v-model="recordQuery.channelCode"
              placeholder="例如 WXPUSHER"
              clearable
              class="!w-220px"
            />
          </el-form-item>
          <el-form-item>
            <el-button @click="handleRecordQuery">
              <Icon icon="ep:search" class="mr-5px" />
              查询
            </el-button>
          </el-form-item>
        </el-form>
        <el-table :data="recordList" v-loading="recordLoading" class="mt-16px">
          <el-table-column label="股票代码" prop="symbol" width="120" />
          <el-table-column label="触发类型" prop="alertType" width="140" />
          <el-table-column label="渠道编码" prop="channelCode" width="140" />
          <el-table-column label="触发值" prop="triggerValue" width="160" />
          <el-table-column label="发送状态" prop="sendStatus" width="120" />
          <el-table-column label="内容" prop="content" min-width="320" show-overflow-tooltip />
          <el-table-column label="发送时间" prop="sendTime" width="180" />
          <el-table-column label="记录时间" prop="createTime" width="180" />
        </el-table>
        <Pagination
          :total="recordTotal"
          v-model:page="recordQuery.pageNo"
          v-model:limit="recordQuery.pageSize"
          @pagination="getRecordPage"
        />
      </el-tab-pane>

      <el-tab-pane label="分析配置" name="config">
        <div class="toolbar">
          <el-button type="primary" @click="handleSaveConfig" v-hasPermi="['stock:alert-rule:update']">
            <Icon icon="ep:check" class="mr-5px" />
            保存配置
          </el-button>
        </div>
        <el-table :data="configList" v-loading="configLoading">
          <el-table-column label="配置键" prop="configKey" min-width="200" />
          <el-table-column label="配置名称" prop="configName" min-width="180" />
          <el-table-column label="配置值" min-width="300">
            <template #default="{ row }">
              <el-input v-model="row.configValue" type="textarea" :rows="2" />
            </template>
          </el-table-column>
          <el-table-column label="备注" prop="remark" min-width="220" show-overflow-tooltip />
        </el-table>
      </el-tab-pane>
    </el-tabs>
  </ContentWrap>

  <el-dialog v-model="channelDialogVisible" :title="channelForm.id ? '编辑渠道' : '新增渠道'" width="560px">
    <el-form :model="channelForm" label-width="110px">
      <el-form-item label="渠道编码">
        <el-input v-model="channelForm.channelCode" />
      </el-form-item>
      <el-form-item label="渠道名称">
        <el-input v-model="channelForm.channelName" />
      </el-form-item>
      <el-form-item label="启用状态">
        <el-switch v-model="channelForm.enabled" />
      </el-form-item>
      <el-form-item label="配置 JSON">
        <el-input v-model="channelForm.configJson" type="textarea" :rows="5" />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="channelDialogVisible = false">取消</el-button>
      <el-button type="primary" @click="handleSaveChannel">保存</el-button>
    </template>
  </el-dialog>

  <el-dialog v-model="ruleDialogVisible" :title="ruleForm.id ? '编辑规则' : '新增规则'" width="620px">
    <el-form :model="ruleForm" label-width="110px">
      <el-form-item label="规则名称">
        <el-input v-model="ruleForm.ruleName" />
      </el-form-item>
      <el-form-item label="规则类型">
        <el-select v-model="ruleForm.ruleType" class="!w-full">
          <el-option label="市场节点" value="MARKET_SIGNAL" />
          <el-option label="量价结构" value="VOLUME_PRICE" />
          <el-option label="做T买点" value="T_BUY" />
          <el-option label="做T卖点" value="T_SELL" />
          <el-option label="价格触达" value="PRICE_REACH" />
          <el-option label="K-line Pattern Alert" value="KLINE_PATTERN" />
        </el-select>
      </el-form-item>
      <el-form-item label="自选股 ID">
        <el-input-number v-model="ruleForm.watchlistId" :min="1" controls-position="right" />
      </el-form-item>
      <el-form-item label="启用状态">
        <el-switch v-model="ruleForm.enabled" />
      </el-form-item>
      <el-form-item label="冷却分钟">
        <el-input-number v-model="ruleForm.cooldownMinutes" :min="1" :max="1440" />
      </el-form-item>
      <el-form-item label="规则 JSON">
        <el-input
          v-model="ruleForm.ruleJson"
          type="textarea"
          :rows="6"
          placeholder='Example: {"signalCode":"BREAKOUT"} or {"price":10.5,"direction":"up"} or {"patternCode":"XIAN_REN_ZHI_LU"}'
        />
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="ruleDialogVisible = false">取消</el-button>
      <el-button type="primary" @click="handleSaveRule">保存</el-button>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import * as AlertApi from '@/api/stock/alert'

defineOptions({ name: 'StockAlert' })

const message = useMessage()

const activeTab = ref('channel')

const ruleTypeMap: Record<string, string> = {
  MARKET_SIGNAL: '市场节点',
  VOLUME_PRICE: '量价结构',
  T_BUY: '做T买点',
  T_SELL: '做T卖点',
  PRICE_REACH: '价格触达',
  KLINE_PATTERN: 'K-line Pattern Alert'
}

const channelLoading = ref(false)
const channelList = ref<AlertApi.StockAlertChannelRespVO[]>([])
const channelDialogVisible = ref(false)
const channelForm = reactive<AlertApi.StockAlertChannelSaveReqVO>({
  channelCode: '',
  channelName: '',
  enabled: true,
  configJson: ''
})

const ruleLoading = ref(false)
const ruleTotal = ref(0)
const ruleList = ref<AlertApi.StockAlertRuleRespVO[]>([])
const ruleDialogVisible = ref(false)
const ruleQuery = reactive<AlertApi.StockAlertRulePageReqVO>({
  pageNo: 1,
  pageSize: 10,
  watchlistId: undefined,
  enabled: undefined
})
const ruleForm = reactive<AlertApi.StockAlertRuleSaveReqVO>({
  watchlistId: undefined,
  ruleName: '',
  ruleType: 'MARKET_SIGNAL',
  enabled: true,
  cooldownMinutes: 30,
  ruleJson: ''
})

const recordLoading = ref(false)
const recordTotal = ref(0)
const recordList = ref<AlertApi.StockAlertRecordRespVO[]>([])
const recordQuery = reactive<AlertApi.StockAlertRecordPageReqVO>({
  pageNo: 1,
  pageSize: 10,
  symbol: undefined,
  channelCode: undefined
})

const configLoading = ref(false)
const configList = ref<AlertApi.StockAnalysisConfigRespVO[]>([])

const formatRuleType = (value?: string) => ruleTypeMap[value || ''] || value || '-'

const resetChannelForm = () => {
  channelForm.id = undefined
  channelForm.channelCode = ''
  channelForm.channelName = ''
  channelForm.enabled = true
  channelForm.configJson = ''
}

const resetRuleForm = () => {
  ruleForm.id = undefined
  ruleForm.watchlistId = undefined
  ruleForm.ruleName = ''
  ruleForm.ruleType = 'MARKET_SIGNAL'
  ruleForm.enabled = true
  ruleForm.cooldownMinutes = 30
  ruleForm.ruleJson = ''
}

const getChannelList = async () => {
  channelLoading.value = true
  try {
    channelList.value = await AlertApi.getAlertChannelList()
  } finally {
    channelLoading.value = false
  }
}

const openChannelDialog = (row?: AlertApi.StockAlertChannelRespVO) => {
  resetChannelForm()
  if (row) {
    Object.assign(channelForm, row)
  }
  channelDialogVisible.value = true
}

const handleSaveChannel = async () => {
  await AlertApi.saveAlertChannel(channelForm)
  message.success('渠道已保存')
  channelDialogVisible.value = false
  await getChannelList()
}

const handleTestChannel = async (row: AlertApi.StockAlertChannelRespVO) => {
  await AlertApi.testAlertChannel({
    channelCode: row.channelCode,
    content: '股票提醒渠道测试消息'
  })
  message.success('测试消息已发送')
}

const getRulePage = async () => {
  ruleLoading.value = true
  try {
    const data = await AlertApi.getAlertRulePage(ruleQuery)
    ruleList.value = data.list
    ruleTotal.value = data.total
  } finally {
    ruleLoading.value = false
  }
}

const handleRuleQuery = async () => {
  ruleQuery.pageNo = 1
  await getRulePage()
}

const openRuleDialog = (row?: AlertApi.StockAlertRuleRespVO) => {
  resetRuleForm()
  if (row) {
    Object.assign(ruleForm, row)
  }
  ruleDialogVisible.value = true
}

const handleSaveRule = async () => {
  if (ruleForm.id) {
    await AlertApi.updateAlertRule(ruleForm)
  } else {
    await AlertApi.createAlertRule(ruleForm)
  }
  message.success('规则已保存')
  ruleDialogVisible.value = false
  await getRulePage()
}

const handleDeleteRule = async (id: number) => {
  await message.delConfirm()
  await AlertApi.deleteAlertRule(id)
  message.success('规则已删除')
  await getRulePage()
}

const getRecordPage = async () => {
  recordLoading.value = true
  try {
    const data = await AlertApi.getAlertRecordPage(recordQuery)
    recordList.value = data.list
    recordTotal.value = data.total
  } finally {
    recordLoading.value = false
  }
}

const handleRecordQuery = async () => {
  recordQuery.pageNo = 1
  await getRecordPage()
}

const getConfigList = async () => {
  configLoading.value = true
  try {
    configList.value = await AlertApi.getAnalysisConfigList()
  } finally {
    configLoading.value = false
  }
}

const handleSaveConfig = async () => {
  await AlertApi.updateAnalysisConfig({
    items: configList.value.map((item) => ({
      configKey: item.configKey,
      configValue: item.configValue
    }))
  })
  message.success('分析配置已保存')
}

onMounted(async () => {
  await Promise.all([getChannelList(), getRulePage(), getRecordPage(), getConfigList()])
})
</script>

<style scoped lang="scss">
.toolbar {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 16px;
}
</style>
