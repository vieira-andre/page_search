### Overview

This script searches for a specific term across multiple pages of a forum. It leverages parallel processing to speed up the search operation by fetching multiple pages concurrently.

It was motivated by me trying to look for discussions about certain subjects in a forum whose search engine is broken.

### Walk-through

1. Variables:
 - `baseUrl`: This is the base URL for the forum. The placeholder `\{page_number\}` will be replaced by actual page numbers.
 - `searchTerm`: The term you want to search for in the forum pages.
 - `pageLimit`: The number of pages you want the script to scan.