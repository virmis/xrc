#
# User configuration sourced by interactive shells
#

export LC_ALL=en_US.UTF-8

# Change default zim location
export ZIM_HOME=${HOME}/.xrc/zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Load custom definitions
[[ -d ${HOME}/.xrc/zsh ]] && for config_file (${HOME}/.xrc/zsh/*.zsh) source $config_file
