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
                  {{ t('workplace.welcome') }} {{ username }} {{ t('workplace.happyDay') }}
                </div>
                <div class="mt-10px text-14px text-gray-500">
                  {{ t('workplace.toady') }}闂?0闂?- 32闂傚倸鍊烽悞锕傚几婵傜鐤炬繛鎴欏灩缁愭绻涢幋鐐殿暡妞?
                </div>
              </div>
            </div>
          </el-col>
          <el-col :xl="12" :lg="12" :md="12" :sm="24" :xs="24">
            <div class="h-70px flex items-center justify-end lt-sm:mt-10px">
              <div class="px-8px text-right">
                <div class="mb-16px text-14px text-gray-400">{{ t('workplace.project') }}</div>
                <CountTo
                  class="text-20px"
                  :start-val="0"
                  :end-val="totalSate.project"
                  :duration="2600"
                />
              </div>
              <el-divider direction="vertical" />
              <div class="px-8px text-right">
                <div class="mb-16px text-14px text-gray-400">{{ t('workplace.toDo') }}</div>
                <CountTo
                  class="text-20px"
                  :start-val="0"
                  :end-val="totalSate.todo"
                  :duration="2600"
                />
              </div>
              <el-divider direction="vertical" border-style="dashed" />
              <div class="px-8px text-right">
                <div class="mb-16px text-14px text-gray-400">{{ t('workplace.access') }}</div>
                <CountTo
                  class="text-20px"
                  :start-val="0"
                  :end-val="totalSate.access"
                  :duration="2600"
                />
              </div>
            </div>
          </el-col>
        </el-row>
      </el-skeleton>
    </el-card>
  </div>

  <el-row class="mt-8px" :gutter="8" justify="space-between">
    <el-col :xl="16" :lg="16" :md="24" :sm="24" :xs="24" class="mb-8px">
      <el-card shadow="never">
        <template #header>
          <div class="h-3 flex justify-between">
            <span>{{ t('workplace.project') }}</span>
            <el-link
              type="primary"
              :underline="false"
              href="https://github.com/yudaocode"
              target="_blank"
            >
              {{ t('action.more') }}
            </el-link>
          </div>
        </template>
        <el-skeleton :loading="loading" animated>
          <el-row :gutter="8" class="gap-y-8px">
            <el-col
              v-for="(item, index) in projects"
              :key="`card-${index}`"
              :xl="8"
              :lg="8"
              :md="8"
              :sm="24"
              :xs="24"
              class="!flex"
            >
              <el-card
                shadow="hover"
                class="flex-1 cursor-pointer"
                body-class="flex h-full flex-col"
                @click="handleProjectClick(item.message)"
              >
                <div class="flex items-center">
                  <Icon
                    :icon="item.icon"
                    :size="25"
                    class="mr-8px flex-none"
                    :style="{ color: item.color }"
                  />
                  <span class="min-w-0 line-clamp-2 text-16px" :title="item.name">{{
                    item.name
                  }}</span>
                </div>
                <div
                  class="mt-12px break-all line-clamp-2 text-12px text-gray-400"
                  :title="t(item.message)"
                >
                  {{ t(item.message) }}
                </div>
                <div
                  class="mt-auto flex items-center justify-between gap-8px pt-12px text-12px text-gray-400"
                >
                  <span class="min-w-0 truncate" :title="item.personal">{{ item.personal }}</span>
                  <span class="shrink-0 whitespace-nowrap">
                    {{ formatTime(item.time, 'yyyy-MM-dd') }}
                  </span>
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
                <el-skeleton :loading="loading" animated>
                  <Echart :options="pieOptionsData" :height="280" />
                </el-skeleton>
              </el-card>
            </el-col>
            <el-col :xl="14" :lg="14" :md="24" :sm="24" :xs="24">
              <el-card shadow="hover" class="mb-8px">
                <el-skeleton :loading="loading" animated>
                  <Echart :options="barOptionsData" :height="280" />
                </el-skeleton>
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
            <span>{{ t('workplace.shortcutOperation') }}</span>
          </div>
        </template>
        <el-skeleton :loading="loading" animated>
          <el-row>
            <el-col v-for="item in shortcut" :key="`team-${item.name}`" :span="8" class="mb-8px">
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
            <span>{{ t('workplace.notice') }}</span>
            <el-link type="primary" :underline="false">{{ t('action.more') }}</el-link>
          </div>
        </template>
        <el-skeleton :loading="loading" animated>
          <div v-for="(item, index) in notice" :key="`dynamics-${index}`">
            <div class="flex items-center">
              <el-avatar :src="avatar" :size="35" class="mr-16px">
                <img src="@/assets/imgs/avatar.gif" alt="" />
              </el-avatar>
              <div>
                <div class="text-14px">
                  <Highlight :keys="item.keys.map((v) => t(v))">
                    {{ item.type }} : {{ item.title }}
                  </Highlight>
                </div>
                <div class="mt-16px text-12px text-gray-400">
                  {{ formatTime(item.date, 'yyyy-MM-dd') }}
                </div>
              </div>
            </div>
            <el-divider />
          </div>
        </el-skeleton>
      </el-card>
    </el-col>
  </el-row>
