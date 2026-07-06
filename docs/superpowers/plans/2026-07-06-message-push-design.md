# Message Push Implementation Plan

> **For the implementing agent:** Use this file as the execution checklist. Keep changes small, test first, and verify each step before moving on.

**Goal:** Add reusable per-user message push with Bark as the first channel, wired to all system notify messages, with admin-configurable global switches and per-user content preferences.

**Architecture:** Reuse the existing system notify pipeline as the source of truth. After a notify message is created, route it through a generic message-push service that checks global config, user binding, and content preferences, then dispatches through a channel sender abstraction. Reuse `infra_config` for global settings and add one user-scoped config table plus a profile tab for self-service binding.

**Stack:** Spring Boot, MyBatis-Plus, existing `ConfigApi`, Vue 3 admin profile page, Bark HTTP API.

---

### Task 1: Add failing tests for notify-to-push routing

**Files:**
- Modify: `yudao-module-system/src/test/java/cn/iocoder/yudao/module/system/service/notify/NotifySendServiceImplTest.java`
- Create: `yudao-module-system/src/test/java/cn/iocoder/yudao/module/system/service/notify/NotifyMessagePushServiceImplTest.java`

- [ ] Add a failing test proving `NotifySendServiceImpl` calls the push service after a notify message is created successfully.
- [ ] Run the notify send unit test class and confirm the new test fails because the push dependency/behavior does not exist yet.
- [ ] Add failing tests for push eligibility rules:
  - global config disabled => no push
  - user Bark disabled => no push
  - stock alert template code with stock preference enabled => push
  - system message template type with system preference enabled => push
- [ ] Run the new push service test class and confirm the new tests fail for the expected missing implementation.

### Task 2: Implement reusable system message push backend

**Files:**
- Create: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/dal/dataobject/messagepush/SystemMessagePushUserConfigDO.java`
- Create: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/dal/mysql/messagepush/SystemMessagePushUserConfigMapper.java`
- Create: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/service/messagepush/SystemMessagePushUserConfigService.java`
- Create: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/service/messagepush/SystemMessagePushUserConfigServiceImpl.java`
- Create: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/service/messagepush/SystemMessagePushService.java`
- Create: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/service/messagepush/SystemMessagePushServiceImpl.java`
- Create: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/service/messagepush/sender/SystemMessagePushSender.java`
- Create: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/service/messagepush/sender/BarkSystemMessagePushSender.java`
- Create: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/service/messagepush/dto/SystemMessagePushRequest.java`
- Modify: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/service/notify/NotifySendServiceImpl.java`

- [ ] Implement the user config table model and mapper with fields for Bark enablement, server URL, device key, and content preferences.
- [ ] Implement a generic sender interface and Bark sender using `RestTemplate`.
- [ ] Implement push eligibility logic using `ConfigApi` keys for global enablement and channel allowlist.
- [ ] Route notify sends into the push service after `createNotifyMessage(...)` succeeds.
- [ ] Re-run the notify and push unit tests until they pass.

### Task 3: Add profile APIs for self-service Bark binding

**Files:**
- Create: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/controller/admin/user/vo/profile/UserMessagePushProfileRespVO.java`
- Create: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/controller/admin/user/vo/profile/UserMessagePushProfileUpdateReqVO.java`
- Modify: `yudao-module-system/src/main/java/cn/iocoder/yudao/module/system/controller/admin/user/UserProfileController.java`

- [ ] Add `GET /system/user/profile/message-push/get`.
- [ ] Add `PUT /system/user/profile/message-push/update`.
- [ ] Validate required Bark fields only when Bark push is enabled.
- [ ] Verify the new APIs compile and are exercised by a focused service/unit test or direct API smoke call after backend restart.

### Task 4: Add SQL artifacts and unit-test schema support

**Files:**
- Modify: `yudao-module-system/src/test/resources/sql/create_tables.sql`
- Modify: `yudao-module-system/src/test/resources/sql/clean.sql`
- Create: `sql/mysql/system/01_message_push.sql`

- [ ] Add the new table definition to the system test schema.
- [ ] Add cleanup for the new table to the system test cleanup script.
- [ ] Add a MySQL SQL script containing the production DDL plus suggested default `infra_config` keys.
- [ ] Re-run the affected system-module tests to confirm the schema is complete.

### Task 5: Add profile UI for Bark binding and message selection

**Files:**
- Modify: `yudao-ui/yudao-ui-admin-vue3/yudao-ui-admin-vue3/src/views/Profile/Index.vue`
- Create: `yudao-ui/yudao-ui-admin-vue3/yudao-ui-admin-vue3/src/views/Profile/components/MessagePush.vue`
- Modify: `yudao-ui/yudao-ui-admin-vue3/yudao-ui-admin-vue3/src/api/system/user/profile.ts`

- [ ] Add API types and calls for message push profile get/update.
- [ ] Add a new profile tab for message push.
- [ ] Add fields for Bark enablement, server URL, device key, and message-type checkboxes.
- [ ] Validate the form and save flow against the backend API.

### Task 6: Verify end to end

**Files:**
- No additional source files expected.

- [ ] Run focused unit tests for the new backend behavior.
- [ ] Compile changed backend classes or rebuild the affected module using the repo’s available workflow.
- [ ] Restart the backend if required by the changed surface.
- [ ] Use the profile API to store a Bark config.
- [ ] Trigger a notify send path and confirm the push service is invoked and records success/failure in logs.
- [ ] Summarize the required admin `infra_config` keys and the user-side setup steps.
