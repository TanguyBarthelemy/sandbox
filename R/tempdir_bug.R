
# install.packages(c("rJava", "RJDemetra", "remotes"))
# remotes::install_github("InseeFrLab/rjdworkspace")

library("RJDemetra")
library("rjdworkspace")

printtt <- function(obj) {
    obj_name <- deparse(substitute(obj))
    cat(obj_name, ":", obj, "\n")
    return(invisible(NULL))
}


# temp dir ---------------------------------------------------------------------

dir_ws <- tempdir()

printt(dir_ws)
printt(normalizePath(dir_ws))
printt(dir.exists(dir_ws))

printt(list.files(dir_ws, all.files = TRUE, recursive = TRUE))

new_path <- file.path(dir_ws, "test.csv")
write.table(iris, file = new_path)

printt(list.files(dir_ws, all.files = TRUE, recursive = TRUE))

new_iris <- read.table(new_path)
printt(head(new_iris))


# rjdworkspace part ------------------------------------------------------------

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

printt(path_ws_from)
printt(path_ws_to)

printt(normalizePath(path_ws_to))
printt(normalizePath(path_ws_from))

printt(list.files(dir_ws, all.files = TRUE, recursive = TRUE))

ws_input <- load_workspace(path_ws_from)
ws_output <- load_workspace(path_ws_to)
