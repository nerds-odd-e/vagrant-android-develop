#!/bin/bash
set -e

cat > /etc/motd <<EOF
       $VAGRANT_PROJECT_NAME
            ^__^
            (oo)\\_______
            (__)\\       )\\/\\
                ||----w |
                ||     ||

EOF
