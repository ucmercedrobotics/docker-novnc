NAME:=ghcr.io/ucmercedrobotics/docker-novnc

build:
	docker build . -t ${NAME}

run:
	docker run -d --rm --net=host \
	-e ENABLEHWGPU=1 \
	-e NVIDIA_VISIBLE_DEVICES=all \
	-e NVIDIA_DRIVER_CAPABILITIES=all \
	-e __GLX_VENDOR_LIBRARY_NAME=nvidia \
	-e __NV_PRIME_RENDER_OFFLOAD=1 \
	--gpus all \
	--device=/dev/dri \
	--shm-size=2g \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	--name=novnc \
	${NAME}