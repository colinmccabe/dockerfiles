#!/usr/bin/env bash

set -euo pipefail

OUTPUT_FILE=$(mktemp)
TASK_ID=''
TASK=''
TASK_STATUS=''

startTask() {
  TEXT_FILE=$(mktemp)
  cat - > "$TEXT_FILE"

  TASK=$(aws polly start-speech-synthesis-task \
     --output-s3-bucket-name="$POLLY_BUCKET" \
     --output-format=mp3 \
     --voice-id=Joanna \
     --text="file://$TEXT_FILE")
  TASK_ID=$(echo "$TASK" | jq -r .SynthesisTask.TaskId)
  echo "Started TaskId: $TASK_ID" >&2

  rm "$TEXT_FILE"
}

getTask() {
  TASK=$(aws polly get-speech-synthesis-task --task-id="$TASK_ID")
}

getTaskStatus() {
  getTask
  TASK_STATUS=$(echo "$TASK" | jq -r .SynthesisTask.TaskStatus)
}

startTask
getTaskStatus

while [ "$TASK_STATUS" != 'completed' ]; do
  printf "Status: %s    \r" "$TASK_STATUS" >&2
  getTaskStatus
  sleep 3
done

echo

HTTPS_URL=$(echo "$TASK" | jq -r .SynthesisTask.OutputUri)
S3_URL=s3://$(echo -n "$HTTPS_URL" | grep -o 'polly.*')
aws s3 cp "$S3_URL" "$OUTPUT_FILE"
aws s3 rm "$S3_URL"

cat "$OUTPUT_FILE"
