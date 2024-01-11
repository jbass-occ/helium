open! Core
open! Import

type t =
  { name : string
  ; origin : Origin.t
  ; uuid : Uuid.t
  }
[@@deriving fields, sexp_of]

module Stable : sig
  module V1 : sig
    type nonrec t = t [@@deriving sexp]
  end
end
