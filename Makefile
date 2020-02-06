build-preview-img:
ifeq ("$(shell docker images -q kyria-qmk-docs-preview:latest 2> /dev/null)","")
	docker build -f Dockerfile.preview -t kyria-qmk-docs-preview .
else
	@echo Preview image previously built.
endif

build-compile-img:
ifeq ("$(shell docker images -q kyria-qmk-docs-compile:latest 2> /dev/null)","")
	docker build -f Dockerfile.compile -t kyria-qmk-docs-compile .
else
	@echo Preview image previously built.
endif

preview: build-preview-img
	docker run -it -v "$(shell pwd):/usr/src/app" -p 8000:8000 kyria-qmk-docs-preview

build: build-compile-img
	rm -rf site
	docker run -v "$(shell pwd):/usr/src/app" kyria-qmk-docs-compile
