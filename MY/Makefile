.PHONY: install frontend-dependencies frontend-builder
.PHONY: builder-dependencies

prefix = /usr/local/opt/homebox

install: \
	frontend-dependencies \
	frontend-builder \
	builder-dependencies

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

# vim: set noet ts=8 sw=8 sts=8 :
