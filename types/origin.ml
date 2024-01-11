module Stable = struct
  open! Core.Core_stable
  open! Import_stable

  module V1 = struct
    type t =
      | Github of String.V1.t * String.V1.t
      | Git of String.V1.t
    [@@deriving sexp, stable_variant, variants]
  end

  module Latest = V1
end

open! Core
include Stable.Latest

let url = function
  | Git url -> url
  | Github (namespace, repo) -> {%string|git@github.com:%{namespace}/%{repo}.git|}
;;
