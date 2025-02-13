is_installed_blast <- function(path = NULL) {
        
        # due to differences in path setting between windows and unix
        if (.Platform$OS.type == "windows"){
                path_export <- "set PATH=%PATH%;"
                path_cmd_separator <- " & "
        } else {
                path_export <- "export PATH=$PATH:"
                path_cmd_separator <- " ; "
        }
        
        # test if a valid BLAST version is installed
        tryCatch({
                if (is.null(path)) {
                        sys_out <-
                                system("blastp -version", intern = TRUE)
                } else {
                        sys_out <-
                                system(paste0(
                                        path_export,
                                        path,
                                        path_cmd_separator,
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