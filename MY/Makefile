.PHONY: install frontend-dependencies frontend-builder

prefix = /usr/local/opt/homebox

install: \
	frontend-dependencies \
	frontend-builder

frontend-dependencies: \
	${prefix}/frontend/package.json \
	${prefix}/frontend/pnpm-lock.yaml
	cd ${prefix}/frontend && pnpm install --frozen-lockfile

frontend-builder:

${prefix}/frontend/package.json:
	@mkdir -p ${prefix}/frontend/
	cp ../frontend/package.json ${prefix}/frontend/

${prefix}/frontend/pnpm-lock.yaml:
	@mkdir -p ${prefix}/frontend/
	cp ../frontend/pnpm-lock.yaml ${prefix}/frontend/

# vim: set noet ts=8 sw=8 sts=8 :
