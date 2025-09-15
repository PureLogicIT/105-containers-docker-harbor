# 11 Using Version Control - Git

Using version control with docker compose can be very powerfull. Since docker compose can be classifed as IaC (Infrastructur as Code) it's important to treat it like code.

## Basic usage

p. Creating a git repo can be done for any directory. Simply move into that directroy and run the `init` command

```
git init
```

From this point on any changes will be tracked.

p. To view the changes to your repo you can use the `status` command for an overview and the `diff` command for a line by line breakdown

```
git status
git diff
```

p. Once you are at a point where you want to commit the changes you made, the first step is to add the files that you want to track in this commit
```
git add docker-compose.yml
```
You can use a `.` instead of a file name to add all the modified files from the current directory
```
git add .
```

Now you want to run the `commit` command with a description of the changes you just made.

```
git commit -m "Update MySQL to version 8.0.23"
```

If you’re using an external git repository with issue tracking you can link the commits to the issues/features by referencing the id.

````
git commit -m "Fixes #1375 added missing environment variable"
```

## Branching

The best way of keeping your git history clean is utilising branches. Every new feature or bug to fix should be getting their own branch. Then you can test that branch in dev and once it's working as intended merge it back to your master/main branch for production.

To create a branch
```
git branch 1-upgrading-mysql
```

To view all current branches
```
git branch
```

Once you confirmed that everything is working and it's time to merge back into the main branch.
```
git checkout master
git merge 1-upgrading-mysql
```

This may cause merging conflicts if git can't figure out how to deal with the changes. To fix them edit the files with conflicts. You'll see something like this.
```
<<<<<<< HEAD
image: mysql:8.0.21
=======
image: mysql:8.0.23
>>>>>>> 1-upgrading-mysql
```
Simply delete all the text that you don't want to keep, only leaving the newer content.

```
image: mysql:8.0.23
```
Then add the files and commit the merger
```
git add .
git commit -m "Merged 1-upgrading-mysql with master"
```

You want to break down your commits to specific features or bugs, so that if a feature commit is no longer required or obsolete, it can be removed without breaking your deployment. Ex: If your feature is updating the version of the database to the latest. Only update the database and make the required changes for that new version. Don't also fix a typo on the volume name of the web application, because if that new version of the database ends up not being compatible and you need to revert the change, you don't want to accidently re-introduce other issues into the deployment.
