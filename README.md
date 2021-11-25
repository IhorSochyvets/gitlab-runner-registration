# gitlab-runner-registration
Deploy EC2 instance using Terraform and install docker, gitlab-runner and register it using Ansible

## Deploy EC2 
AWS CLI needs to be configured to deploy EC2 using Terraform.

## Register GitLab Runner using Ansible

ansible-playbook -i inventory playbookGitLabRunnerRegister.yml
