open! Core
open! Import

type t =
  | Github of string * string
  | Git of string
[@@deriving sexp_of, variants]

val url : t -> string

module Stable : sig
  module V1 : sig
    type nonrec t = t [@@deriving sexp]
  end
end
