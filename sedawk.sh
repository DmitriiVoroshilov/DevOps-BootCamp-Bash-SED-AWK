#!/bin/bash

# Create copy of passwd file to passwd_new.
cp passwd passwd_new

# Change shell for user saned and send to pipe
awk 'BEGIN {FS = OFS = ":"} {if ($1 == "saned") $7 = "/bin/bash"} {print $0}' passwd |

# Change shell for user avahi and send to pipe
sed '/avahi/s/\/usr\/sbin\/nologin/\/bin\/bash/' |

# Save only 1-st 3-th 5-th 7-th columns of each string and send to pipe
awk 'BEGIN {FS = OFS = ":"} {print $1,$3,$5,$7}' |

# Remove all lines containing word "daemon" and send to pipe
sed '/daemon/d' |

# Change shell for all users with even UID to /bin/zsh and write output to file
awk 'BEGIN {FS = OFS = ":"} {if ($2 % 2 == 0) $4 = "/bin/zsh"} {print $0}' > passwd_new

# end of torment. god damn!