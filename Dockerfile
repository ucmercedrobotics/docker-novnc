FROM python:3-slim

# -- Install Dependencies
RUN apt-get update -y && \
    apt-get install -y \
    wget supervisor git net-tools procps \
    tigervnc-standalone-server fluxbox \
    mesa-utils libgl1-mesa-glx libgl1-mesa-dri

# -- manual noVNC install (debian is very old)
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc
RUN pip install websockify numpy

# -- Set Environment Variables
ENV VNC_DESKTOP_NAME="Xvnc" \
    VNC_GEOMETRY=1280x800 \
    DISPLAY=:2 \
    VNC_PORT=5902 \
    NVIDIA_VISIBLE_DEVICES=0 \
    NVIDIA_DRIVER_CAPABILITIES=all \
    VGL_DISPLAY=egl \
    SUPD_LOGLEVEL=INFO \
    ENABLEHWGPU=true

COPY . /app
CMD supervisord -c /app/supervisord.conf
EXPOSE 8080