#' @title Create a New WordPress Page
#'
#' @description wCreates a new post on the WordPress site provided using the credentials entered,
#' with content and other information provided.
#'
#' @param root_url The domain on which you wish to create the post.
#' @param user The username to be passed into the API call to create the post.
#' @param pass The password to be used in the API call to create the post. To get this value,
#' you must have the Application Passwords plugin
#' installed, and must create an application using that plugin via your WordPress admin panel;
#' there you will get the password needed.
#' @param title_val The title of the page you are creating.
#' @param excerpt_val The excerpt to be shown where your WordPress features excerpts of post.
#' @param content_val The content of the post.
#' @param fifu_val If the Featured Image From URL plugin is installed, users can specify a
#' remotely hosted image file to use as the featured image for the post.
#' This field defaults to a value of NULL.
#' @param status_val The status of the post. Can be one of 'draft','publish','pending','future','private'.
#' @param author_val The user ID of the author creating the post.
#' @param format_val The WordPress format to use. Defaults to 'standard'.
#' @param categories_val The category IDs the post is to be associated with; comma separate in a
#' character string if more than one.
#' @param tag_val The tag IDs the post is to be associated with;
#' comma separate in a category string if more than one.
#'
#' @return A tibble containing the arguments passed in as well as the URL retrieved from the
#' API response.
#'
#'@examples
#' \dontrun{
#'create_wp_post(root_url = 'https://domain.com',user = Sys.getenv('username'),
#'pass = Sys.getenv('password'),
#'title_val = 'post title',excerpt_val = 'post excerpt',
#'content_val = 'the post content as a string, with wordpress-accepted
#'<strong>html</strong> (or bbcode!)',
#'fifu_val = 'https://domain.com/image.png',
#'status_val = 'draft',format_val = 'standard',categories_val = 1, tag_val = 1)
#'}
#'
#' @export create_wp_post
#' @import tibble
#' @import httr
#' @import dplyr

create_wp_post <- function(root_url,user,pass,title_val,excerpt_val ='',content_val,fifu_val = NULL,status_val,author_val,
                           format_val = 'standard',categories_val, tag_val = '') {

  pb <- list(title = title_val,
             excerpt = excerpt_val,
             content = content_val,
             fifu_image_url = fifu_val,
             status = status_val,
             author=author_val,
             format=format_val,
             categories=categories_val,
             tags = tag_val)
  if(is.null(fifu_val)) {
    pb$fifu <- NULL
  }
  ch = httr::POST(paste0(root_url,"/wp-json/wp/v2/posts"),
            httr::authenticate(user,pass),
            body = pb,
            encode = "json")
  response <- ch %>% httr::content()
  cht <- tibble::tibble(post_id = response$id,url = response$guid$rendered,categories = categories_val,tags = tag_val,
                        title = title_val, status = status_val, author = author_val)
  return(cht)
}
