(lang dune 3.12)

(name helium)

(generate_opam_files true)

(source
 (github jbassin-mojo/helium))

(authors "Josh Bassin <joshua.bassin@getfliff.com>")

(maintainers "Josh Bassin <joshua.bassin@getfliff.com>")

(license MIT)

(documentation https://github.com/jbassin-mojo/helium)

(package
 (name helium)
 (synopsis "A way to organized git repos")
 (description
  "A way to create stacked commits and hold multiple versions of source locally, without interrupting other dev's flow.")
 (depends ocaml dune)
 (tags ()))
