#!/bin/bash

# # Websocket url of cider API
# ws_url="ws://localhost:26369"

# # Helper function that checks dependency
# test_dependency () {
#     if ! command -v "$1" &> /dev/null; then
#         echo "$1 not installed"
#         exit
#     fi

# }

# # Required: cider, websocat, jq
# test_dependency cider
# test_dependency websocat
# test_dependency jq

# websocat $ws_url | jq -r '.data | (.artistName)+" - "+(.name)' 