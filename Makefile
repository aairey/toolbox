.DEFAULT: help
help:
	@echo "make deps"
	@echo "       install dependencies to build the container"
	@echo "make build"
	@echo "       build the container image"
	@echo "make test"
	@echo "       test the built container image"
	@echo "make publish"
	@echo "       publish the built image to a registry"
	@echo "make publish"
	@echo "       same as make publish in this case"

deps: requirements.txt requirements.yml
	echo "Install the dependencies to build the container"
	pip install -r requirements.txt
	ansible-galaxy install -r requirements.yml

build: deps
	echo "build the container image"
	ansible-bender build playbook.yml

test: build
	echo "test the built image"


publish: build
	echo "Publish the built image to a registry"


deploy: publish