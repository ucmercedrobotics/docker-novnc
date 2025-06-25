NAME:=ghcr.io/ucmercedrobotics/docker-novnc

build:
	docker build . -t ${NAME}

run:
	docker run -d --rm --net=host \
	--name=novnc \
	${NAME}