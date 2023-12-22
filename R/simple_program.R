
# Sys.setenv(LANGUAGE="de") 
# Sys.setenv(lang = "de") 
# 
# Sys.setlocale("LC_MESSAGES", "en_US.utf8") 
# 
# "LC_COLLATE=French_France.utf8;LC_CTYPE=French_France.utf8;LC_MONETARY=French_France.utf8;LC_NUMERIC=C;LC_TIME=French_France.utf8" 
# 
# 
# Sys.setlocale("LC_TIME", "C") 
# Sys.setlocale(locale = "ru_RU.utf8") 
# 
# Sys.setlocale("LC_TIME", "de_DE.utf8") 
# Sys.setlocale("LC_TIME", "fr_CA.UTF-8") 
# 
# print(format(Sys.Date(), "%Y-%b-%d"))


# Sys.setlocale("LC_CTYPE", "C")
# Sys.setlocale("LC_NUMERIC", "C")
# Sys.setlocale("LC_TIME", "C")
# Sys.setlocale("LC_COLLATE", "C")
# Sys.setlocale("LC_MONETARY", "C")
# Sys.setlocale("LC_MESSAGES", "C")
# Sys.setlocale("LC_PAPER", "C")
# Sys.setlocale("LC_NAME", "C")
# Sys.setlocale("LC_ADDRESS", "C")
# Sys.setlocale("LC_TELEPHONE", "C")
# Sys.setlocale("LC_MEASUREMENT", "C")
# Sys.setlocale("LC_IDENTIFICATION", "C")

cat("------------------ Chapter 1 -------------------\n")

print(Sys.info())

print(sessionInfo())

print(Sys.timezone())

cat("------------------ Chapter 2 -------------------\n")

M_Drucker_birth <- base::as.Date(x = "1942-09-12")
noel_2023 <- base::as.Date(x = "25/12/2023", format = "%d/%m/%Y")


pied_sur_la_lune <- as.POSIXct(x = "1969-07-21 02:56:20", 
                               format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

heure_en_france <- as.POSIXct(x = pied_sur_la_lune, tz = "Europe/Paris")
heure_los_angeles <- as.POSIXct(x = pied_sur_la_lune, tz = "America/Los_Angeles")

# définition en date et heure locale avec le bon fuseau horaire
chute_mur_berlin <- as.POSIXct(x = "1989-11-09 18:00", tz = "Europe/Berlin")

cat("--------- Sub Chapter 1 -------\n")
# Heure locale
print(chute_mur_berlin)
print(chute_mur_berlin, usetz = FALSE)
print(chute_mur_berlin, usetz = TRUE)

cat("--------- Sub Chapter 2 -------\n")

print(chute_mur_berlin, tz = "UTC")
print(chute_mur_berlin, tz = "UTC", usetz = FALSE)
print(chute_mur_berlin, tz = "UTC", usetz = TRUE)

# attr(chute_mur_berlin, "tzone") <- "Japan"
# print(chute_mur_berlin)


cat("--------- Sub Chapter 3 -------\n")
# Heure UTC (exemple en islande)

print(as.POSIXct(chute_mur_berlin, tz = "UTC"))
print(as.POSIXct(chute_mur_berlin, tz = "Japan"))

a <- as.POSIXct(chute_mur_berlin, tz = "Japan")
b <- chute_mur_berlin
attr(b, "tzone") <- "Japan"

print(a)
print(a, usetz = FALSE)
print(a, usetz = TRUE)

print(b)
print(b, usetz = FALSE)
print(b, usetz = TRUE)

cat("--------- Sub Chapter 4 -------\n")

print(a, tz = "Japan")
print(a, tz = "Japan", usetz = FALSE)
print(a, tz = "Japan", usetz = TRUE)

print(b, tz = "Japan")
print(b, tz = "Japan", usetz = FALSE)
print(b, tz = "Japan", usetz = TRUE)


cat("--------- Sub Chapter 5 -------\n")

dput(as.POSIXct(chute_mur_berlin, tz = "UTC"))
dput(a)
dput(b)

# Solution :
# with_tz
# attr(data$dateTime, "tzone") <- "Europe/Paris"



cat("------------------ Chapter 3 -------------------\n")



# définition en date et heure locale avec le bon fuseau horaire
victoire_fifa_1998 <- as.POSIXct(x = "1998-07-12 21:00", tz = "Europe/Paris")

# Heure locale
print(victoire_fifa_1998)

# Heure UTC (exemple au Burkina Faso)
print(as.POSIXct(victoire_fifa_1998, tz = "UTC"))


# Paramètres locaux en France
Sys.setlocale("LC_TIME", "fr_FR.UTF-8")
format(Sys.time(), format = "%c")

# Paramètres locaux aux USA
Sys.setlocale("LC_TIME", "en_US.UTF-8")
format(Sys.time(), format = "%c")

# Paramètres locaux aux USA
Sys.setlocale("LC_TIME", "C")
format(Sys.time(), format = "%c")



cat("------------------ Chapter 4 -------------------\n")

categories <- c("LC_CTYPE", 
                "LC_NUMERIC", 
                "LC_TIME", 
                "LC_COLLATE", 
                "LC_MONETARY", 
                "LC_MESSAGES", 
                "LC_PAPER", 
                "LC_NAME", 
                "LC_ADDRESS", 
                "LC_TELEPHONE", 
                "LC_MEASUREMENT", 
                "LC_IDENTIFICATION")

values <- c("C", 
            "de_DE", "de_DE.UTF-8", "German.UTF-8", "de_DE.utf8", 
            "fr_FR", "fr_FR.UTF-8", "French.UTF-8", "fr_FR.utf8", 
            "en_US", "en_US.UTF-8", "English.UTF-8", "en_US.utf8")

for (cat in categories) {
    cat("\n")
    print(cat)
    for (val in values) {
        print(val)
        try(Sys.setlocale(cat, val))
        cat(format(Sys.time(), format = "%d %B %Y"), "\n")
        tryCatch({1 + x}, error = function(e) print(e))
    }
}