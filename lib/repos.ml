module Stable = struct
  open! Core.Core_stable
  open! Import_stable

  module V1 = struct
    type t = { repos : Repo.V1.t String.V1.Map.t } [@@deriving fields, sexp]
  end

  module Latest = struct
    include V1

    let t_of_sexp s =
      let open Core in
      Or_error.try_with (fun () -> V1.t_of_sexp s)
    ;;
  end
end

open! Core
open! Async
open! Import
open! Eager_deferred.Use
include Stable.Latest

let repo_dir = Dirs.data_c "repos"

let repo_file =
  Lazy.from_fun (fun () ->
    let data = Lazy.force Dirs.data in
    let file = {%string|%{data}/repos.sexp|} in
    Unix.with_file file ~mode:[ `Creat ] ~f:(fun _ -> return file))
;;

let read () =
  let%bind repo_file = Lazy.force repo_file in
  Reader.load_sexp repo_file t_of_sexp >>| Or_error.bind ~f:Fn.id
;;

let write t =
  let%bind repo_file = Lazy.force repo_file in
  Writer.save_sexp ~hum:true repo_file (sexp_of_t t)
;;
