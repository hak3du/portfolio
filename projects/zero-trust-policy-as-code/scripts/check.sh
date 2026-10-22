#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v opa >/dev/null 2>&1; then
  echo "ERROR: OPA CLI not found. Install OPA 1.x: https://www.openpolicyagent.org/docs/latest/"
  exit 127
fi

echo "== OPA version =="
opa version

echo "== Rego unit tests =="
opa test policy -v

echo "== Compliant fixture (expected violations: 0) =="
compliant_count="$(opa eval --format raw --data policy --input examples/compliant-plan.json 'count(data.terraform.guardrails.deny)')"
echo "Violation count: $compliant_count"
if [[ "$compliant_count" != "0" ]]; then
  echo "FAIL: compliant fixture was rejected."
  opa eval --format pretty --data policy --input examples/compliant-plan.json 'data.terraform.guardrails.deny'
  exit 1
fi

echo "== Noncompliant fixture (expected violations: at least 1) =="
noncompliant_count="$(opa eval --format raw --data policy --input examples/noncompliant-plan.json 'count(data.terraform.guardrails.deny)')"
echo "Violation count: $noncompliant_count"
if ! [[ "$noncompliant_count" =~ ^[0-9]+$ ]] || (( noncompliant_count < 1 )); then
  echo "FAIL: unsafe fixture passed without violations."
  exit 1
fi
opa eval --format pretty --data policy --input examples/noncompliant-plan.json 'data.terraform.guardrails.deny'

echo "PASS: policy tests and both fixture checks behaved as expected."
