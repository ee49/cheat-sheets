## Squashing:

#### Squasing at single branch:
```bash 
#using reset
git reset --soft HEAD~10
git commit -m "Message"


#use Rebase with caution
git rebase -i HEAD~10  #this will change the order in which commits are applied so need to be cautiously
#select which commit to pick or squash
git push --force # if you have already pushed your changes then use origin

```

#### Squashing while merging branches:
```bash
#check out the branch into which you want to merge the changes
git checkout release
git merge --squash feature-branch # merges the changes from feature-branch into release
# resolve any conflicts
git commit -m "changes from feature branch were squashed"
git push origin  #remember, you will be pushing the changes to remote release branch.
```

### to configure ignore file:
```bash 
git config --global core.excludesFile ~/.gitignore
git config --list #view current config
```

### to rename or move a branch:
```bash 
git branch -m master old_master #m for Move
git checkout --orphan old_master
git branch -D old_master
```

#### to modify first commit:
```bash 
git update-ref -d HEAD. #This command deletes the branch we are in. If we are in main, this command will delete the main branch, and all the commits.

#after this, all the changes will show up as added(stagged) but no commits in the repository. 
#to remove all the files staged for commits:
git reset * && git status
```
### Adding alias to a long/frequent git command:
```bash 
git config --global --edit  #under the [alias] section, add this line:
[alias]
    ca = !git add -A && git commit -av
```
### Troubleshooting:
```bash 
#1. Your local repository has diverged and when you pull from the remote, you want to overwrite and point it to origin head
#Run below commands when you are in local repository
git log --oneline --decorate --graph --all   # to view the logs
git pull
git reset --hard origin/master # reset your HEAD in local master repo to  point to origin/master.
```
#### To compare local branch with remote branch
```bash
git getch origin release
git diff --summary FETCH_HEAD <local branch>  # Remote branch can be referenced locally using FETCH_HEAD
git diff FETCH_HEAD # get diff with the working directory
git diff FETCH_HEAD -- mydir/myfile.py


##### When a branch will get diverged?
You make changes on your local branch. And then you pull changes from origin. at this point, your local master branch is updated 
with origin commit. But the changes you made are still unstaged. 
To save your work you save your local master branch. At this point the local master branch is diverged.
in summary, you make changes, without commiting and then pull from origin and then commit your local changes.
