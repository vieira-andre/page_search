### Overview

This script searches for a specific term across multiple pages of a forum. It leverages parallel processing to speed up the search operation by fetching multiple pages concurrently.

It was motivated by me trying to look for discussions about certain subjects in a forum whose search engine is broken.

### Walk-through

1. **Variables**:
 - `baseUrl`: This is the base URL for the forum. The placeholder `\{page_number\}` will be replaced by actual page numbers.
 - `searchTerm`: The term you want to search for in the forum pages.
 - `pageLimit`: The number of pages you want the script to scan.

2. **process_page()**:
    - The function `process_page` takes a page number as its argument.
    - Replaces the `\{page_number\}` placeholder in `baseUrl` with the actual page number.
    - Fetches the content of the URL using `curl`.
    - Checks if the page content contains the `searchTerm` (case-insensitive).
    - If the term is found, the page number is printed.
