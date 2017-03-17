invisible("é")

message(Sys.time(), ": ", "Loading Libraries...")


local.libs <- installed.packages(lib.loc = packrat::packrat_lib())

suppressMessages(
  for (pkg in 1:nrow(local.libs)) {
    require(local.libs[pkg, "Package"], character.only = TRUE, quietly = TRUE,
            lib.loc = local.libs[pkg, "LibPath"])
  }
)

rm(pkg)
rm(local.libs)
