#!/bin/bash

# Put you code here
#!/bin/bash
# ???cp passwd passwd_new
awk 'BEGIN {FS = OFS = ":"} {if ($1 == "saned") $7 = "/bin/bash"} {print $0}' passwd |
sed '/avahi:/s/\/usr\/sbin\/nologin/\/bin\/bash/g' |
awk 'BEGIN {FS = OFS = ":"} {print $1,$3,$5,$7}' |
sed '/daemon/d' |
awk 'BEGIN {FS = OFS = ":"} {if ($2 % 2 == 0) $4 = "/bin/zsh"} {print $0}' > passwd_new 