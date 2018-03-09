# Logicmonkey Git Cheat Sheet

Files are [modified] | [staged] | [committed]

## Getting Started
```bash
mkdir myproj
cd myproj
git init
git config --global user.name "Your Name"
git config --global user.email your.name@dotcom.com
git config --list
```

## Working
```bash
git add myfile                       # stages myfile
git commit -m 'meaningful message'   # commits staged changes
git log                              # lists changes
git log --follow myfile              # lists changes on myfile
git commit -am 'meaningful message'  # stage and commit modified files in one go
git commit --amend                   # opens the last commit and adds current changes to it
```

## Undoing
```bash
git checkout -- myfile               # overwrites the modified unstaged copy of myfile
git reset HEAD myfile                # unstages myfile
git reset --hard                     # unstages everything and overwrites with HEAD
git show SOMEHASHVALUE:./myfile      # prints the version of the file on SOMEHASHVALUE
```
## Remotes
```bash
git remote -v                        # details the source of the cloned repo
git push origin master               # sends the local 'master' branch to the remote origin
git pull origin master               # will attempt to merge with local commits
git fetch origin                     # fetch the remote changes [e.g. on branches] but don't merge
git diff origin/master               # show differences. A space works but / invokes 'less'
```
## Branching

        C1 <- C2 <- C3 <- C4
                    ^     ^
                    |     +- (C1 'testing')
                    +- HEAD ('master')
```bash
git branch                           # lists branches
git branch testing                   # creates the 'testing' branch
git checkout testing                 # switches to the 'testing' branch
git checkout -b testing master       # combines those last 2 commands
```
## Fast Forward Merge
Given:

        C1 <- C2 <- C3 <- C4
                    ^     ^
                    |     +- (C1 'testing')
                    +- HEAD ('master')

```bash
git checkout master
git merge testing
```
Results in the HEAD of 'master' advancing:

        C1 <- C2 <- C3 <- C4
                          ^
                          |- (C1 'testing')
                          +- HEAD ('master')

## Recursive/3-Way Merge
Given:

        C1 <- C2 <- C4           ('master')
                \
                 C3 <- C5        ('testing')

C4 is committed to 'master' while work continues on 'testing'

        C1 <- C2 <- C4 <- C6     ('master')
              * \   *    /
                 C3 <- C5        ('testing')
                       *

The merge into C6 requires C4 and C5 and their common ancestor C2

## Feature Branches

        C1 <- C2 <--------------------------------------- C14 ('master')
                \                                        /
                 C3 <- C4 <- C5 <- C7 <- C9 <- C11 <- C13     ('testing')
                               \        / \          /
                                C6 <- C8   C10 <- C12
                              ('feature1', 'feature2')

Most work happens on 'testing' and is merged onto 'master' periodically.
Feature branches come off 'testing' and are short-lived.
```bash
git branch -D feature1               # deletes the 'feature1' branch
```
```bash
git push origin testing              # sends the branch to the remote repo
git push origin :testing             # deletes the branch on the remote
```
## Rebase
3 Way Merge:

        C1 <- C2 <- C4 <- C6     ('master')
                \        /
                 C3 <- C5        ('testing')

Rebase applies the patch of C3 to C4, making C4 the ancestor of C3 and enabling
a Fast Forward Merge and leaving a branch-free linear history:

        C1 <- C2 <- C4
               `      \
                 ` - - C3 <- C5

        C1 <- C2 <- C4 <- C3 <- C5 (fast forward)
        C1 <- C2 <- C4 <- C5 <- C6 (rebased)
```bash
git checkout testing                 # switch to 'testing'
git rebase master                    # apply patches from 'master'
git checkout master                  # go back to 'master'
git merge testing                    # do fast forward merge
```
Never rebase a public branch - the resulting merges will be a nightmare

## Stash
```bash
git stash                            # store files without committing when switching branch
git stash show                       # displays the files in the stash
git stash pop                        # recovers stashed files when returning to the branch
```

## Shell Variables

A merge tool (e.g. diffmerge) can use these temporary filename variables:

    $BASE <- $REMOTE <- $MERGED
          \            /
           `  $LOCAL  '
