# Created by newuser for 5.8.1
function virtual_env_prompt () {
  REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }
}
grml_theme_add_token virtual-env -f virtual_env_prompt '%F{magenta}' '%f'

autoload -U colors && colors
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' !'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git*' formats "%{${fg[cyan]}%}[%{${fg[blue]}%}%b%{${fg[yellow]}%}%m%u%c%{${fg[cyan]}%}]%{$reset_color%}"

zstyle ':prompt:grml:left:setup' items rc change-root newline path virtual-env vcs newline percent
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

HEROKU_AC_ZSH_SETUP_PATH=/home/x0rzavi/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
EDITOR="code --wait"
eval $(DISPLAY=:0 SSH_ASKPASS=/home/x0rzavi/ssh-key keychain --eval --quiet id_ed25519)
