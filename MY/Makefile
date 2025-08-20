.PHONY: install frontend-dependencies frontend-builder
.PHONY: builder-dependencies builder

prefix = /usr/local/opt/homebox

install: \
	frontend-dependencies \
	frontend-builder \
	builder-dependencies \
	builder

frontend-dependencies: \
	${prefix}/frontend/package.json \
	${prefix}/frontend/pnpm-lock.yaml
	cd ${prefix}/frontend && pnpm install --frozen-lockfile

frontend-builder:
	rsync -rz ../frontend/ -f '- package.json' -f '- pnpm-lock.yaml' ${prefix}/frontend/
	cd ${prefix}/frontend && pnpm build

${prefix}/frontend/package.json:
	@mkdir -p ${prefix}/frontend/
	cp ../frontend/package.json ${prefix}/frontend/

${prefix}/frontend/pnpm-lock.yaml:
	@mkdir -p ${prefix}/frontend/
	cp ../frontend/pnpm-lock.yaml ${prefix}/frontend/

builder-dependencies: \
	${prefix}/backend/go.mod \
	${prefix}/backend/go.sum
	cd ${prefix}/backend && go mod download

${prefix}/backend/go.mod:
	@mkdir -p ${prefix}/backend/
	cp ../backend/go.mod ${prefix}/backend/

${prefix}/backend/go.sum:
	@mkdir -p ${prefix}/backend/
	cp ../backend/go.sum ${prefix}/backend/

builder:
	@echo "Note: install system dependencies using ./installdeps.<DISTRO>!" >&2
	@echo "Note: This Makefile will not guess your package manager." >&2
	rsync -rz ../backend/ -f '- go.mod' -f '- go.sum' ${prefix}/backend/
	commit="$$(git rev-parse HEAD)"; \
	build_time="$$(date -u +%Y-%m-%dT%H:%M:%SZ)"; \
	version="$$(git describe --tags HEAD)"; \
	cd ${prefix}/backend && CGO_ENABLED=0 go build -ldflags "-s -w \
		-X main.commit='$$commit' \
		-X main.buildTime='$$build_time' \
		-X main.version='$$version' \
	    " -o bin/api -v app/api/*.go
	chmod +x ${prefix}/backend/bin/api

# vim: set noet ts=8 sw=8 sts=8 :
