# Start from a core stack version
FROM jupyter/scipy-notebook:2023-03-13
# Install scikit-hep metapackage, pinning on major version 5
RUN pip install --no-cache-dir scikit-hep~=5.0.0 && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
# Add GitHub container registry label
LABEL org.opencontainers.image.source = "https://github.com/tomeichlersmith/hepynb"
