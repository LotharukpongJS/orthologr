is_installed_blast <- function(path = NULL) {
        
        # test if a valid BLAST version is installed
        tryCatch({
                if (is.null(path)) {
                        sys_out <-
                                system("blastp -version", intern = TRUE)
                } else {
                        # due to differences in path setting between windows and unix
                        # in case the user doesn't put \\ or / at the end of path.
                        if (.Platform$OS.type == "windows"){
                                path_dir <- paste0(path, "\\")
                        } else {
                                path_dir <- paste0(path, "/")
                        }
                        sys_out <-
                                system(paste0(
                                        path_dir,
                                        "blastp -version"), intern = TRUE)
                }
                
                
        }, error = function(e)
                stop(
                        "It seems like you don't have BLAST installed locally on your machine or the PATH variable to the BLAST program is not set correctly.",
                        call. = FALSE
                ))
        
        if (any(stringr::str_detect(sys_out, "blast")))
                return(TRUE)
        
}