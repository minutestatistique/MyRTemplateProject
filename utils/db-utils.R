dbConnection <- function() {
  drv <- dbDriver("PostgreSQL")
  tryCatch({
    con <- dbConnect(drv, 
                     dbname   = config::get("db_name"), 
                     host     = config::get("host"), 
                     port     = config::get("port"), 
                     user     = config::get("user"), 
                     password = config::get("password"))
  }, error = function(w) {
    con <<- NULL
  })
  con
}

dbLoadInputFile <- function(f_path) {
  fread(input            = f_path,
        sep              = "|",
        header           = TRUE, 
        stringsAsFactors = FALSE)
} 

dbInsert <- function(record, con, schema, tb_name) {
  res <- TRUE
  tb <- paste0(schema, ".", "\"",tb_name, "\"")
  record_str <- paste0("\'", record, "\'", collapse = ", ")
  query <- paste0("INSERT INTO ", tb, "VALUES (", record_str, ");")
  tryCatch({
    DBI::dbSendQuery(con, query)
  }, error = function(w) {
    if(grepl("ERROR", w)) {
      res <<- FALSE  
    }
  })
  res
}

dbUpdateTable <- function(con, schema, tb_name, record_update) {
  tb <- paste0(schema, ".", "\"",tb_name, "\"")
  query <- paste0("UPDATE ", tb, " SET \"LIBOP\" = \'", record_update$LIBOP,
                  "\' WHERE \"CODEOP\" = \'", record_update$CODEOP,
                  "\' AND \"CODSOC\" = \'", record_update$CODSOC, "\' ;")  
  tryCatch({
    dbSendQuery(con, query)    
  }, error = function(w) {    
    if(grepl("ERROR", w)) {  
      message(w)       
    }
  })  
}