% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/delete-wp-tags.R
\name{delete_wp_tag}
\alias{delete_wp_tag}
\title{Delete a WordPress Tag}
\usage{
delete_wp_tag(root_url, user, pass, tag_id, verbose = TRUE)
}
\arguments{
\item{root_url}{The domain on which you wish to create the post.}

\item{user}{The username to be passed into the API call to create the post.}

\item{pass}{The password to be used in the API call to create the post.
To get this value, you must have the Application Passwords plugin
installed, and must create an application using that plugin via your
WordPress admin panel; there you will get the password needed.}

\item{tag_id}{The text string associated with the tag.}

\item{verbose}{If TRUE, the tag id will be printed to the console. Potentially useful
for usage in a single-threaded loop.}
}
\value{
response from the API. 200 means the tag was deleted!
}
\description{
Delete a tag on your WordPress site using your WordPress site's API.
}
\examples{
\dontrun{
delete_wp_tag(root_url = 'https://domain.com',user = Sys.getenv('username'),
pass = Sys.getenv('password'),tag_id = 12)
}

}
