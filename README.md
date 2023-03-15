# jupyter-scikit-hep

Use a more recent version of Python with JupyterLab and other HEP-focused Python analysis tools.

### Why?
CentOS7 is stuck on Python 3.6 and I want better Python 
(and all the improvements to the packages I use that come with that).

I've tried building a custom version of Python myself but that 
took a long time and did not work on the first pass. Using images
can make my environment identical across different systems where I
have my notebooks.

## Usage
Putting these packages into the image also makes the image usable
with runners that treat the image as read-only (e.g. apptainer and
singularity).

### docker or podman
The command below will download the image and then run it.
Subsequent runs will keep using the already downloaded image,
so to get updates you will need to use `docker pull`.
```
docker run \
  --rm -it \
  -p 8888:8888 \
  -v $(pwd -P):/home/jovyan \
  ghcr.io/tomeichlersmith/jupyter-scikit-hep
```

### singularity or apptainer
Build the image from DockerHub into a local SIF image file.
```
apptainer build jupyter-scikit-hep.sif docker://ghcr.io/tomeichlersmith/jupyter-scikit-hep
```
**Note**: You may want to change `APPTAINER_CACHEDIR` so that
apptainer doesn't fill up your home directory with layers.

Start JupyterLab from the container like normal defining your
working directory as the home directory of the JupyterLab user
`jovyan`.
```
apptainer run \
  --bind $(pwd -P):/home/jovyan \
  --bind ${TMPDIR:-/tmp/} \
  jupyter-scikit-hep.sif
```

## Packages
This is a very thin layer on top of the [jupyter/scipy-notebook](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook) (documentation with packages included linked) that simply installs the [`scikit-hep` metapackage](https://github.com/scikit-hep/scikit-hep/). Just to list common packages that you may already use that are included: pandas, awkward, matplotlib, mplhep, hist, pylhe, h5py, scipy, sympy (and others - inspect links for details or give the notebook a try).
