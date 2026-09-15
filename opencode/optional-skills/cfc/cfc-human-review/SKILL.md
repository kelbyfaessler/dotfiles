---
name: cfc-human-review
description: Requests a code review from a human co-worker
---

# Process

Use these fixed Slack entities. Do not look them up before posting:

| Entity | Slack ID |
| --- | --- |
| `#engineering-be` | `C02MJ8XMUMP` |
| Eeny | `U050RKR8FNY` |
| Kelby | `U0426BL9KLY` |
| Tom | `U01USGQ86NN` |
| Jonathan Vasquez (Jon) | `U02HF2QHSHF` |
| Chhayhout Chhoeu (Chhay) | `U03DLU0QZNG` |
| Ryan Parr | `U0850MKQ94Y` |

1. Use `C02MJ8XMUMP` for `#engineering-be`.

2. Ensure the Slack MCP message write tool is enabled, scoped only to the
   channel ID `C02MJ8XMUMP` when possible. Use the `send-slack-message` skill for
   every Slack post or thread reply.

3. Invoke `send-slack-message` to post this message to `#engineering-be`:

   PR ready for review please:
   <PR URL>

   Save the returned message timestamp for use as `thread_ts`.

4. Invoke `send-slack-message` to post this thread reply using Eeny's fixed user ID:

   `<@U050RKR8FNY> pick kelby pr reviewers`

   Do not post literal `@Eeny`, because it may not notify or trigger the bot.

5. Poll the thread for Eeny's response for up to 60 seconds. Eeny's response should
   contain a selected Slack user ID, usually in this form:

   `<@SELECTED_USER_ID>, it's your turn!`

6. Invoke `send-slack-message` to post this reply in the same thread:

   `<@SELECTED_USER_ID> would you be able to review this PR? If not, please re-roll.`

7. Map the selected user ID to the reviewer table above. Only resolve the user
   through Slack when Eeny returns an ID absent from the table. Report the selected
   reviewer's name and confirm that all messages were posted.

# Failure Handling

- If Eeny does not respond within 60 seconds, report that the picker timed out. Do not
  repeatedly post picker commands.
- If message posting is unavailable, report that the Slack MCP write tool must be
  enabled with `SLACK_MCP_ADD_MESSAGE_TOOL`, preferably restricted to the channel ID.
- Slack mentions must use user IDs, not usernames or display handles.
