<template>
  <div>
    <el-card shadow="never">
      <el-skeleton :loading="loading" animated>
        <el-row :gutter="16" justify="space-between">
          <el-col :xl="12" :lg="12" :md="12" :sm="24" :xs="24">
            <div class="flex items-center">
              <el-avatar :src="avatar" :size="70" class="mr-16px">
                <img src="@/assets/imgs/avatar.gif" alt="" />
              </el-avatar>
              <div>
                <div class="text-20px">
                  {{ t('workplace.welcome') }} {{ username }}，欢迎进入股票分析系统
                </div>
                <div class="mt-10px text-14px text-gray-500">
                  {{ todayText }}，优先查看自选股、推荐股票和提醒设置。
                </div>
              </div>
            </div>
          </el-col>
          <el-col :xl="12" :lg="12" :md="12" :sm="24" :xs="24">
            <div class="h-70px flex items-center justify-end lt-sm:mt-10px">
              <div
                v-for="item in summaryStats"
                :key="item.label"
                class="px-8px text-right"
              >
                <div class="mb-16px text-14px text-gray-400">{{ item.label }}</div>
                <CountTo
                  class="text-20px"
                  :start-val="0"
                  :end-val="item.value"
                  :duration="2200"
                />
              </div>
            </div>
          </el-col>
        </el-row>
      </el-skeleton>
    </el-card>

    <el-row class="mt-8px" :gutter="8" justify="space-between">
      <el-col :xl="16" :lg="16" :md="24" :sm="24" :xs="24" class="mb-8px">
        <el-card shadow="never">
          <template #header>
            <div class="h-3 flex justify-between">
              <span>股票模块导航</span>
            </div>
          </template>
          <el-skeleton :loading="loading" animated>
            <el-row :gutter="8" class="gap-y-8px">
              <el-col
                v-for="item in featureCards"
                :key="item.name"
                :xl="8"
                :lg="8"
                :md="8"
                :sm="24"
                :xs="24"
                class="!flex"
              >
                <el-card
                  shadow="hover"
                  class="feature-card flex-1 cursor-pointer"
                  body-class="flex h-full flex-col"
                  @click="handleShortcutClick(item.url)"
                >
                  <div class="flex items-center">
                    <Icon
                      :icon="item.icon"
                      :size="24"
                      class="mr-8px flex-none"
                      :style="{ color: item.color }"
                    />
                    <span class="min-w-0 line-clamp-2 text-16px font-600" :title="item.name">
                      {{ item.name }}
                    </span>
                  </div>
                  <div class="mt-12px break-all line-clamp-2 text-13px text-gray-500">
                    {{ item.description }}
                  </div>
                  <div class="mt-auto flex items-center justify-between pt-12px text-12px text-gray-400">
                    <span>{{ item.tag }}</span>
                    <span>{{ item.updatedAt }}</span>
                  </div>
                </el-card>
              </el-col>
            </el-row>
          </el-skeleton>
        </el-card>

        <el-card shadow="never" class="mt-8px">
          <el-skeleton :loading="loading" animated>
            <el-row :gutter="20" justify="space-between">
              <el-col :xl="10" :lg="10" :md="24" :sm="24" :xs="24">
                <el-card shadow="hover" class="mb-8px">
                  <Echart :options="pieOptionsData" :height="280" />
                </el-card>
              </el-col>
              <el-col :xl="14" :lg="14" :md="24" :sm="24" :xs="24">
                <el-card shadow="hover" class="mb-8px">
                  <Echart :options="barOptionsData" :height="280" />
                </el-card>
              </el-col>
            </el-row>
          </el-skeleton>
        </el-card>
      </el-col>

      <el-col :xl="8" :lg="8" :md="24" :sm="24" :xs="24" class="mb-8px">
        <el-card shadow="never">
          <template #header>
            <div class="h-3 flex justify-between">
              <span>快捷入口</span>
            </div>
          </template>
          <el-skeleton :loading="loading" animated>
            <el-row>
              <el-col
                v-for="item in shortcuts"
                :key="item.name"
                :span="8"
                class="mb-8px"
              >
                <div class="flex items-center">
                  <Icon :icon="item.icon" class="mr-8px" :style="{ color: item.color }" />
                  <el-link type="default" :underline="false" @click="handleShortcutClick(item.url)">
                    {{ item.name }}
                  </el-link>
                </div>
              </el-col>
            </el-row>
          </el-skeleton>
        </el-card>

        <el-card shadow="never" class="mt-8px">
          <template #header>
            <div class="h-3 flex justify-between">
              <span>系统提示</span>
            </div>
          </template>
          <el-skeleton :loading="loading" animated>
            <div v-for="item in notices" :key="item.title">
              <div class="flex items-start">
                <el-avatar :src="avatar" :size="35" class="mr-16px">
                  <img src="@/assets/imgs/avatar.gif" alt="" />
                </el-avatar>
                <div class="min-w-0">
                  <div class="text-14px font-600 text-gray-700">
                    {{ item.type }}：{{ item.title }}
                  </div>
                  <div class="mt-8px text-13px text-gray-500">
                    {{ item.content }}
                  </div>
                  <div class="mt-12px text-12px text-gray-400">
                    {{ item.date }}
                  </div>
                </div>
              </div>
              <el-divider />
            </div>
          </el-skeleton>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script lang="ts" setup>
