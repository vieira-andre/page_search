#!/bin/bash

baseUrl="https://url.com/p-{page_number}"
searchTerm="search_term"
pageLimit=10

process_page() {
    url=$(echo "${baseUrl}" | sed "s/{page_number}/${1}/")
    echo "Processing: ${url}" >&2
    
    pageContent=$(curl -s "$url")
    
    if echo "$pageContent" | grep -qi "$searchTerm"; then
        echo "$1"
    fi
}

export -f process_page
export baseUrl
export searchTerm

pagesWithTerm=$(seq 2 $pageLimit | xargs -P10 -I {} bash -c 'process_page "$@"' _ {})

pagesWithTerm=$(echo "$pagesWithTerm" | tr '\n' ',')

pagesWithTerm=$(echo "$pagesWithTerm" | sed 's/,$//' | sed 's/,/, /g')

echo -e "\nPages containing the term '${searchTerm}': ${pagesWithTerm}"
