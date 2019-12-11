#!/bin/bash -
#==============================================================================
#
#          FILE: aliases.sh
#
#         USAGE: ./aliases.sh
#
#        AUTHOR: Janik Tarverdyan <Janik.Tarverdyan@gmail.com>
#  ORGANIZATION: Master Mind LLC
#       CREATED: 10/20/19 07:43:40
#      REVISION:  ---
#==============================================================================

set -o nounset                              # Treat unset variables as an error


#============================================================
#
#  ALIASES AND FUNCTIONS
#
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#  be converted into scripts and removed from here.
#
#============================================================

#--------------------
# Personnal Aliases #
#--------------------

# -> Prevents accidentally clobbering files.
#alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'



#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias l='ls --group-directories-first -h --color -FC'
alias ls='ls -h --color -FC --group-directories-first'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -FC -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ls -all'         #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...



#-------------------------------------------------------------
# Tailoring 'less'
#-------------------------------------------------------------

alias more='less'
export PAGER=less
export LESSCHARSET='utf8'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
                # Use this if lesspipe.sh exists.
export LESS='-i -N -w  -z-4 -g -M -X -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'



#-------------------------------------------------------------
# Spelling typos - highly personnal and keyboard-dependent :-)
#-------------------------------------------------------------

alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'



#-------------------------------------------------------------
# Enable color support of ls and also add handy aliases
#-------------------------------------------------------------
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors & eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias 'grep'='grep --color=auto'
    alias 'fgrep'='fgrep --color=auto'
fi



#-------------------------------------------------------------
# some more ls aliases
#-------------------------------------------------------------
#alias ll='ls -alF'
#alias la='ls -A'
alias open='xdg-open '
#alias cat='pygmentize '


#-------------------------------------------------------------
# Add an "alert" alias for long running commands.  Use like so:
#-------------------------------------------------------------
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'



#-------------------------------------------------------------
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
#-------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
    command source ~/.bash_aliases
fi



#----------------------------------------------------
# Source global definitions (Aliases session_start) #
#----------------------------------------------------

# System
alias 'update'='sudo pacman -Syu'
alias 'install'='sudo pacman -S '
alias 'autoremove'='sudo pacman -Rns $(pacman -Qqtd)'
alias 'VGA-info'='lspci |grep -i VGA'
alias 'root'='sudo -i'
alias 'mkdir'='mkdir -v'
alias 'rmdir'='rmdir -v'
alias 'chown'='chown -v'
alias 'chmod'='chmod -v'
alias rm='rm -vi'
alias edit='vim '
alias clone-site='wget --mirror --convert-links --adjust-extension --page-requisites '


# Aliases that use xtitle
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'


# MySQL Service
alias mysql='mycli'
alias mysql-start='mysql -hlocalhost -uroot'

# Python
#alias python='bpython'


# WP-CLI
alias wp='wp --allow-root'
alias wp-cache='wp cache'                   # Manage the object cache.
alias wp-cap='wp cap'                       # Manage user capabilities.
alias wp-cli='wp cli'                       # Get information about WP-CLI itself.
alias wp-comment='wp comment'               # Manage comments.
alias wp-core='wp core'                     # Download, install, update and otherwise manage WordPress proper.
alias wp-cron='wp cron'                     # Manage WP-Cron events and schedules.
alias wp-db='wp db'                         # Perform basic database operations.
alias wp-eval='wp eval'                     # Execute arbitrary PHP code.
alias wp-eval-file='wp eval-file'           # Load and execute a PHP file.
alias wp-export='wp export'                 # Export content to a WXR file.
alias wp-help='wp help'                     # Get help on WP-CLI, or on a specific. command.
alias wp-import='wp import'                 # Import content from a WXR file.
alias wp-media='wp media'                   # Manage attachments.
alias wp-menu='wp menu'                     # List, create, assign, and delete menus
alias wp-network='wp network'
alias wp-option='wp option'                 # Manage options.
alias wp-plugin='wp plugin'                 # Manage plugins.
alias wp-post='wp post'                     # Manage posts.
alias wp-post-type='wp post-type'           # Manage post types.
alias wp-rewrite='wp rewrite'               # Manage rewrite rules.
alias wp-role='wp role'                     # Manage user roles.
alias wp-scaffold='wp scaffold'             # Generate code for post types, taxonomies, etc.
alias wp-search-replace='wp search-replace' # Search/replace strings in the database.
alias wp-server='wp server'                 # Launch PHP's built-in web server for this specific WordPress installation.
alias wp-shell='wp shell'                   # Interactive PHP console.
alias wp-sidebar='wp sidebar'               # Manage sidebars.
alias wp-site='wp site'                     # Perform site-wide operations.
alias wp-super-admin='wp super-admin'       # List, add, and remove super admins from a network.
alias wp-taxonomy='wp taxonomy'             # Manage taxonomies.
alias wp-term='wp term'                     # Manage terms.
alias wp-theme='wp theme'                   # Manage themes.
alias wp-transient='wp transient'           # Manage transients.
alias wp-user='wp user'                     # Manage users.
alias wp-widget='wp widget'                 # Manage sidebar widgets.
