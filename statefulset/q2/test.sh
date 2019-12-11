#########################################################################
# File Name: test.sh
# Description: test.sh
# Author: lkong
# mail: lkong@tencent.com
# Created Time: 2019-11-27 13:37:42
#########################################################################
#!/bin/bash


for i in 0 1; do kubectl -n hor exec web-$i -- sh -c 'echo hello $(hostname) > /usr/share/nginx/html/index.html'; done
