
# install.packages(c("rJava", "RJDemetra", "remotes"))
# remotes::install_github("InseeFrLab/rjdworkspace")

library("RJDemetra")
library("rjdworkspace")

dir_ws <- tempdir()

print(dir_ws)
print(normalizePath(dir_ws))
print(dir.exists(dir_ws))

print(list.files(dir_ws, all.files = TRUE, recursive = TRUE))

new_path <- file.path(dir_ws, "test.csv")
write.table(iris, file = new_path)

print(list.files(dir_ws, all.files = TRUE, recursive = TRUE))

new_iris <- read.table(new_path)
print(head(new_iris))


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

print(path_ws_from)
print(path_ws_to)

print(normalizePath(path_ws_to))
print(normalizePath(path_ws_from))

print(list.files(dir_ws, all.files = TRUE, recursive = TRUE))

ws_input <- load_workspace(path_ws_from)
ws_output <- load_workspace(path_ws_to)
