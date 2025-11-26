FROM quay.io/jupyter/minimal-notebook:x86_64-latest

COPY conda-linux-64.lock /tmp/conda-linux-64.lock

RUN mamba install --quiet --file /tmp/conda-linux-64.lock
RUN mamba clean --all -y -f
RUN fix-permissions "${CONDA_DIR}"
RUN fix-permissions "/home/${NB_USER}"

