
# Shopify dev and nix stuff
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
if [ -e ${HOME}/.nix-profile/etc/profile.d/nix.sh ]; then . ${HOME}/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Zinit


source ${HOME}/.config/broot/launcher/bash/br
