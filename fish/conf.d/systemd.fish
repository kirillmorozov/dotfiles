#!/usr/bin/env fish

# Oh-My-Zsh systemd plugin abbreviations.
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/systemd/systemd.plugin.zsh

set -l user_commands cat get-default help is-active is-enabled is-failed is-system-running list-dependencies list-jobs list-sockets list-timers list-unit-files list-units show show-environment status
for command in $user_commands
    abbr -a "sc-$command" --description="run systemctl $command" -- "systemctl $command"
    abbr -a "scu-$command" --description="run user systemctl $command" -- "systemctl --user $command"
end

set -l sudo_commands add-requires add-wants cancel daemon-reexec daemon-reload default disable edit emergency enable halt import-environment isolate kexec kill link list-machines load mask preset preset-all reenable reload reload-or-restart reset-failed rescue restart revert set-default set-environment set-property start stop switch-root try-reload-or-restart try-restart unmask unset-environment
for command in $sudo_commands
    abbr -a "sc-$command" --description="run systemctl $command with sudo" -- "sudo systemctl $command"
    abbr -a "scu-$command" --description="run user systemctl $command" -- "systemctl --user $command"
end

set -l power_commands hibernate hybrid-sleep poweroff reboot suspend
for command in $power_commands
    abbr -a "sc-$command" --description="run systemctl $command" -- "systemctl $command"
end

abbr -a sc-disable-now --description='disable system service now' -- 'sudo systemctl disable --now'
abbr -a sc-enable-now --description='enable system service now' -- 'sudo systemctl enable --now'
abbr -a sc-failed --description='list failed system services' -- 'systemctl --failed'
abbr -a sc-mask-now --description='mask system service now' -- 'sudo systemctl mask --now'
abbr -a scu-disable-now --description='disable user service now' -- 'systemctl --user disable --now'
abbr -a scu-enable-now --description='enable user service now' -- 'systemctl --user enable --now'
abbr -a scu-failed --description='list failed user services' -- 'systemctl --user --failed'
abbr -a scu-mask-now --description='mask user service now' -- 'systemctl --user mask --now'
