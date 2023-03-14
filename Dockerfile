# Start from a core stack version
FROM jupyter/scipy-notebook:2023-03-13
# Install from the requirements.txt file
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN pip install --no-cache-dir scikit-hep~=5.0.0 && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
