# noVNC Display Container
```
```
This image is intended to be used for displaying X11 applications from other containers in a browser.

## Image Contents

* [tigervnc](https://tigervnc.org/) - A high-performance VNC server with support for X11 out of the box
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* [Fluxbox](http://www.fluxbox.org/) - a small window manager
* [supervisord](http://supervisord.org) - to keep it all running

## Usage

Building the container:
```bash
make build
```

Running the container:
```bash
make run
```

Open `http://localhost:8080/vnc.html` in your browser to access noVNC, or if the image is remote, `http://{IP}:8080/vnc.html`

### Variables

You can specify the following variables:
* `VNC_DESKTOP_NAME=<name>` ("Xvnc")
* `VNC_GEOMETRY=<width>x<height>` (1280x800)
* `DISPLAY=<display>` (:2)
* `VNC_PORT=<port>` (5902)

# Thanks
___
This is based on the alpine container by @psharkey: https://github.com/psharkey/docker/tree/master/novnc

Based on [wine-x11-novnc-docker](https://github.com/solarkennedy/wine-x11-novnc-docker), [octave-x11-novnc-docker](https://hub.docker.com/r/epflsti/octave-x11-novnc-docker/), and [tigervnc-docker](https://github.com/dtinth/xtigervnc-docker).