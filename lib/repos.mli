open! Core
open! Async
open! Import

type t = { repos : Repo.t String.Map.t } [@@deriving fields, sexp_of]

val read : unit -> t Or_error.t Deferred.t
val write : t -> unit Deferred.t
