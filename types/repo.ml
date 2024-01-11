module Stable = struct
  open! Core.Core_stable
  open! Import_stable
  module Origin = Origin.Stable
  module Uuid = Uuid.Stable

  module V1 = struct
    type t =
      { name : String.V1.t
      ; origin : Origin.V1.t
      ; uuid : Uuid.V1.t
      }
    [@@deriving fields, sexp]
  end

  module Latest = V1
end

open! Core
include Stable.Latest
