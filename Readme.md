# Log Display

## How is it used?

A webserver log is provided and formatted information is return.

## Input and Output types

Input: string

Output: (formatted) string

## Acceptance critera

Given input:
  "/help_page/1 126.318.035.038"

Output should be:
  "/help_page/1 1 visit\n/help_page/1 1 unique view"

Given input:
  "/help_page/1 126.318.035.038\n/help_page/1 543.910.244.929"

Output should be:
  "/help_page/1 2 visits\n/help_page/1 2 unique views"

Given input:
  "/help_page/1 126.318.035.038\n/help_page/1 126.318.035.038"

Output should be:
  "/help_page/1 2 visits\n/help_page/1 1 unique view"

Given input:
  "/help_page/1 126.318.035.038
   /contact 184.123.665.067
   /home 184.123.665.067"

Output should be:
  "/help_page 1 visit /contact 1 visit /home 1 visit\n/help_page 1 unique view /contact 1 unique view /home 1 unique view"

## Edge cases
