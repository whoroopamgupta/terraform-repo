Terraform - IAC : Automated, low errors
Made by Hashicorp

Earlier Open-Source : Now, Business-Source  License (still OS but can’t copy the code)

To configure, we use HCL i.e. Hashicorp Configuration Language

To Update/Configure Infra, we should use Ansible

With Terraform, we can create :
Local Files
Docker Files
Wordpress Websites
AWS/Azure/GCP Cloud Infra

**Installing Terraform** : https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

**install Chocolatey Fresh**

1. Open **PowerShell as Administrator**.
2. Run this exact command again:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

```

This should install Chocolatey cleanly this time.

---

### Verify Installation

After installation:

1. Close PowerShell, reopen it **as Administrator**.
2. Run:

```powershell
choco -v

```

You should now see the version.

1. Then install Terraform:

```powershell
choco install terraform -y

```

---

**In Terraform, everything is written in the format :**

> **<block> <parameters> {
               <arguments>
}**
> 

1. To start working with terraform, we need to initialise terraform inside a folder with :
| terraform init

1. Connect AWS with Terraform
    
    We Need to Authenticate IAM user by user’s access with terraform :
    
    - Go to AWS
    - IAM
    - Users - Create new user and attach Policies → Give Administartor Access to allow full access
    - Then just ‘Create User’
    - Go back to Users in IAM, select newly created user
    - Go to security credentials
    - Create Access Keys
    - Select CLI
    - Tags not required (for now)
    - Keys are ready now and we will use these to authenticate user with terraform
    - We will need AWS CLI for this :
    
    Download and run the AWS CLI MSI installer for Windows (64-bit):
    
    https://awscli.amazonaws.com/AWSCLIV2.msi
    
    Refer docs otherwise : https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
    
    **Verify Installation :
    aws —version**
    
    > aws-cli/2.27.63 Python/3.13.4 Windows/10 exe/AMD64
    > 
    
    Now, we will configure the access keys in aws cli :
    run - 
    | aws configure
    
    enter user’s (created above) AWS Access Key ID & Secret Access Key 
    
    1. **Now, to connect terraform with aws :**
    We use providers (plugins basically to connect with aws, gcp cloud etc)
    
    We Will use this official provider for this :
    https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    
    We will create a ***terraform.tf***  file in the folder and use the code given there and run ‘terraform init’ 
    
    ![image.png](attachment:f4a334d4-13f7-4909-9fc3-22ca0eb30838:image.png)
    
    ![image.png](attachment:051cc008-1c9a-4a24-8179-c5b810371326:image.png)
    

![image.png](attachment:654a424f-4853-4857-916e-cb24d4145195:image.png)

1. **To create a S3 bucket on aws :**
    - let’s create a ***s3.tf*** file
        
        ![image.png](attachment:054c5822-bbe4-4f8b-a709-a5b0719d542b:image.png)
        

- Run **‘terraform plan’** to check what will be configured.
- Run **‘terraform apply’** to create the bucket.

This will create an S3 bucket in your aws : 

![image.png](attachment:005858fe-76f4-40fa-9e29-285dcb3dc33d:image.png)

We can any such resource - mostly things are available on docs easily :
https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# Creating EC2 with VPC and Security Group

Ofcourse, EC2 would need :
- Security Group → so that we can connect to EC2 instance (port 22)

- VPC → to connect to the internet (we can use default VPC as well)

- Key-Pair → to connect the instance

**Creating Key - Pair :**

- Run command ***‘ssh-keygen’** in the same terminal*
    
    ![image.png](attachment:e4091757-1b41-4bf1-bbe4-9335a2fc7afe:image.png)
    
    Just enter fileName, rest can be empty (for now)
    
    Now, *terra-key & terra-key.pub*(the public key file) is created :
    
    ![image.png](attachment:32005625-5bb1-4b9c-bc99-360fa868ce04:image.png)
    

Now, our task is to let this **key-pair**(the public key file) reach AWS so we start we ***ec2.tf*** file :

![image.png](attachment:29189574-3183-481f-8133-6e258eecc17e:image.png)

Now, let’s use **default VPC** :

(we do not need to pass any argument as we are using default VPC)

![image.png](attachment:debea5ac-9134-45b4-8d2d-aa331ac57e99:image.png)

Now, let’s create **AWS** **Security Group** :

- taking vpc id from default vpc using inter-polation
- port 22 for ingress, tcp protocol & cidr block for everywhere.

![image.png](attachment:2fa43cb7-bd15-4ca2-9e40-8494f02036ac:image.png)

Now, let’s create ***aws_instance*** recource :

![image.png](attachment:ae4c8d6b-3aa4-4d3c-a6b0-6752c2e6d629:image.png)

i made change in file location string for public key(coz earlier it was wrong) and then ran ***‘terraform plan’*** to check what’s being created :

![image.png](attachment:043169c8-1ccb-4be3-943d-37bb9a22ee5d:image.png)

Now, let’s run ***‘terraform apply’***

![image.png](attachment:6ea60c2d-a488-41fc-ac69-288aa4dae49a:image.png)

And here is our EC2 instance running :

![image.png](attachment:73f5d35e-bb06-4f27-97b5-f4e0a1eefe90:image.png)

Now, we can connect to this EC2 instance by copying the ssh command and pasting it into the terminal/powershell :
