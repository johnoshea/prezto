#
# Sets directory options and defines directory aliases.
#
# Authors:
#   James Cox <james@imaj.es>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Options
#

setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>.
                            # Use >! and >>! to bypass.

#
# Aliases
#

alias d='dirs -v'
for index ({1..30}) alias "$index"="cd +${index}"; unset index


HISTORY_IGNORE='((ls|ll|la|l|clear|cd|tmux|alias|pwd|exit|fc|df|ps|top|history|[bf]g|vim|[mn]vim|zsh|bash)|((ls|rm|mv|rmdir|cat|ll|cd|tmux|fc|history|which|killall|kill|dircolors) *))'


 # skip adding "cd" commands to history
function zshaddhistory() {
    if [[ $1 = cd\ * ]]; then
        return 1
    fi
}

# add a "cd <absolute path>" to history whenever the working directory changes
function chpwd() {
    escaped_dir=$(printf %q "$(pwd)") # escape spaces in directory names
    print -rs "cd $escaped_dir"
}
