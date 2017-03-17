invisible("é")

message(Sys.time(), ": ", "Initialisation...")

# set R variable digits that controls decimal presition
options(digits = 15)

source("R/load-libraries.R", encoding = "UTF-8")
source("utils/db_utils.R", encoding = "UTF-8")
