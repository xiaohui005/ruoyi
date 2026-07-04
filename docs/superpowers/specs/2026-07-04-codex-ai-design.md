# Codex AI Minimal Integration

## Goal

Keep the existing `/ai/chat` entry in the admin UI, but replace the upstream AI module dependency with a minimal Codex-backed chat that works on the current Spring Boot 2.7 / Java 8 baseline.

## Scope

- Backend reads:
  - environment variable `CRS_OAI_KEY`
  - Codex config `C:\Users\Administrator\.codex\config.toml`
- Backend exposes:
  - `GET /ai/codex/config`
  - `POST /ai/codex/chat`
- Frontend replaces the current `/views/ai/chat/index/index.vue` implementation with a minimal Codex chat page.
- IM module remains enabled and unchanged.

## Non-Goals

- No attempt to restore the full upstream `yudao-module-ai`.
- No knowledge base, workflow, image, role, or conversation persistence features.
- No schema changes required for Codex AI.

## Success Criteria

- `/ai/chat` opens without system exception.
- The page can send a prompt and receive a Codex response.
- Backend starts cleanly with IM enabled.
