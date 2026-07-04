<template>
  <div class="codex-chat-page">
    <div class="hero-card">
      <div>
        <div class="eyebrow">Codex AI</div>
        <h1>最小可用聊天入口</h1>
        <p>沿用现有 AI 菜单入口，后端直接读取本机 Codex 配置并调用 responses 接口。</p>
      </div>
      <div class="hero-actions">
        <el-button :loading="configLoading" @click="loadConfig">刷新配置</el-button>
        <el-button type="danger" plain @click="clearMessages">清空对话</el-button>
      </div>
    </div>

    <div class="status-grid">
      <div class="status-card">
        <span class="status-label">Provider</span>
        <strong>{{ config?.provider || '-' }}</strong>
      </div>
      <div class="status-card">
        <span class="status-label">Model</span>
        <strong>{{ config?.model || '-' }}</strong>
      </div>
      <div class="status-card">
        <span class="status-label">Wire API</span>
        <strong>{{ config?.wireApi || '-' }}</strong>
      </div>
      <div class="status-card">
        <span class="status-label">API Key</span>
        <strong :class="config?.apiKeyConfigured ? 'ok' : 'bad'">
          {{ config?.apiKeyConfigured ? '已读取' : '未读取' }}
        </strong>
      </div>
    </div>

    <el-alert
      v-if="config && !config.apiKeyConfigured"
      title="未读取到 CRS_OAI_KEY，当前无法发送对话。"
      type="error"
      :closable="false"
      class="mb-16px"
    />

    <div class="chat-layout">
      <div ref="messageContainerRef" class="message-panel">
        <div v-if="messages.length === 0" class="empty-state">
          <div class="empty-title">还没有对话</div>
          <p>输入一个问题，验证 Codex AI 是否已经接入成功。</p>
        </div>
        <div v-for="message in messages" :key="message.id" class="message-item" :data-role="message.role">
          <div class="message-head">
            <span>{{ message.role === 'user' ? '你' : 'Codex' }}</span>
            <span>{{ message.time }}</span>
          </div>
          <div class="message-body">{{ message.content }}</div>
        </div>
      </div>

      <div class="composer-panel">
        <el-input
          v-model="prompt"
          type="textarea"
          :rows="8"
          resize="none"
          placeholder="输入问题后点击发送"
          @keydown.ctrl.enter.prevent="sendPrompt"
        />
        <div class="composer-hint">快捷键：Ctrl + Enter 发送</div>
        <div class="composer-actions">
          <el-button @click="prompt = ''">清空输入</el-button>
          <el-button type="primary" :loading="sending" @click="sendPrompt">发送到 Codex</el-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { CodexApi, CodexChatRespVO, CodexConfigVO } from '@/api/ai/codex'

defineOptions({ name: 'AiChat' })

type ChatRole = 'user' | 'assistant'

interface ChatMessage {
  id: string
  role: ChatRole
  content: string
  time: string
}

const message = useMessage()

const configLoading = ref(false)
const sending = ref(false)
const prompt = ref('')
const config = ref<CodexConfigVO>()
const messages = ref<ChatMessage[]>([])
const messageContainerRef = ref<HTMLElement>()

const loadConfig = async () => {
  configLoading.value = true
  try {
    config.value = await CodexApi.getConfig()
  } finally {
    configLoading.value = false
  }
}

const sendPrompt = async () => {
  const value = prompt.value.trim()
  if (!value) {
    message.warning('请输入内容')
    return
  }
  if (sending.value) {
    return
  }

  appendMessage('user', value)
  prompt.value = ''
  sending.value = true
  try {
    const response: CodexChatRespVO = await CodexApi.chat({ prompt: value })
    appendMessage('assistant', response.content)
  } catch (error: any) {
    const errorMessage = error?.response?.data?.msg || error?.message || '发送失败'
    appendMessage('assistant', `请求失败：${errorMessage}`)
  } finally {
    sending.value = false
  }
}

const clearMessages = () => {
  messages.value = []
}

