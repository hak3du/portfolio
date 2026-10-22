.PHONY: test check-compliant check-noncompliant

test:
	opa test policy -v

check-compliant:
	@count=$$(opa eval --format raw --data policy --input examples/compliant-plan.json 'count(data.terraform.guardrails.deny)'); \
	echo "Compliant fixture violation count: $$count"; \
	test "$$count" = "0"

check-noncompliant:
	@count=$$(opa eval --format raw --data policy --input examples/noncompliant-plan.json 'count(data.terraform.guardrails.deny)'); \
	echo "Noncompliant fixture violation count: $$count"; \
	test "$$count" -ge "1"; \
	opa eval --format pretty --data policy --input examples/noncompliant-plan.json 'data.terraform.guardrails.deny'