import { set } from 'lodash-es'
import { EChartsOption } from 'echarts'
import { formatTime } from '@/utils'
import { pieOptions, barOptions } from './echarts-data'
import { useRouter } from 'vue-router'
import { useUserStore } from '@/store/modules/user'

defineOptions({ name: 'Index' })

type SummaryStat = {
  label: string
  value: number
}

type FeatureCard = {
  name: string
  description: string
  icon: string
  color: string
  url: string
  tag: string
  updatedAt: string
}

type ShortcutItem = {
  name: string
  icon: string
  color: string
  url: string
}

type NoticeItem = {
  type: string
  title: string
  content: string
  date: string
}

const { t } = useI18n()
const router = useRouter()
const userStore = useUserStore()

const loading = ref(true)
const avatar = userStore.getUser.avatar
const username = userStore.getUser.nickname
const todayText = `今天是 ${formatTime(new Date(), 'yyyy-MM-dd')}`

const summaryStats = ref<SummaryStat[]>([])
const featureCards = ref<FeatureCard[]>([])
const shortcuts = ref<ShortcutItem[]>([])
const notices = ref<NoticeItem[]>([])

const pieOptionsData = reactive<EChartsOption>(pieOptions) as EChartsOption
const barOptionsData = reactive<EChartsOption>(barOptions) as EChartsOption

const getSummaryStats = async () => {
  summaryStats.value = [
    { label: '核心模块', value: 6 },
    { label: '快捷入口', value: 4 },
    { label: '今日待办', value: 3 }
  ]
}

const getFeatureCards = async () => {
  featureCards.value = [
    {
      name: '股票分析',
      description: '输入股票代码后立即分析市场节点、量价关系和做T区间。',
      icon: 'ep:data-analysis',
      color: '#2563eb',
      url: '/stock/analyzer',
      tag: '分析入口',
      updatedAt: '实时可用'
    },
    {
      name: '行情监控',
      description: '查看 K 线、支撑压力位以及系统给出的当前建议。',
      icon: 'ep:trend-charts',
      color: '#0f766e',
      url: '/stock/monitor',
      tag: '图形监控',
      updatedAt: '实时可用'
    },
    {
      name: '自选股监控',
      description: '管理自己关注的股票列表，配置采集周期和提醒策略。',
      icon: 'ep:star',
      color: '#ca8a04',
      url: '/stock/watchlist',
      tag: '重点管理',
      updatedAt: '建议先配置'
    },
    {
      name: '推荐股票',
      description: '从已启用的自选股中筛出值得继续跟踪和处理的标的。',
      icon: 'ep:magic-stick',
      color: '#7c3aed',
      url: '/stock/recommend',
      tag: '推荐视图',
      updatedAt: '支持刷新'
    },
    {
      name: '提醒设置',
      description: '配置价格提醒、信号提醒、提醒渠道和规则冷却时间。',
      icon: 'ep:bell',
      color: '#dc2626',
      url: '/stock/alert',
      tag: '消息通知',
      updatedAt: '按需配置'
    },
    {
      name: '历史记录',
      description: '查看分析记录和复盘内容，便于回看系统建议与操作结果。',
      icon: 'ep:clock',
      color: '#475569',
      url: '/stock/history',
      tag: '历史追踪',
      updatedAt: '持续累积'
    }
  ]
}

