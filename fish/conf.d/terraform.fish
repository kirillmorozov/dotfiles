#!/usr/bin/env fish

# Oh-My-Zsh terraform plugin abbreviations.
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/terraform/terraform.plugin.zsh

abbr -a tf --description='run Terraform' -- terraform
abbr -a tfa --description='apply Terraform changes' -- 'terraform apply'
abbr -a tfc --description='open Terraform console' -- 'terraform console'
abbr -a tfd --description='destroy Terraform resources' -- 'terraform destroy'
abbr -a tff --description='format Terraform files' -- 'terraform fmt'
abbr -a tffr --description='recursively format Terraform files' -- 'terraform fmt -recursive'
abbr -a tfi --description='initialize Terraform' -- 'terraform init'
abbr -a tfir --description='reconfigure Terraform initialization' -- 'terraform init -reconfigure'
abbr -a tfiu --description='upgrade Terraform providers' -- 'terraform init -upgrade'
abbr -a tfiur --description='upgrade and reconfigure Terraform' -- 'terraform init -upgrade -reconfigure'
abbr -a tfo --description='show Terraform outputs' -- 'terraform output'
abbr -a tfp --description='plan Terraform changes' -- 'terraform plan'
abbr -a tfs --description='manage Terraform state' -- 'terraform state'
abbr -a tfsh --description='show Terraform state or plan' -- 'terraform show'
abbr -a tft --description='run Terraform tests' -- 'terraform test'
abbr -a tfv --description='validate Terraform configuration' -- 'terraform validate'
abbr -a tfw --description='manage Terraform workspaces' -- 'terraform workspace'
abbr -a tfwl --description='list Terraform workspaces' -- 'terraform workspace list'
abbr -a tfws --description='select Terraform workspace' -- 'terraform workspace select'
