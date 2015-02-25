Taisho
======

Taisho is a repo where we keep all of our Chef cookbooks (containing recipes)
for use in AWS OpsWorks.

OpsWorks requires a single git repo containing a `Berksfile` that lists out the
different dependencies.  Since we use separate git repos for all of our
internal repositories, Taisho is very slim on its own.  In practice, all of our
repos are contained in Taisho for easier testing and development across
cookbooks (for example, modifying an nginx cookbook while simultaneously
editing another cookbook that `require`s it)  We accomplis this with a
customized git workflow.

The Taisho Git Workflow
-----------------------

Taisho uses `git subtree` to manage all the different repositories.  Here are
some common examples:

Adding a repo we own:
```shell
git subtree add --prefix wework-cookbook git@github.com:WeConnect/cookbook.git master --squash
git remote add -f wework-cookbook git@github.com:WeConnect/cookbook.git
```

Pulling down updates:
```shell
git fetch wework-cookbook master
git subtree pull --prefix wework-cookbook/ wework-cookbook master --squash
```

Pushing up changes to the upstream repo from Taisho
```shell
git add wework-cookbook/some.file
git commit -m "This commit lives in Taisho"
git subtree push --prefix wework-cookbook/ wework-cookbook master --squash
```

Pulling in changes from an upstream fork
```shell
# git remote add -f other-cookbook git@github.com:Other/cookbook.git
git fetch other-cookbook master
git subtree pull --prefix wework-cookbook/ other-cookbook --squash
# fix conflicts and git commit
git push
git subtree push --prefix wework-cookbook/ wework-cookbook master --squash
```

Note that you can still issue pull requests normally from `git@github.com:WeConnect/cookbook.git` to `git@github.com:Other/cookbook.git`
