
print(getwd())

print(list.files(all.files = FALSE, full.names = TRUE, recursive = TRUE))

write("rmd_content", file = "./Rmd/format_code.Rmd")

install.packages("remotes")
remotes::install_github("TanguyBarthelemy/TBox")


f <- function(output = "word",
              browser = getOption("browser"),
              eval = FALSE,
              font_size = 12,
              code = TRUE) {

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

    rmd_content <- paste0(rmd_header, rmd_pdf, rmd_body)

    return(rmd_content)
}

rmd_content <- f("pdf", eval = TRUE, font_size = 16)

print(rmd_content)


rmd_file <- "../Rmd/format_code.Rmd"
out_file <- "../Rmd/format_code.pdf"

# write(rmd_content, file = rmd_file)
# rmarkdown::render(input = rmd_file, output_file = out_file)
