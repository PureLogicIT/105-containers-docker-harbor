# Prerequisite

## setup git repo for docker
Let save all our work in git to ensure no loss of work in the case the VM goes down.
1. Create a repository
Got to Gittea and create a repository called TerraformCourse_{username}

2. Create local repository and connect to remote
```bash
   mkdir ansible
   cd ansible
   git init
   git add .
   git commit -m "Initial commit of my project"
   git remote add origin <remote_repository_URL>
   git pull
   git push
```