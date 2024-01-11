open! Core
module B = Directories.Base_dirs ()

let home =
  Lazy.from_fun (fun () ->
    match B.home_dir with
    | Some dir -> dir
    | None -> raise_s [%message "unable to find home dir..."])
;;

let child parent leaf =
  Lazy.from_fun (fun () ->
    let parent = Lazy.force parent in
    let dir = {%string|%{parent}/%{leaf}|} in
    Core_unix.mkdir_p dir;
    dir)
;;

let helium = child home ".helium"
let cache = child helium "cache"
let config = child helium "config"
let data = child helium "data"
let data_c = child data
