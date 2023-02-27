# Enable Antigen
source "$(brew --prefix)/share/antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle "MichaelAquilina/zsh-you-should-use"

antigen bundle agkozak/agkozak-zsh-prompt

antigen apply

# Customize prompt
AGKOZAK_BLANK_LINES=1
AGKOZAK_COLORS_BRANCH_STATUS=green
AGKOZAK_PROMPT_DIRTRIM=3
AGKOZAK_PROMPT_CHAR=( ❯ ❯ ❮ )
AGKOZAK_USER_HOST_DISPLAY=0
AGKOZAK_CUSTOM_SYMBOLS=(
  '%F{yellow}⇣⇡%f'  # Diverged
  '%F{yellow}⇣%f'   # Behind
  '%F{yellow}⇡%f'   # Ahead
  '%F{red}+%f'      # Unstaged
  '%F{red}x%f'      # Deleted
  '%F{red}!%f'      # Modified
  '%F{red}>%f'      # Renamed
  '%F{red}?%f'      # Untracked
  '%F{green}S%f'    # Stashed
)
AGKOZAK_CUSTOM_RPROMPT='%(3V.%F{yellow}(%6v%f%(7V. ${psvar[7]}.)%F{yellow}%)%f.)'

# Better contrast for zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=246"
