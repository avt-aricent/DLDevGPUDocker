# Use an official nvidia/cuda runtime as a parent image
FROM nvidia/cuda:9.0-cudnn7-devel

LABEL maintainer="avthatte@gmail.com"

# Set the working directory to /notebooks within the container
WORKDIR /notebooks

# Set the exposed port for jupyter notebook
EXPOSE 8888

# Install the necessary libraries for python 3.6
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:deadsnakes/ppa

# Install python 3.6
RUN apt-get update && apt-get install -y \
    python3.6 \
    python3-pip\
    && rm -rf /var/lib/apt/lists/*

# Install the necessary libraries for graphviz
RUN apt-get update && apt-get install -y \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

# Install the necessary libraries for opencv
RUN apt-get update && apt-get install -y \
    libgtk2.0-dev \
    libsm6 \
    libxext6 \
    libxrender1 \
    && rm -rf /var/lib/apt/lists/*

# Install the necessary python libraries
RUN pip3 install \
    graphviz \
    h5py \
    jupyter \
    keras \
    matplotlib \
    numpy \
    opencv-python \
    pandas \
    pydot \
    scipy \
    seaborn \
    sklearn \
    statsmodels \
    tensorflow-gpu \
    && rm -r /root/.cache/pip

# Start jupyter notebook
CMD jupyter-notebook --ip="*" --no-browser --allow-root
