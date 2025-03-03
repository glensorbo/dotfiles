---
id: search_and_replace
aliases:
  - vim
tags:
  - nvim
---

# nvim search and replace

## Search and replace project wide

1. :Ggrep -search term-
2. :cfdo %s/-search term-/-replace term-/gc
3. :cfdo update

Ggrep (grep only git files) will find all places where -search term- is,
cfdo will replace them and cfdo update will save all files
