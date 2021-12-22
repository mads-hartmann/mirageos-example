FROM gitpod/workspace-full

RUN sudo apt-get update && \
    sudo apt-get install opam -y

# Disabling sandboxing as we're already running inside of a container when
# using Gitpod as our development environment.
RUN opam init --yes --disable-sandboxing && opam install mirage --yes
