f <- function(a) {
    sum(k)
}
print(tryCatch(f(a = "AAA"), error = function(e) e))
print(tryCatch(f(a = 1), error = function(e) e))
