
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
# tryCatch({1 + x}, error = function(e) print(e)) 
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

cat("------------------ Chapter 1 -------------------")

print(Sys.info())

print(sessionInfo())

print(Sys.timezone())

cat("------------------ Chapter 2 -------------------")

M_Drucker_birth <- base::as.Date(x = "1942-09-12")
noel_2023 <- base::as.Date(x = "25/12/2023", format = "%d/%m/%Y")


pied_sur_la_lune <- as.POSIXct(x = "1969-07-21 02:56:20", 
                               format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

heure_en_france <- as.POSIXct(x = pied_sur_la_lune, tz = "Europe/Paris")
heure_los_angeles <- as.POSIXct(x = pied_sur_la_lune, tz = "America/Los_Angeles")

# définition en date et heure locale avec le bon fuseau horaire
chute_mur_berlin <- as.POSIXct(x = "1989-11-09 18:00", tz = "Europe/Berlin")

# Heure locale
print(chute_mur_berlin)

attr(chute_mur_berlin, "tzone") <- "Japan"
print(chute_mur_berlin)


# Heure UTC (exemple en islande)
print(as.POSIXct(chute_mur_berlin, tz = "UTC"))







a <- chute_mur_berlin
b <- chute_mur_berlin

a <- as.POSIXct(chute_mur_berlin, tz = "Japan")
attr(b, "tzone") <- "Japan"

print(a)

print(b)

dput(a)

dput(b)



cat("------------------ Chapter 3 -------------------")














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


