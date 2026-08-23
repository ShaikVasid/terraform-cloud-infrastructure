.PHONY: fmt validate

fmt:
	terraform fmt -recursive

validate:
	cd environments/dev && terraform init -backend=false && terraform validate
	cd ../prod && terraform init -backend=false && terraform validate