</template>
<script lang="ts" setup>
import { set } from 'lodash-es'
import { EChartsOption } from 'echarts'
import { formatTime } from '@/utils'

import { useUserStore } from '@/store/modules/user'
// import { useWatermark } from '@/hooks/web/useWatermark'
import type { WorkplaceTotal, Project, Notice, Shortcut } from './types'
import { pieOptions, barOptions } from './echarts-data'
import { useRouter } from 'vue-router'

defineOptions({ name: 'Index' })

const { t } = useI18n()
const router = useRouter()
const userStore = useUserStore()
// const { setWatermark } = useWatermark()
const loading = ref(true)
const avatar = userStore.getUser.avatar
const username = userStore.getUser.nickname
const pieOptionsData = reactive<EChartsOption>(pieOptions) as EChartsOption
// 闂傚倸鍊风粈渚€宕ョ€ｎ喖纾块柟鎯版鎼村﹪鏌ら懝鎵牚濞存粌缍婇弻娑㈠Ψ閵忊剝鐝栫紒鐐劤閵堟悂寮婚敐澶婄睄闁逞屽墮椤啴宕稿Δ鈧憴锕傛煃瑜滈崜鐔奉潖?
let totalSate = reactive<WorkplaceTotal>({
  project: 0,
  access: 0,
  todo: 0
})

const getCount = async () => {
  const data = {
    project: 40,
    access: 2340,
    todo: 10
  }
  totalSate = Object.assign(totalSate, data)
}

// 闂傚倸鍊风粈渚€宕ョ€ｎ喖纾块柟鎯版鎼村﹪鏌ら懝鎵牚濞存粌缍婇弻娑㈠Ψ閿濆懎惟婵炲瓨绮嶇划鎾诲蓟濞戙垺鏅滈悹鍥ㄥ絻缁犺櫣绱撴担鐟板妞ゃ劌锕?
let projects = reactive<Project[]>([])
const getProject = async () => {
  const data = [
    {
      name: 'limi-vue-pro',
      icon: 'simple-icons:springboot',
      message: 'github.com/YunaiV/limi-vue-pro',
      personal: 'Spring Boot Java backend',
      time: new Date('2025-01-02'),
      color: '#6DB33F'
    },
    {
      name: 'yudao-ui-admin-vue3',
      icon: 'ep:element-plus',
      message: 'github.com/yudaocode/yudao-ui-admin-vue3',
      personal: 'Vue3 + element-plus admin',
      time: new Date('2025-02-03'),
      color: '#409EFF'
    },
    {
      name: 'yudao-cloud',
      icon: 'material-symbols:cloud-outline',
      message: 'github.com/YunaiV/yudao-cloud',
      personal: 'Spring Cloud microservice edition',
      time: new Date('2025-04-05'),
      color: '#1890ff'
    },
    {
      name: 'yudao-ui-admin-vben',
      icon: 'devicon:antdesign',
      message: 'github.com/yudaocode/yudao-ui-admin-vben',
      personal: 'Vue3 + vben5 admin',
      time: new Date('2025-05-06'),
      color: '#e18525'
    },
    {
      name: 'yudao-ui-admin-uniapp',
      icon: 'ant-design:mobile',
      message: 'github.com/yudaocode/yudao-ui-admin-uniapp',
      personal: 'Vue3 + uniapp mobile client',
      time: new Date('2025-06-01'),
      color: '#2979ff'
    }
  ]
  projects = Object.assign(projects, data)
}

