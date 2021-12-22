# mirageos-example

This provides a quick way to play around with writing Unikernls using MirageOS using Gitpod. The .gitpod.Dockerfile configures a development environment with OPAM and relevenat OPAM pacakges installed (mirage, https://github.com/ocaml/ocaml-lsp) and the .gitpod.yml contains instructions to ensure that you're ready to code as soon as the workspace starts.

If you're only interested in OCaml and not MirageOS see [gitpod-io/template-ocaml](https://github.com/gitpod-io/template-ocaml)

---

The inital example was taken from [mirage/mirage-skeleton](https://github.com/mirage/mirage-skeleton) and modified slightly; primarily reducing the scope of the Makefile (it only needs to build one unikernel)
