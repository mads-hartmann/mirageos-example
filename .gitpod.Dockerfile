FROM gitpod/workspace-full

RUN sudo apt-get update && \
    sudo apt-get install opam -y

RUN opam init && opam install mirage
