#!/usr/bin/env bash
# Fail the build if the API endpoint does not return HTTP 200.

API_URL="https://1h673aj22l.execute-api.us-east-1.amazonaws.com/dev/notify"

status=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$API_URL" -d '{}' -H "Content-Type: application/json")

echo "Status code from API: $status"
if [ "$status" -ne 200 ]; then
  echo "❌ Integration test failed: expected 200"
  exit 1
fi

echo "✅ Integration test passed"
