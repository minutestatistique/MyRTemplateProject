config <- config::get(file = "conf/config.yml", use_parent = FALSE)
config$trials
config$dataset

config::get("trials")
config::get("dataset")

config::is_active("production")

# set the active configuration globally via Renviron.site or Rprofile.site
Sys.setenv(R_CONFIG_ACTIVE = "production")

# read configuration value (will return 30 from the "production" config)
config::get("trials")

config::is_active("production")
