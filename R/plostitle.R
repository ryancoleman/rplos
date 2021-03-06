#' Search PLoS Journals titles.
#' 
#' @template plos
#' @return Titles, in addition to any other fields requested in a data.frame.
#' @examples \dontrun{
#' plostitle(q='drosophila', fl='title', limit=99)
#' plostitle(q='drosophila', fl='title,journal', limit=10)
#' plostitle(q='drosophila',  limit = 5)
#' }
#' @export

plostitle <- function(q = NA, fl = 'id', fq = NA, sort = NA,
  start = 0, limit = NA, key = NULL, 
  sleep = 6, callopts=list(), terms, fields, toquery)
{
  calls <- deparse(sys.calls())
  calls_vec <- sapply(c("terms", "fields", "toquery"), function(x) grepl(x, calls))
  if(any(calls_vec))
    stop("The parameters terms, fields, and toquery have been replaced with q, fl, and fq, respectively")
  
  searchplos(q=paste('title:', '"', q, '"', sep=""), fl=fl, fq=fq,
             sort=sort, start=start, limit=limit,
             key=key, sleep=sleep, callopts=callopts)
}