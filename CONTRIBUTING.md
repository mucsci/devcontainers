# Contributing Guide

This document is intended for developers who want to add new features or
bug fixes to the MUCS Devcontainers repository. It assumes you have some
familiarity with git and Github. It will discuss what a good pull request
(PR) looks like, and the tests that your PR must pass before it can be merged.

## Forking

If you aren't a member of the MUCS organization, then you won't have permission
to push new branches to the repository. First, you should create a
[fork](https://github.com/mucsci/devcontainers#fork-destination-box). This will create a
copy of the repository that you own, and will ensure you can push your
changes up to Github and create pull requests.

## Developing a New Feature

New features should be based on the `main` branch. When you want to create a
new feature, first ensure you have an up-to-date copy of the `main` branch:

    $ git checkout main
    $ git pull origin main

You can now create a new branch to develop your feature on:

    $ git checkout -b feature/<name-of-feature>

Proceed to develop your feature on this branch, and add tests / documentation
that will exercise your new code.

Once your feature is complete and your tests are passing, you can push your
branch to Github and create a PR.

## Developing a Bug Fix

First, check if the change you want to make has been fixed in `main`. If so,
we suggest you either start using the `main` branch, or temporarily apply the
fix to whichever version you are using.

Assuming there is an unsolved bug, first make sure you have an up-to-date copy
of the main branch:

    $ git checkout main
    $ git pull origin main

Then create a new branch for your bug fix:

    $ git checkout -b bugfix/<name-of-bug>

First, add a test that reproduces the bug you have found. Then develop your
bugfix as normal, and ensure to test that the bug has actually been resolved.

Once you are finished, you can push your branch to Github, then create a PR.

## Creating a Pull Request

You can create a new PR [here](https://github.com/mucsci/devcontainers/compare). Github
has a good [guide](https://help.github.com/articles/about-pull-requests/) to PR
basics if you want some more information. Ensure that your PR base is the
`main` branch.

Add a descriptive title explaining the bug you fixed or the feature you have
added, and put a longer description of the changes you have made in the comment
box.

Once your PR has been created, it will be reviewed by the team members.
Providing the branch passes the reviews, it will be merged into the repository.
