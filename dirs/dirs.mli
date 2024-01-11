open! Core

(** [helium] is [$HOME/.helium] *)
val helium : string lazy_t

(** [cache] is [$HOME/.helium/cache] *)
val cache : string lazy_t

(** [config] is [$HOME/.helium/config] *)
val config : string lazy_t

(** [data] is [$HOME/.helium/data] *)
val data : string lazy_t

(** [data_c dir] is [$HOME/.helium/data/%{dir}] *)
val data_c : string -> string lazy_t
