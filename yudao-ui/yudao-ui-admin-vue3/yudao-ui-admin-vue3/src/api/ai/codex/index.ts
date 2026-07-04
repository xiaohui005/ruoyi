import request from '@/config/axios'

export interface CodexConfigVO {
  provider: string
  model: string
  baseUrl: string
  wireApi: string
  envKey: string
  reasoningEffort: string
  apiKeyConfigured: boolean
}

export interface CodexChatReqVO {
  prompt: string
}

export interface CodexChatRespVO {
  responseId: string
  model: string
  content: string
}

export const CodexApi = {
  getConfig: async () => {
    return await request.get<CodexConfigVO>({ url: '/ai/codex/config' })
  },

  chat: async (data: CodexChatReqVO) => {
    return await request.post<CodexChatRespVO>({ url: '/ai/codex/chat', data })
  }
}
