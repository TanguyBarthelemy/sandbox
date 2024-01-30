library("RJDemetra")
library("rjdworkspace")

dir_ws <- tempdir()
template_ws <- file.path(system.file("extdata", package = "rjdworkspace"),
                         "WS")
# Moving the WS in a temporary environment
rjdworkspace:::copy_ws(
    ws_name = "ws_output",
    path_ws = template_ws,
    new_path = dir_ws
)
rjdworkspace:::copy_ws(
    ws_name = "ws_input",
    path_ws = template_ws,
    new_path = dir_ws
)
path_ws_from <- file.path(dir_ws, "ws_input.xml")
path_ws_to <- file.path(dir_ws, "ws_output.xml")

ws_input <- load_workspace(path_ws_from)
ws_output <- load_workspace(path_ws_to)
