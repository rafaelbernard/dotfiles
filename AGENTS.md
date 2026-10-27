<!-- icm:start -->
## Persistent memory (ICM)

ICM is a helper index, not the source of truth. Files (notes, skills, AGENTS.md, tickets, ADRs) hold the facts and must be correct. ICM holds only three kinds of entry:

1. **Preferences:** corrections and rules from the user. `icm store -t preferences -c "..." -i critical`, one fact per entry.
2. **Voice:** the writing profile, topic `voice`, written by `capture-my-voice`.
3. **Pointers:** where something lives, so it can be found faster. `icm store -t pointers -c "<what>: <path>" -i high`, one line each.

### Recall
When a preference, voice trait or file location is unclear, before searching the files:
```bash
icm recall "query"                        # search memories
icm recall "query" -t "pointers"          # filter by topic
icm recall-context "query" --limit 5      # formatted for prompt injection
```
Treat a recalled entry as a hint and check it against the file before relying on it.

### Store, only when
- the user corrects you or states a preference or rule;
- a durable note or document is created or moved (store its pointer);
- the voice profile is refreshed.

Recall first. If an entry already covers it, `icm update <id> -c "..."`; never add a second entry for the same fact. Do not store on a timer or a tool-call count.

### Never store
Progress, status, summaries of work done, decisions or errors that a note or ticket already records (write the note, store only a pointer), build logs, git state, or assistant text.

### Maintenance
No consolidation. Fix a wrong entry with `icm update <id>` or `icm forget <id>`. Check `icm health` and `icm prune --dry-run` now and then.
<!-- icm:end -->
