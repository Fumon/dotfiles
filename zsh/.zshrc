
ISDARWIN=$([ $(uname) = "Darwin" ])
if $ISDARWIN; then
	# Shopify dev and nix stuff
	[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
	if [ -e ${HOME}/.nix-profile/etc/profile.d/nix.sh ]; then . ${HOME}/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
fi

# --- History
setopt share_history hist_ignore_space extended_history hist_reduce_blanks
setopt hist_ignore_all_dups hist_ignore_dups hist_expire_dups_first hist_find_no_dups hist_save_no_dups
HISTFILE=${HOME}/.config/zsh/histfile
HISTSIZE=40000
SAVEHIST=35000
setopt interactive_comments # For hashtags in history

# --- Keymap
bindkey -e # Emacs default

# --- Completion
setopt hist_verify # Don't execute immediately on completion

# > Complist
zmodload -i zsh/complist
setopt auto_menu auto_list
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '--- %d ---'

autoload -Uz compinit
# This check is needed since I use a company managed macbook
if $ISDARWIN; then
    compinit -u
else
    compinit
fi

# --- Misc
setopt autocd extendedglob notify


# --- Path and aliases
source ${HOME}/.config/broot/launcher/bash/br
