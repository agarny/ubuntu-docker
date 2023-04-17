# Ubuntu Docker

A simple [Docker](https://www.docker.com/) file to build, run, test, and package [libCellML](https://libcellml.org/), [libOpenCOR](https://opencor.ws/libopencor), and [OpenCOR](https://opencor.ws/) on the [x86-64](https://en.wikipedia.org/wiki/X86-64) version of [Ubuntu 22.04 LTS](https://en.wikipedia.org/wiki/Ubuntu_version_history#2204). This Docker image is meant to be used on [macOS](https://en.wikipedia.org/wiki/MacOS) using [Apple silicon](https://en.wikipedia.org/wiki/Apple_silicon) (since the [ARM](https://en.wikipedia.org/wiki/ARM_architecture_family) version of Ubuntu can only be used to generate ARM code).

## Prerequisites

 - [Docker](https://www.docker.com/); and
 - [XQuartz](https://www.xquartz.org/).

## Shell scripts

You might want to add to your `PATH` the `bin` directory in this repository, so that you can access the following scripts:

 - `buildubuntu`: this builds the Ubuntu Docker image;
 - `cleanubuntu`: this removes both the Ubuntu Docker image and its container;
 - `rebuildubuntu`: this calls `cleanubuntu` and then `buildubuntu`;
 - `rerunubuntu`: this removes the Ubuntu Docker container and then calls `runubuntu`; and
 - `runubuntu`: this creates, if needed, and starts the Ubuntu Docker container.

## Run the GUI version of OpenCOR

We rely on XQuartz to run the GUI version of OpenCOR. `runubuntu` passes the `DISPLAY` environment variable to the Docker container with `xxx.xxx.xxx.xxx:0` as a value where `xxx.xxx.xxx.xxx` is the computer's IP address. So, nothing more is needed on that front.

On the XQuartz front however, we need to open its terminal and enter `xhost xxx.xxx.xxx.xxx`. This done, we can run the GUI version of OpenCOR just fine.

Should the computer's IP address change then you need to `export DISPLAY=xxx.xxx.xxx.xxx:0` in the container and `xhost xxx.xxx.xxx.xxx` in XQuartz' terminal.
