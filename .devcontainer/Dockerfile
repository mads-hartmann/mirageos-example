FROM mcr.microsoft.com/devcontainers/base:ubuntu

# System packages required to install opam and build OCaml / MirageOS projects.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        opam \
        build-essential \
        m4 \
        pkg-config \
        git \
        libgmp-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER vscode

# Initialise opam and install the OCaml toolchain plus MirageOS.
# Sandboxing is disabled because the build already runs inside a container.
RUN opam init --yes --disable-sandboxing \
    && opam install --yes mirage ocaml-lsp-server ocamlformat

# Make the opam environment available in interactive shells.
RUN echo 'eval $(opam env)' >> /home/vscode/.bashrc
