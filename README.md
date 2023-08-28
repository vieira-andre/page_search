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

3. **Parallel processing**:
    - The `xargs` command is used to process multiple pages concurrently (up to 10 in parallel as specified by `-P10`).
    - The `seq` command generates a sequence of numbers starting from 2 up to the specified `pageLimit`.

4. **Output formatting**:
    - Page numbers containing the term are combined into a comma-separated list.

### Output

At the end, the script will display something like:

```
Pages containing the term 'search_term': 2, 3, 5
```
