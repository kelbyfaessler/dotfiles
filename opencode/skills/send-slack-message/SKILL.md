---
name: send-slack-message
description: Use when sending or replying to Slack messages; centralizes Slack write behavior and disables app link previews by default.
---

# Send Slack Message

Use this skill whenever another workflow asks you to post or reply in Slack.

1. Resolve channel names and user names to Slack IDs before posting. If an ID is
   already provided, use it directly.
2. Use the Slack MCP message write tool, `slack_slack_send_message`.
3. Set `unfurl_app_links` to `false` on every message unless the user explicitly
   requests app link previews.
4. Use Slack user IDs for mentions, formatted as `<@USER_ID>`. Never substitute a
   username or display handle.
5. For thread replies, pass the parent message timestamp as `thread_ts`.
6. Return the message link and timestamp to the calling workflow.

Use the draft message tool only when the calling workflow explicitly asks for a
draft. Otherwise, send the message immediately when the user has authorized it.

Example message arguments:

```json
{
  "channel_id": "C0123456789",
  "message": "Message containing https://example.com",
  "unfurl_app_links": false
}
```

Example thread reply arguments:

```json
{
  "channel_id": "C0123456789",
  "thread_ts": "1234567890.123456",
  "message": "<@U0123456789> please review this.",
  "unfurl_app_links": false
}
```

# Failure Handling

- If Slack message posting is unavailable, report that the Slack MCP write tool
  must be enabled.
- Do not repeatedly retry a failed post unless the calling workflow requests it.
- Do not silently enable app link previews.
