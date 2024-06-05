install.packages("remotes")
remotes::install_github("TanguyBarthelemy/TBox")

rmarkdown::render(input = "./Rmd/format_code.Rmd", output_file = "./out.pdf")