// 闂傚倸鍊风粈渚€宕ョ€ｎ喖纾块柟鎯版鎼村﹪鏌ら懝鎵牚濞存粌缍婇弻娑㈠Ψ椤旂厧顫梺缁樺笧缁垶骞堥妸銉庣喐寰勭粙鎸庡創闂備礁鎲￠悷銏ゅ磻閹剧粯鈷掑ù锝勮閻掔偓绻涚€涙ê鍝虹€规洘绮岄埢搴ㄥ箻瀹曞洨鏋€?
let notice = reactive<Notice[]>([])
const getNotice = async () => {
  const data = [
    {
      title: '缂傚倸鍊搁崐椋庢閿熺姴鍨傞梻鍫熺〒閺嗭箓鏌ｉ姀銈嗘锭闁搞劍绻冪换娑橆啅椤旇崵鐩庣紓鍌欒閺呮粓濡甸崟顖氬唨闁靛ě鈧Σ鍫ユ⒑?JDK 8/17/21闂傚倸鍊烽悞锔锯偓绗涘懐鐭欓柟杈惧瘜閺佸棝鏌ｉ妸銉ь暒 2/3',
      type: '鍐呭',
      keys: ['JDK', 'Vue'],
      date: new Date()
    },
    {
      title: 'Spring Boot 2.7/3.2 + Cloud 瀵规瘮',
      type: '閫夊瀷',
      keys: ['Boot', 'Cloud'],
      date: new Date()
    },
    {
      title: '100% 开源项目能力总结',
      type: '方法论',
      keys: ['开源项目'],
      date: new Date()
    },
    {
      title: '10w+ Star 开源项目经验总结',
      type: '实践',
      keys: ['骞跺彂瀹炶返', '10w+'],
      date: new Date()
    }
  ]
  notice = Object.assign(notice, data)
}

// 闂傚倸鍊风粈渚€宕ョ€ｎ喖纾块柟鎯版鎼村﹪鏌ら懝鎵牚濞存粌缍婇弻娑㈠Ψ椤旇崵鏁栭梺姹囧€愰崑鎾翠繆閻愵亜鈧牠宕濊瀵板﹪鎮惧畝鈧惌鍫㈡喐閻楀牆绗氶柣鎾存礋閻擃偊宕惰閸庡繘鏌涢弮鈧銊╁箟?
let shortcut = reactive<Shortcut[]>([])

const getShortcut = async () => {
  const data = [
    {
      name: '鍟嗗煄',
      icon: 'ion:home-outline',
      url: '/',
      color: '#1fdaca'
    },
    {
      name: 'AI 大模型',
      icon: 'tabler:ai',
      url: '/ai/chat',
      color: '#7c3aed'
    },
    {
      name: 'IoT 物联网',
      icon: 'fa-solid:hdd',
      url: '/iot/home',
      color: '#1a73e8'
    }
  ]
  shortcut = Object.assign(shortcut, data)
}

// 闂傚倸鍊烽悞锕€顪冮崹顕呯劷闁秆勵殔缁€澶屸偓骞垮劚椤︻垶寮伴妷锔剧闁瑰瓨鐟ラ悘鈺冪磼閻欐瑥娲﹂悡蹇擃熆閼哥數鈽夋い鈺婂墴閺?
const getUserAccessSource = async () => {
  const data = [
    { value: 335, name: 'analysis.directAccess' },
    { value: 310, name: 'analysis.mailMarketing' },
    { value: 234, name: 'analysis.allianceAdvertising' },
    { value: 135, name: 'analysis.videoAdvertising' },
    { value: 1548, name: 'analysis.searchEngines' }
  ]
  set(
    pieOptionsData,
    'legend.data',
    data.map((v) => t(v.name))
  )
  pieOptionsData!.series![0].data = data.map((v) => {
    return {
      name: t(v.name),
      value: v.value
    }
  })
}
const barOptionsData = reactive<EChartsOption>(barOptions) as EChartsOption

// 闂傚倸鍊风粈渚€骞夐敍鍕煓闊洦绋戠粈澶屸偓骞垮劚閹峰銆掓繝姘仯闁诡厽甯掓俊鐣屸偓瑙勬礀椤︾敻寮诲☉銏犵疀闂傚牊绋掗悘鍫濃攽?
const getWeeklyUserActivity = async () => {
  const data = [
    { value: 13253, name: 'analysis.monday' },
    { value: 34235, name: 'analysis.tuesday' },
    { value: 26321, name: 'analysis.wednesday' },
    { value: 12340, name: 'analysis.thursday' },
    { value: 24643, name: 'analysis.friday' },
    { value: 1322, name: 'analysis.saturday' },
    { value: 1324, name: 'analysis.sunday' }
  ]
  set(
    barOptionsData,
    'xAxis.data',
    data.map((v) => t(v.name))
  )
  set(barOptionsData, 'series', [
    {
      name: t('analysis.activeQuantity'),
      data: data.map((v) => v.value),
      type: 'bar'
    }
  ])
}

const getAllApi = async () => {
  await Promise.all([
    getCount(),
    getProject(),
    getNotice(),
    getShortcut(),
    getUserAccessSource(),
    getWeeklyUserActivity()
  ])
  loading.value = false
}

const handleProjectClick = (message: string) => {
  window.open(`https://${message}`, '_blank')
}

const handleShortcutClick = (url: string) => {
  router.push(url)
}

getAllApi()
</script>
