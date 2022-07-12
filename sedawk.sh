#!/bin/bash

# Create copy of passwd file to passwd_new.
# cp passwd passwd_new
cat passwd > passwd_new

# Change shell for user saned
awk -i inplace '/saned/ {gsub("/usr/sbin/nologin", "/bin/bash")}1' passwd_new

# Change shell for user avahi
sed -i '/avahi/s/\/usr\/sbin\/nologin/\/bin\/bash/' passwd_new

# Save only 1-st 3-th 5-th 7-th columns of each string
awk -i inplace -F ":" '{print $1 ":" $3 ":" $5 ":" $7}' passwd_new

# Remove all lines containing word "daemon"
sed -i '/daemon/d' passwd_new

# Change shell for all users with even UID to /bin/zsh
awk -i inplace 'BEGIN {FS = OFS = ":"} {if ($2 % 2 == 0) $4 = "/bin/zsh"} {print $0}' passwd_new