const appendMessage = (role: ChatRole, content: string) => {
  messages.value.push({
    id: `${role}-${Date.now()}-${messages.value.length}`,
    role,
    content,
    time: formatNow()
  })
  scrollToBottom()
}

const formatNow = () => {
  const now = new Date()
  const pad = (value: number) => `${value}`.padStart(2, '0')
  return `${pad(now.getHours())}:${pad(now.getMinutes())}:${pad(now.getSeconds())}`
}

const scrollToBottom = async () => {
  await nextTick()
  const container = messageContainerRef.value
  if (container) {
    container.scrollTop = container.scrollHeight
  }
}

onMounted(() => {
  loadConfig()
})
</script>

<style scoped>
.codex-chat-page {
  min-height: calc(100vh - 110px);
  background:
    radial-gradient(circle at top left, rgba(247, 197, 72, 0.18), transparent 28%),
    linear-gradient(160deg, #f6f3ea 0%, #edf2eb 100%);
  padding: 24px;
}

.hero-card {
  display: flex;
  justify-content: space-between;
  gap: 24px;
  padding: 28px;
  border-radius: 24px;
  background: linear-gradient(135deg, #172122 0%, #253537 100%);
  color: #f4efe3;
  box-shadow: 0 18px 40px rgba(23, 33, 34, 0.18);
}

.hero-card h1 {
  margin: 8px 0 10px;
  font-size: 32px;
  line-height: 1.1;
}

.hero-card p {
  max-width: 720px;
  margin: 0;
  color: rgba(244, 239, 227, 0.78);
}

.eyebrow {
  font-size: 12px;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: #f7c548;
}

.hero-actions {
  display: flex;
  align-items: flex-start;
  gap: 12px;
}

.status-grid {
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  gap: 16px;
  margin: 20px 0 16px;
}

.status-card {
  padding: 18px 20px;
  border-radius: 18px;
  background: rgba(255, 255, 255, 0.78);
  border: 1px solid rgba(23, 33, 34, 0.08);
}

.status-label {
  display: block;
  margin-bottom: 8px;
  color: #6b7172;
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: 0.08em;
}

.ok {
  color: #1f8a4c;
}

.bad {
  color: #c2410c;
}

.chat-layout {
  display: grid;
  grid-template-columns: minmax(0, 1.45fr) minmax(320px, 0.9fr);
  gap: 18px;
  min-height: 560px;
}

.message-panel,
.composer-panel {
  border-radius: 24px;
  background: rgba(255, 255, 255, 0.82);
  border: 1px solid rgba(23, 33, 34, 0.08);
  box-shadow: 0 18px 40px rgba(23, 33, 34, 0.08);
}

.message-panel {
  padding: 20px;
  overflow-y: auto;
}

.composer-panel {
  padding: 20px;
  display: flex;
  flex-direction: column;
}

.empty-state {
  min-height: 320px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: #6b7172;
  text-align: center;
}

.empty-title {
  font-size: 20px;
  margin-bottom: 10px;
  color: #172122;
}

.message-item {
  padding: 16px 18px;
  border-radius: 18px;
  margin-bottom: 14px;
}

.message-item[data-role='user'] {
  background: #f6efe1;
}

.message-item[data-role='assistant'] {
  background: #edf4ef;
}

.message-head {
  display: flex;
  justify-content: space-between;
  gap: 12px;
  margin-bottom: 8px;
  font-size: 12px;
  color: #667071;
}

.message-body {
  white-space: pre-wrap;
  line-height: 1.7;
  color: #172122;
}

.composer-hint {
  margin-top: 10px;
  color: #7a8283;
  font-size: 12px;
}

.composer-actions {
  display: flex;
  justify-content: flex-end;
  gap: 12px;
  margin-top: auto;
  padding-top: 16px;
}

@media (max-width: 1100px) {
  .status-grid,
  .chat-layout {
    grid-template-columns: 1fr;
  }

  .hero-card {
    flex-direction: column;
  }

  .hero-actions {
    align-items: stretch;
  }
}
</style>
