
print(getwd())

print(list.files(all.files = FALSE, full.names = TRUE, recursive = TRUE))


install.packages("remotes")
remotes::install_github("TanguyBarthelemy/TBox")


f <- function(output = "word", eval = FALSE, font_size = 12, code = TRUE) {

    rmd_header <- paste0(
        "---\ntitle: \"Format code\"\noutput:\n  ",
        output,
        "_document:\n    highlight: arrow\n",
        ifelse(
            test = (output == "pdf"),
            yes = "    latex_engine: xelatex\n",
            no = "monofont: \"Fira Code\"\n"
        ),
        "code-block-bg: true\n",
        "code-block-border-left: \"#31BAE9\"\n",
        "---\n"
    )
    rmd_pdf <- ifelse(
        test = (output == "pdf"),
        yes = paste0(
            "\n\\fontsize{", font_size, "}{", font_size, "}\n",
            "\\setmonofont[ExternalLocation=",
            system.file("extdata", "FiraCode", package = "TBox"),
            "/]{FiraCode-Regular.ttf}\n"
        ),
        no = ""
    )

    content <- "plot(AirPassengers)"

    rmd_body <- paste0(
        "\n## Running Code\n\n",
        ifelse(
            test = code,
            yes = paste0("```{r, echo = TRUE, eval = ", eval, "}"),
            no = ""
        ), "\n",
        content, "\n",
        ifelse(code, "```", ""), "\n"
    )
    
    # rmd_content <- paste0(rmd_header, rmd_pdf, rmd_body)
    rmd_content <- paste0(rmd_header, rmd_body)

    return(rmd_content)
}

rmd_content <- f("pdf", eval = TRUE, font_size = 16)

print(rmd_content)
cat(rmd_content)

rmd_file <- tempfile(pattern = "template", fileext = ".Rmd")
out_file <- tempfile(pattern = "output", fileext = ".pdf")

# rmd_file <- normalizePath("./Rmd/format_code.Rmd", mustWork = TRUE)
# out_file <- normalizePath("./Rmd/format_code.pdf", mustWork = TRUE)

write(rmd_content, file = rmd_file)


install.packages("rmarkdown")
rmarkdown::render(input = rmd_file, output_file = out_file)
