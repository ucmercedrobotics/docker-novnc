NAME:=ghcr.io/ucmercedrobotics/docker-novnc

# GPU detection - check if nvidia-docker or nvidia-container-runtime is available
GPU_AVAILABLE := $(shell command -v nvidia-docker >/dev/null 2>&1 && echo "true" || (docker info 2>/dev/null | grep -q nvidia && echo "true" || echo "false"))

# GPU flags - only set if GPU is available
ifeq ($(GPU_AVAILABLE),true)
    GPU_FLAGS := --gpus=all
else
    GPU_FLAGS := 
endif

build:
	docker build . -t ${NAME}

push:
	docker buildx build --platform linux/amd64,linux/arm64 --push -t ${NAME} .

run:
	docker run -d --rm --net=host \
	$(GPU_FLAGS) \
	--name=novnc \
	${NAME}
