# For terraform

## Setup

- Init terraform

```bash
    cd infra
    tf init
```

- Change value of local.tfvars

```bash
access_token = <your_clouddarkly_access_token>
project_key  = "demo-project"
project_name = "Demo project"
```

## Apply new config

- Every time you change a .tf file you need to run 2 commands to apply the change

```bash
    tf plan -var-file="env/local.tfvars" // Calculating the change
    tf apply -var-file="env/local.tfvars" // Apply the new change
```
