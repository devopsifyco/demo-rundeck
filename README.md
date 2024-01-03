# demo-rundeck

After checkout the repos you follow step

## Build & run container image with compose file
Run compose file with detach mode:
podman compose up -d

Use this command to stop compose
podman compose down

## Login & config Project
Open browser http://localhost:4440/ with below credential:
username: admin
password: devopsify@demo

# Demos

### Ubuntu: Create project
Step 1: Create project via button Create New Project on http://localhost:4440/menu/home
Step 2: Name your project as "Demo" & click create
Step 3: You will be navigated to http://localhost:4440/project/Demo/nodes/sources
Let's delete the default source "Local"

### Ubuntu: Add Node Sources
Add new Node Source for demo (Linux). Select "File" as source. Chose format resourceyaml
Input File Path: /home/rundeck/resouces.yaml which was added in compose.yml file. Mark Writeable for this node source

### Ubuntu: Add Key Storage for SSH
Open http://localhost:4440/menu/storage?project=Demo
Click on "Add or Upload a Key", select "Enter text" and change to "Upload file". Name your key Eg: keys/project/Demo/demo

In case you does not have exist private key, follow this guide to create one https://devopsify.co/ssh-den-linux-server-khong-can-mat-khau/

### Ubuntu: Config Project use Key Storage
Open http://localhost:4440/project/Demo/configure
Add "keys/project/Demo/demo" to "SSH Password Storage Path". Select privateKey as your "SSH Authentication". In "SSH Key Storage Path" select your added key in previous step. Then Save

### Ubuntu: Run first job
Open http://localhost:4440/project/Demo/jobs. Create "New Job", name it "Check OS version".
In the Workflow tab add steps you want to run http://localhost:4440/project/Demo/job/create#workflow
Add a simple step for execute remote "Command - Execute a remote command". Input "lsb_release -a" for Command then Save.
In tab Nodes, select "Dispatch to Nodes" and input your filter. Eg: tags: ubuntu

Now you can run the job

### Windows: Create project
Step 1: Create project via button Create New Project on http://localhost:4440/menu/home
Step 2: Name your project as "Demo-Win" & click create
Step 3: You will be navigated to http://localhost:4440/project/Demo-Win/nodes/sources
Let's delete the default source "Local"

### Windows: Add Node Sources
Add new Node Source for demo (Windows). Select "File" as source. Chose format resourceyaml
Input File Path: /home/rundeck/resouces-win.yaml which was added in compose.yml file. Mark Writeable for this node source

### Windows: Add Key Storage for login
Open http://localhost:4440/menu/storage?project=Demo-Win
Click on "Add or Upload a Key", select "Key Type" and change to "Password". Enter your password to login Windows client.
Give Name for it. Eg: keys/project/Demo-Win/admin

### Windows: Config Project use Key Storage
Open http://localhost:4440/project/Demo-Win/configure . Select tab "Default Node Executor", Change "WinRM Node Executor Python"
In Python Interpreter, select "python3"
In section Authentication
Authentication Type: ntlm
input your Username: devopsify\Administrator
Password Storage Path. Eg: keys/project/Demo-Win/admin

### Windows: Run first job
Open http://localhost:4440/project/Demo-Win/jobs. Create "New Job", name it "Check OS version".
In the Workflow tab add steps you want to run http://localhost:4440/project/Demo-Win/job/create#workflow
Add a simple step for execute remote "Command - Execute a remote command". Input "(Get-WMIObject win32_operatingsystem) | Select Name, Version" for Command then Save.
In tab Nodes, select "Dispatch to Nodes" and input your filter. Eg: tags: windows

Now you can run the job