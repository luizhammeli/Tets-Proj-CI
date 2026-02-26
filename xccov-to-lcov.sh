#!/bin/bash

INPUT_JSON=$1
OUTPUT_FILE=$2

if [ -z "$INPUT_JSON" ] || [ -z "$OUTPUT_FILE" ]; then
  echo "Usage: $0 coverage.json coverage.lcov"
  exit 1
fi

echo "TN:" > "$OUTPUT_FILE"

jq -r '
.targets[]
| select(.name | contains(".app"))
| .files[]
| select(.path | endswith(".swift"))
| . as $file
| "SF:\($file.path)",
  (
    $file.functions[]
    | "FN:\(.lineNumber),\(.name)"
  ),
  (
    $file.functions[]
    | "FNDA:\(.executionCount),\(.name)"
  ),
  "FNF:\($file.functions | length)",
  "FNH:\($file.functions | map(select(.executionCount > 0)) | length)",
  (
    $file.functions[]
    | .coveredLines as $cl
    | .executableLines as $el
    | if $el > 0 then
        "DA:\(.lineNumber),\(.executionCount)"
      else empty end
  ),
  "end_of_record"
' "$INPUT_JSON" >> "$OUTPUT_FILE"
sed -i "" "s|/Users/runner/work/Tets-Proj-CI/Tets-Proj-CI/Tets-Proj-CI/||g" "$OUTPUT_FILE"