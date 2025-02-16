# from rdiamond (github.com/drostlab/rdiamond) with modifications
is_installed_diamond <- function(path = NULL) {
        # test if a valid DIAMOND version is installed
        tryCatch({
                if (!is.null(path))
                        # e.g. path = '/opt/miniconda3/bin/'
                        sys_out <-
                                system(paste0(file.path(path,"diamond version")), intern = TRUE)
                
                if (is.null(path))
                        # e.g. path = '/opt/miniconda3/bin/'
                        sys_out <-
                                system("diamond version", intern = TRUE)
                
        }, error = function(e)
                stop(
                        "It seems like you don't have DIAMOND2 installed locally on your machine or the PATH variable to the DIAMOND2 program is not set correctly.",
                        " Please use the 'path' argument to specify a path to your diamond excecutable, e.g. path = '/usr/local/bin' or path = '/opt/miniconda3/bin'.",
                        call. = FALSE
                ))
        
        if (any(stringr::str_detect(sys_out, "diamond")))
                return(TRUE)
        
}