#!/bin/bash

# 1. Capture the changes made in the last pull
CHANGES=$(git diff HEAD@{1} HEAD -- . ':(exclude)package-lock.json' ':(exclude).aqueitas/*')

if [ -z "$CHANGES" ]; then
  echo "No new architectural changes detected."
  exit 0
fi

# 2. Trigger the Agent to process and log to Notion
# This command assumes you have the Antigravity/Gemini CLI accessible
echo "Sending updates to the Sovereign Brain..."

gemini <<EOF
You are the Aqueitas Execution Layer. 
I have just pulled the following changes from BAS:
$CHANGES

Using the 'notion-brain' MCP:
1. Analyze these changes specifically for SAP CAP patterns (CDS models, service handlers, annotations).
2. Determine the architectural rationale behind these changes.
3. Create a new entry in the 'Engineering Log' database in Notion.
   - Title: BAS Sync - $(date +'%Y-%m-%d %H:%M')
   - Content: A concise, high-status summary of logic updates and BTP deployment implications.
EOF