const getShortcuts = async () => {
  shortcuts.value = [
    {
      name: '股票分析',
      icon: 'ep:data-analysis',
      color: '#2563eb',
      url: '/stock/analyzer'
    },
    {
      name: '推荐股票',
      icon: 'ep:magic-stick',
      color: '#7c3aed',
      url: '/stock/recommend'
    },
    {
      name: '自选股',
      icon: 'ep:star',
      color: '#ca8a04',
      url: '/stock/watchlist'
    },
    {
      name: '行情监控',
      icon: 'ep:trend-charts',
      color: '#0f766e',
      url: '/stock/monitor'
    },
    {
      name: '提醒设置',
      icon: 'ep:bell',
      color: '#dc2626',
      url: '/stock/alert'
    },
    {
      name: '历史记录',
      icon: 'ep:clock',
      color: '#475569',
      url: '/stock/history'
    }
  ]
}

const getNotices = async () => {
  notices.value = [
    {
      type: '首页说明',
      title: '首页已切换为股票系统专用面板',
      content: '已移除 AI、IoT 和开源项目演示卡片，避免再看到无关模块入口。',
      date: formatTime(new Date(), 'yyyy-MM-dd')
    },
    {
      type: '使用提示',
      title: '首次使用先检查股票菜单和权限',
      content: '如果看不到“推荐股票”等菜单，请执行 sql/mysql/stock/02_stock_menu.sql。',
      date: formatTime(new Date(), 'yyyy-MM-dd')
    },
    {
      type: '数据提示',
      title: '分析前请确保行情源可访问',
      content: '当股票暂时无法获取足够 K 线时，系统会给出明确提示，不再显示乱码异常。',
      date: formatTime(new Date(), 'yyyy-MM-dd')
    }
  ]
}

const getWatchlistDistribution = async () => {
  const data = [
    { value: 3, name: '核心关注' },
    { value: 5, name: '重点关注' },
    { value: 8, name: '普通关注' }
  ]
  set(pieOptionsData, 'title.text', '自选股分组占比')
  set(
    pieOptionsData,
    'legend.data',
    data.map((item) => item.name)
  )
  set(pieOptionsData, 'series', [
    {
      name: '关注分组',
      type: 'pie',
      radius: '55%',
      center: ['50%', '60%'],
      data
    }
  ])
}

const getWeeklyAnalyzeTrend = async () => {
  const data = [
    { value: 12, name: '周一' },
    { value: 18, name: '周二' },
    { value: 14, name: '周三' },
    { value: 20, name: '周四' },
    { value: 17, name: '周五' },
    { value: 6, name: '周六' },
    { value: 4, name: '周日' }
  ]
  set(barOptionsData, 'title.text', '近 7 天分析次数')
  set(
    barOptionsData,
    'xAxis.data',
    data.map((item) => item.name)
  )
  set(barOptionsData, 'series', [
    {
      name: '分析次数',
      data: data.map((item) => item.value),
      type: 'bar'
    }
  ])
}

const getAllData = async () => {
  await Promise.all([
    getSummaryStats(),
    getFeatureCards(),
    getShortcuts(),
    getNotices(),
    getWatchlistDistribution(),
    getWeeklyAnalyzeTrend()
  ])
  loading.value = false
}

const handleShortcutClick = (url: string) => {
  router.push(url)
}

getAllData()
</script>

<style scoped lang="scss">
.feature-card {
  border: 1px solid var(--el-border-color-lighter);

  :deep(.el-card__body) {
    background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
  }
}
</style>
