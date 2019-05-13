# emacs-daemon
Allow emacs to always run as a daemon.

## Optional: 
`zshrc` or `bashrc` can have the following alias and exports:

```bash
alias e="em -t"  # launch emacs terminal window
alias ec="em -c"  # launch emacs frame
alias vim="e"
alias vi="e"  # its a trap
alias ked="em -k"  # kills any daemon running

# git should use emacs
export ALTERNATE_EDITOR=""
export EDITOR="e"
export VISUAL="ec"
```
