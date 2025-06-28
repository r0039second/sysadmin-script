#!/bin/bash

# -s silent cURL's output
# -L Follow redirect
# -w custom output format
# -o redirects the HTML output to /dev/null

curl -sL -w "%{http_code}\\n" "http://www.google.com/" -o /dev/null

# Method 2
# curl -o $CURL_OUTPUT -s 0w %{http_code}\\n%{time_total}\\n $URL > $TMP_FILE 2>&1
# cat $TMP_FILE

