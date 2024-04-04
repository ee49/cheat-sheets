### Squashing:

## Squasing at single branch:
```bash git rebase -i HEAD~10
#select which commit to pick or squash
git push --force # if you have already pushed your changes then use origin
```

## Squashing while merging branches:
```bash
#check out the branch into which you want to merge the changes
git checkout release
git merge --squash feature-branch # merges the changes from feature-branch into release
# resolve any conflicts
git commit -m "changes from feature branch were squashed"
git push origin  #remember, you will be pushing the changes to remote release branch.
```

