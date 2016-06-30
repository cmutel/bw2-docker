# Dockerfile for Brightway2 using Conda

Based on the [Jupyter minimal notebook](https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook).

## What it Gives You

* Miniconda Python 3.5 & brightway2
* Unprivileged user `jovyan` (uid=1000, configurable, see options) in group `users` (gid=100) with ownership over `/home/jovyan` and `/opt/conda`
* [tini](https://github.com/krallin/tini) as the container entrypoint and [start-notebook.sh](../minimal-notebook/start-notebook.sh) as the default command
* Options for HTTPS, password auth, and passwordless `sudo`

See Jupyter documentation for usage options.

Docker instances are ephemeral. You will almost certainly want to mount a [data volume](https://docs.docker.com/v1.10/engine/userguide/containers/dockervolumes/).
