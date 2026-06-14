#!/usr/bin/env fish

# Oh-My-Zsh terraform plugin abbreviations.
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/terraform/terraform.plugin.zsh

abbr -a tf -- terraform
abbr -a tfa -- 'terraform apply'
abbr -a tfc -- 'terraform console'
abbr -a tfd -- 'terraform destroy'
abbr -a tff -- 'terraform fmt'
abbr -a tffr -- 'terraform fmt -recursive'
abbr -a tfi -- 'terraform init'
abbr -a tfir -- 'terraform init -reconfigure'
abbr -a tfiu -- 'terraform init -upgrade'
abbr -a tfiur -- 'terraform init -upgrade -reconfigure'
abbr -a tfo -- 'terraform output'
abbr -a tfp -- 'terraform plan'
abbr -a tfs -- 'terraform state'
abbr -a tfsh -- 'terraform show'
abbr -a tft -- 'terraform test'
abbr -a tfv -- 'terraform validate'
abbr -a tfw -- 'terraform workspace'
abbr -a tfwl -- 'terraform workspace list'
abbr -a tfws -- 'terraform workspace select'
