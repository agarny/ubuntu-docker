FROM --platform=x86_64 ubuntu:22.04

ENV HOME_DIR /root

WORKDIR $HOME_DIR

# Install zsh and Oh My Zsh:

RUN apt update && \
    apt install -y language-pack-en zsh && \
    update-locale

COPY .oh-my-zsh $HOME_DIR/.oh-my-zsh
COPY .zshrc $HOME_DIR/.zshrc

# Install a couple of editors:

RUN apt install -y dbus-x11 gedit vim

# Install everything we need to build, test, and run libCellML, libOpenCOR, and OpenCOR:

    # Install CMake:
RUN apt install -y cmake && \
    # Install ninja:
    apt install -y ninja-build && \
    # Install buildcache:
    apt install -y wget && \
    wget https://github.com/mbitsnbites/buildcache/releases/download/v0.28.2/buildcache-linux.tar.gz && \
    tar xvf buildcache-linux.tar.gz && \
    mv buildcache/bin/buildcache /usr/bin && \
    rm -fr buildcache* && \
    # Install pip3:
    apt install -y python3-pip && \
    # Install gcovr:
    pip3 install gcovr && \
    # Install coverage, pytest, and pytest-html:
    pip3 install coverage pytest pytest-html && \
    # Install Qt:
    pip3 install aqtinstall && \
    aqt install-qt --outputdir /Qt linux desktop 5.12.12 && \
    rm aqtinstall.log && \
    # Install everything we need to build our documentation using Sphinx:
    pip3 install Sphinx sphinx-copybutton sphinx-inline-tabs && \
    # Install some libraries needed to build libCellML:
    apt install -y libffi7 libxml2-dev && \
    # Install some libraries needed to build OpenCOR:
    apt install -y libffi7 libgl1-mesa-dev libtinfo5 && \
    # Install some libraries needed to run OpenCOR:
    apt install -y libpulse-mainloop-glib0 libxkbcommon-x11-0 libxrender1 libxslt1.1

# Clone the libCellML, libOpenCOR, and OpenCOR repositories:

RUN apt install -y git && \
    git clone https://github.com/agarny/libcellml.git libCellML && \
    git clone https://github.com/agarny/libopencor.git libOpenCOR && \
    git clone https://github.com/agarny/opencor.git OpenCOR
