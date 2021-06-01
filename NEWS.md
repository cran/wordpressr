# wordpressr 0.2.3 (May 2021)

1. A new function was added, update_wp_tags, to allow users to use the POST method on the /tags/ pages
as exposed by the WordPress API. 


# wordpressr 0.2.2 (April 2021)

1. A minor update to the DESCRIPTION file; the LazyData parameter was removed to ensure compliance with CRAN requirements.

# wordpressr 0.2.1 (February 2021)

* Amended Functions

1. `create_wp_post` Returns a tibble with the post ID, URL, content, categories, and tags of the created post. 

# wordpressr 0.2.0 (December 2020)

* Amended Functions

1. `get_wp_posts` Now returns posts in descending order (most recent first)

* Added Functions

1. `delete_wp_pages` Added to allow users to delete WordPress pages. 
2. `get_wp_posts_after` Added to facilitate retrieval of posts beyond a certain date.
3. `create_wp_page` Allows new pages to be created. 

# wordpressr 0.1.1

* Added a `NEWS.md` file to track changes to the package.
