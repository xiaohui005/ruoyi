<template>
  <el-form ref="formRef" :model="formData" :rules="rules" label-width="160px">
    <el-form-item label="启用 Bark 推送" prop="enabled">
      <el-switch v-model="formData.enabled" />
    </el-form-item>
    <el-form-item label="Bark 服务地址" prop="serverUrl">
      <el-input v-model="formData.serverUrl" placeholder="https://api.day.app" />
    </el-form-item>
    <el-form-item label="Bark 设备 Key" prop="deviceKey">
      <el-input v-model="formData.deviceKey" placeholder="请输入 Bark deviceKey" show-password />
    </el-form-item>
    <el-form-item label="接收消息类型">
      <el-space wrap>
        <el-checkbox v-model="formData.receiveSystemMessage">系统站内信</el-checkbox>
        <el-checkbox v-model="formData.receiveNotificationMessage">通知消息</el-checkbox>
        <el-checkbox v-model="formData.receiveStockAlert">股票提醒</el-checkbox>
      </el-space>
    </el-form-item>
    <el-alert
      :closable="false"
      class="mb-16px"
      title="后台总开关和渠道白名单由参数配置控制；这里只配置当前账号自己的 Bark 接收偏好。"
      type="info"
    />
  </el-form>
  <div style="text-align: center">
    <el-button type="primary" @click="submit">保存</el-button>
    <el-button @click="init">重置</el-button>
  </div>
</template>

<script lang="ts" setup>
import type { FormInstance, FormRules } from 'element-plus'
import {
  getUserMessagePushProfile,
  updateUserMessagePushProfile,
  UserMessagePushProfileVO
} from '@/api/system/user/profile'

defineOptions({ name: 'MessagePush' })

const message = useMessage()

const formRef = ref<FormInstance>()
const formData = reactive<UserMessagePushProfileVO>({
  enabled: false,
  serverUrl: 'https://api.day.app',
  deviceKey: '',
  receiveSystemMessage: true,
  receiveNotificationMessage: true,
  receiveStockAlert: true
})

const rules = reactive<FormRules>({
  serverUrl: [
    {
      validator: (_rule, value, callback) => {
        if (!formData.enabled) {
          callback()
          return
        }
        if (!value) {
          callback(new Error('请输入 Bark 服务地址'))
          return
        }
        callback()
      },
      trigger: 'blur'
    }
  ],
  deviceKey: [
    {
      validator: (_rule, value, callback) => {
        if (!formData.enabled) {
          callback()
          return
        }
        if (!value) {
          callback(new Error('请输入 Bark 设备 Key'))
          return
        }
        callback()
      },
      trigger: 'blur'
    }
  ]
})

const init = async () => {
  const profile = await getUserMessagePushProfile()
  Object.assign(formData, profile)
}

const submit = async () => {
  if (!formRef.value) {
    return
  }
  await formRef.value.validate()
  await updateUserMessagePushProfile(formData)
  message.success('保存成功')
}

onMounted(() => {
  init()
})
</script>
