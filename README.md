# Parcial 2

```terraform
 terraform plan -var-file=variables/dev.tfvars
```

variables

```env
location           = "eastus"
rg-name            = "rg-utb-app"
vn_name            = "vn-parcialapp"
apps_name          = ["app-parcial-1", "app-parcial-2"]
cloud_shell_source = "ip" you azure cloud shell ip
management_ip      = "ip" your laptop ip
````

export ANSIBLE_HOST_KEY_CHECKING=False
`ansible-playbook -i hosts-dev all-playbooks.yml -vvv`
