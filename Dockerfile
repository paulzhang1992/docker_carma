FROM ubuntu:18.04
MAINTAINER Paul Zhang <zzhang@shelltechworks.com>

# Supress warnings about missing front-end. As recommended at:
# http://stackoverflow.com/questions/22466255/is-it-possibe-to-answer-dialog-questions-when-installing-under-docker
ARG DEBIAN_FRONTEND=noninteractive

# Essentials: developer tools, build tools
RUN apt-get update && apt-get install -y --no-install-recommends git apt-utils

# Python 3.6
RUN apt-get install -y --no-install-recommends python3.6 python3-pip && \
    pip3 install --no-cache-dir --upgrade pip setuptools && \
    echo "alias python='python3'" >> /root/.bash_aliases && \
    echo "alias pip='pip3'" >> /root/.bash_aliases
    
# Required libs
RUN pip3 --no-cache-dir install \
    numpy \
    pandas \
    tensorflow-gpu==1.14 \
    scipy \
    scikit-learn \
    matplotlib \
    unipath \
    statsmodels \
    imageio \
    tqdm \
    xgboost

# Jupyter Notebook
# Allow access from outside the container, and skip browser.
RUN pip3 --no-cache-dir install jupyter && \
    mkdir /root/.jupyter && \
    echo "c.NotebookApp.ip = '*'" \
         "\nc.NotebookApp.open_browser = False" \
         > /root/.jupyter/jupyter_notebook_config.py
EXPOSE 8888

# Tensorflow 1.14.0 - CPU
RUN pip3 install --no-cache-dir tensorflow==1.14

# Expose port for TensorBoard
EXPOSE 6006

# Keras 2.1.5
RUN pip3 install --no-cache-dir --upgrade h5py pydot_ng keras

WORKDIR "/root"
CMD ["/bin/bash"]
