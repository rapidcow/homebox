.PHONY: install frontend-dependencies frontend-builder
.PHONY: backend-dependencies backend-builder

prefix = /usr/local

build: build-frontend build-backend

build-frontend: \
	frontend-dependencies \
	frontend-builder

build-backend: \
	backend-dependencies \
	backend-builder

install:
	install -m 755 -d ${prefix}
	@# install bin/api
	install -m 755 -d ${prefix}/bin
	install -m 755 build/backend/bin/api ${prefix}/bin/api

frontend-dependencies: \
	build/frontend/package.json \
	build/frontend/pnpm-lock.yaml
	cd build/frontend && pnpm install --frozen-lockfile

frontend-builder:
	rsync -rz ../frontend/ -f '- package.json' -f '- pnpm-lock.yaml' build/frontend/
	cd build/frontend && pnpm build

build/frontend/package.json:
	@mkdir -p build/frontend/
	cp ../frontend/package.json build/frontend/

build/frontend/pnpm-lock.yaml:
	@mkdir -p build/frontend/
	cp ../frontend/pnpm-lock.yaml build/frontend/

backend-dependencies: \
	build/backend/go.mod \
	build/backend/go.sum
	cd build/backend && go mod download

build/backend/go.mod:
	@mkdir -p build/backend/
	cp ../backend/go.mod build/backend/

build/backend/go.sum:
	@mkdir -p build/backend/
	cp ../backend/go.sum build/backend/

backend-builder:
	@echo "Note: install system dependencies using ./installdeps.<DISTRO>!" >&2
	@echo "Note: This Makefile will not guess your package manager." >&2
	rsync -rz ../backend/ -f '- go.mod' -f '- go.sum' build/backend/
	@# For Go embed.FS to see (it hates symlinks so we have to copy fr)
	rsync -rz --delete build/frontend/.output/public/ build/backend/app/api/static/public
	./go-build
	chmod +x build/backend/bin/api

# vim: set noet ts=8 sw=8 sts=8 ft=make :
